package net.xzh.redis.common.exception;

import net.xzh.redis.common.model.IErrorCode;

/**
 * 断言处理类，用于抛出各种API异常
 * 
 * @author Administrator
 *
 */

public class Asserts {
	public static void fail(String message) {
		throw new ApiException(message);
	}

	public static void fail(IErrorCode errorCode) {
		throw new ApiException(errorCode);
	}
}
