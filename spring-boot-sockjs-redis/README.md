# WebSocket聊天室集群

如果一个服务器最多支持1000个用户同时聊天，此时服务器突然挂了，1000个用户瞬间全部掉线

分布式为了解决单点故障，当聊天室改为集群后，就算服务器A挂了，服务器B上聊天的用户还可以继续聊天，并且在前端还能通过代码，让连接A的用户快速重连至存活的服务器B

单机的聊天室，接收消息是通过Controller直接把消息转发到所有人的频道上。在集群中，我们需要服务器把消息从Redis中订阅出来后，基于SimpMessageSendingOperations接口（或者使用SimpMessagingTemplate ）向订阅此目的地的所有用户都发送消息

- 聊天室集群中的全体用户发消息——Redis的订阅/发布
- 用户上下线通知——Redis订阅发布
- 用户信息维护——Redis集合

访问地址：http://localhost:8080/

```bash
mvn clean compile
mvn clean package
```


