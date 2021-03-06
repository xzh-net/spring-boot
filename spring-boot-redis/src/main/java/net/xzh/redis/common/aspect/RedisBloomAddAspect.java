package net.xzh.redis.common.aspect;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.reflect.MethodSignature;
import org.redisson.api.RBloomFilter;
import org.redisson.api.RedissonClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.DefaultParameterNameDiscoverer;
import org.springframework.expression.EvaluationContext;
import org.springframework.expression.Expression;
import org.springframework.expression.spel.standard.SpelExpressionParser;
import org.springframework.expression.spel.support.StandardEvaluationContext;
import org.springframework.stereotype.Component;

import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import net.xzh.redis.common.annotation.RedisBloomAdd;

/**
 * RedisBloomAdd拦截器
 * @author CR7
 *
 */
@Aspect
@Component
public class RedisBloomAddAspect {


    @Autowired
    private RedissonClient redisson;

    public RedisBloomAddAspect() {
    }

    /**
     * 用于SpEL表达式解析.
     */
    private SpelExpressionParser spelExpressionParser = new SpelExpressionParser();
    /**
     * 用于获取方法参数定义名字.
     */
    private DefaultParameterNameDiscoverer nameDiscoverer = new DefaultParameterNameDiscoverer();

    @After("@annotation(redisBloomAdd)")
    public void afterMethod(JoinPoint joinPoint, RedisBloomAdd redisBloomAdd) {
        // 获取布隆过滤器
        RBloomFilter<String> bloomFilter = redisson.getBloomFilter(redisBloomAdd.key());
        if (!bloomFilter.isExists()) {
        	// 初始化布隆过滤器，预计统计元素数量为5000000L，期望误差率为0.03
            bloomFilter.tryInit(5000000L, 0.03);
        }
        MethodSignature methodSignature = (MethodSignature) joinPoint.getSignature();
        String value = StrUtil.EMPTY;
        if (redisBloomAdd.value().contains("#")) {
            // 验证数据是否存在
            value = getValBySpEL(redisBloomAdd.value(), methodSignature, joinPoint.getArgs());
        }
        if(StrUtil.isNotBlank(value) && !bloomFilter.contains(value)){
            bloomFilter.add(value);
        }
    }

    /**
     * 解析spEL表达式
     */
    private String getValBySpEL(String spEL, MethodSignature methodSignature, Object[] args) {
        //获取方法形参名数组
        String[] paramNames = nameDiscoverer.getParameterNames(methodSignature.getMethod());
        if (paramNames != null && paramNames.length > 0) {
            Expression expression = spelExpressionParser.parseExpression(spEL);
            // spring的表达式上下文对象
            EvaluationContext context = new StandardEvaluationContext();
            // 给上下文赋值
            for (int i = 0; i < args.length; i++) {
                context.setVariable(paramNames[i], args[i]);
            }
            Object value = expression.getValue(context);
            return ObjectUtil.isNotEmpty(value) ? StrUtil.toString(value) : StrUtil.EMPTY;
        }
        return null;
    }

}
