package net.xzh.jwt.service;

import java.text.ParseException;

import com.nimbusds.jose.JOSEException;
import com.nimbusds.jose.jwk.RSAKey;

import net.xzh.jwt.domain.PayloadDto;

/**
 * Created 2020/6/22.
 */
public interface JwtTokenService {

    /**
     * 使用HMAC算法生成token
     */
    String generateTokenByHMAC(String payloadStr, String secret) throws JOSEException;

    /**
     * 使用HMAC算法校验token
     */
    PayloadDto verifyTokenByHMAC(String token, String secret) throws ParseException, JOSEException;

    /**
     * 使用RSA算法生成token
     */
    String generateTokenByRSA(String payloadStr, RSAKey rsaKey) throws JOSEException;

    /**
     * 使用RSA算法校验token
     */
    PayloadDto verifyTokenByRSA(String token, RSAKey rsaKey) throws ParseException, JOSEException;

    /**
     * 获取默认payload
     */
    PayloadDto getDefaultPayloadDto();

    /**
     * 获取默认的RSAKey
     */
    RSAKey getDefaultRSAKey();
}
