package net.xzh.k8s.common.model;

/**
 * 封装API的错误码
 * Created by macro on 2019/4/19.
 */
public interface IErrorCode {
    long getCode();

    String getMessage();
}
