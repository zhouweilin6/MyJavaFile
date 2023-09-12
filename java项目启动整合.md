# springboot整合mybatis步骤

## 1.添加依赖



```java
<parent>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-parent</artifactId>
        <version>2.7.9</version>
        <relativePath/>
    </parent>
    <groupId>org.example</groupId>
    <artifactId>redis-heima2</artifactId>
    <version>1.0-SNAPSHOT</version>
    <properties>
        <java.version>1.8</java.version>
    </properties>
    <dependencies>
<dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-web</artifactId>
        </dependency>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-actuator</artifactId>
        </dependency>

        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter</artifactId>
        </dependency>

        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-test</artifactId>
            <scope>test</scope>
        </dependency>

        <dependency>
            <groupId>org.mybatis.spring.boot</groupId>
            <artifactId>mybatis-spring-boot-starter</artifactId>
            <version>2.1.4</version>
        </dependency>
        <dependency>
            <groupId>com.alibaba</groupId>
            <artifactId>druid-spring-boot-starter</artifactId>
            <version>1.1.10</version>
        </dependency>
        <!--mysql-connector-java-->
        <dependency>
            <groupId>mysql</groupId>
            <artifactId>mysql-connector-java</artifactId>
            <version>8.0.23</version>
        </dependency>
        <!--jdbc-->
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-jdbc</artifactId>
        </dependency>

        <dependency>
            <groupId>org.projectlombok</groupId>
            <artifactId>lombok</artifactId>
            <optional>true</optional>
        </dependency>
    </dependencies>
```

## 2.配置文件applicaion.yml配置

```java

server:
  port: 8080

spring:
  application:
    name: cloud-payment-service
  datasource:
    type: com.alibaba.druid.pool.DruidDataSource            # 当前数据源操作类型
    driver-class-name: com.mysql.cj.jdbc.Driver              # mysql驱动包 com.mysql.jdbc.Driver
    url: jdbc:mysql://localhost:3306/bjpowernode
    username: root
    password: 123456


mybatis:
  mapperLocations: classpath:mapper/*.xml
  type-aliases-package: com.entities    # 所有Entity别名类所在包



```

## 3.配置mapper文件

```java
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper
        PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
        "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="com.dao.StudentDao">

    <select id="selectStudents" resultType="com.entities.Student">
        select * from student;
    </select>

</mapper>
```

## 4.配置接口

  主启动类上添加@MapperScan(“dao接口所在的包”)

   dao接口上添加@Mapper注解

# springboot整合redis步骤

## 1.添加依赖

```java
<!--Jackson依赖-->
        <dependency>
            <groupId>com.fasterxml.jackson.core</groupId>
            <artifactId>jackson-databind</artifactId>
        </dependency>
        <!--redis依赖-->
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-data-redis</artifactId>
        </dependency>
        <dependency>
            <groupId>redis.clients</groupId>
            <artifactId>jedis</artifactId>
            <version>3.7.0</version>
        </dependency>
        <!--common-pool-->
        <dependency>
            <groupId>org.apache.commons</groupId>
            <artifactId>commons-pool2</artifactId>
        </dependency>
```

## 2.配置文件redis

```java

server:
  port: 8080

spring:
  application:
    name: cloud-payment-service
  datasource:
    type: com.alibaba.druid.pool.DruidDataSource            # 当前数据源操作类型
    driver-class-name: com.mysql.cj.jdbc.Driver              # mysql驱动包 com.mysql.jdbc.Driver
    url: jdbc:mysql://localhost:3306/bjpowernode
    username: root
    password: 123456
  redis:
    host: 192.168.142.158
    port: 6379
    lettuce:
      pool:
        max-active: 8
        max-idle: 8
        min-idle: 0
        max-wait: 100ms


mybatis:
  mapperLocations: classpath:mapper/*.xml
  type-aliases-package: com.entities    # 所有Entity别名类所在包

```

## 3.配置类编写

```java
package com.config;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.PropertyAccessor;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.cache.CacheManager;
import org.springframework.cache.annotation.CachingConfigurerSupport;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.cache.RedisCacheConfiguration;
import org.springframework.data.redis.cache.RedisCacheManager;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.Jackson2JsonRedisSerializer;
import org.springframework.data.redis.serializer.RedisSerializationContext;
import org.springframework.data.redis.serializer.RedisSerializer;
import org.springframework.data.redis.serializer.StringRedisSerializer;

import java.time.Duration;

@EnableCaching
@Configuration
public class RedisConfig extends CachingConfigurerSupport {
    @Bean
    public RedisTemplate<String, Object> redisTemplate(RedisConnectionFactory factory) {
        RedisTemplate<String, Object> template = new RedisTemplate<>();
        RedisSerializer<String> redisSerializer = new StringRedisSerializer();
        Jackson2JsonRedisSerializer jackson2JsonRedisSerializer = new Jackson2JsonRedisSerializer(Object.class);
        ObjectMapper om = new ObjectMapper();
        om.setVisibility(PropertyAccessor.ALL, JsonAutoDetect.Visibility.ANY);
        om.enableDefaultTyping(ObjectMapper.DefaultTyping.NON_FINAL);
        jackson2JsonRedisSerializer.setObjectMapper(om);
        template.setConnectionFactory(factory);
//key序列化方式
        template.setKeySerializer(redisSerializer);
//value序列化
        template.setValueSerializer(jackson2JsonRedisSerializer);
//value hashmap序列化
        template.setHashValueSerializer(jackson2JsonRedisSerializer);
        return template;
    }

    @Bean
    public CacheManager cacheManager(RedisConnectionFactory factory) {
        RedisSerializer<String> redisSerializer = new StringRedisSerializer();
        Jackson2JsonRedisSerializer jackson2JsonRedisSerializer = new Jackson2JsonRedisSerializer(Object.class);
//解决查询缓存转换异常的问题
        ObjectMapper om = new ObjectMapper();
        om.setVisibility(PropertyAccessor.ALL, JsonAutoDetect.Visibility.ANY);
        om.enableDefaultTyping(ObjectMapper.DefaultTyping.NON_FINAL);
        jackson2JsonRedisSerializer.setObjectMapper(om);
// 配置序列化（解决乱码的问题）,过期时间600秒
        RedisCacheConfiguration config = RedisCacheConfiguration.defaultCacheConfig()
                .entryTtl(Duration.ofSeconds(600))
                .serializeKeysWith(RedisSerializationContext.SerializationPair.fromSerializer(redisSerializer))
                .serializeValuesWith(RedisSerializationContext.SerializationPair.fromSerializer(jackson2JsonRedisSerializer))
                .disableCachingNullValues();
        RedisCacheManager cacheManager = RedisCacheManager.builder(factory)
                .cacheDefaults(config)
                .build();
        return cacheManager;
    }
}

```

## 4.注意事项

redis空指针异常，需要spring的主动注入装配，在service,component注解下，RedisTemplate可以使用。

### 4.1缓存更新策略

![image-20230612135302173](C:\Users\86184\AppData\Roaming\Typora\typora-user-images\image-20230612135302173.png)

## 5.缓存的各种问题

### 5.1缓存穿透

![image-20230622165136344](C:\Users\86184\AppData\Roaming\Typora\typora-user-images\image-20230622165136344.png)

### 5.2缓存雪崩

![image-20230622165718475](C:\Users\86184\AppData\Roaming\Typora\typora-user-images\image-20230622165718475.png)

5.3缓存击穿

![image-20230622173818483](C:\Users\86184\AppData\Roaming\Typora\typora-user-images\image-20230622173818483.png)

## 6.分布式锁的处理方式

![image-20230625135309834](C:\Users\86184\AppData\Roaming\Typora\typora-user-images\image-20230625135309834.png)使用lua脚本实现原子性

![image-20230625152717407](C:\Users\86184\AppData\Roaming\Typora\typora-user-images\image-20230625152717407.png)





# springboot的各种注解

## 1.RequestParam注解

作用：

当浏览器向服务器发起请求时，请求中可能会包含一些参数，例如查询字符串或表单数据。使用@RequestParam注解可以将这些请求参数的值映射到控制器方法的参数上，从而方便地获取和使用这些参数。

@RequestParam注解有以下属性：

value：请求参数的名称。如果请求参数的名称与方法参数的名称相同，则该属性可以省略。

required：指定请求参数是否是必需的，默认为true。如果设置为false，则表示该参数是可选的。

defaultValue：指定当请求参数未提供时使用的默认值。

例子1：

```java
@RequestMapping("/hello")
public String hello(@RequestParam("name") String name, @RequestParam(value = "age", required = false, defaultValue = "0") int age) {
    System.out.println("Hello " + name + ", you are " + age + " years old.");
    return "hello";
}
```

在上面的示例中，我们使用@RequestParam注解将"name"和"age"请求参数映射到控制器方法的"name"和"age"参数上。我们还指定了"age"参数是可选的，并且当请求中未提供"age"参数时使用默认值0。

@RequestParam注解是Spring MVC框架中用于绑定HTTP请求参数到方法参数的注解。它的作用是告诉Spring MVC框架要从HTTP请求中获取特定名称的参数，并将其赋值给注解所标注的方法参数。

例子2:

具体来说，@RequestParam注解可以用于以下场景：
将URL路径中的参数绑定到方法参数中
例如，对于URL /users/1，可以使用@RequestParam注解将路径中的1绑定到方法参数中，如下所示：

```java
@GetMapping("/users/{id}")
public User getUser(@RequestParam("id") Long userId) {
    // 方法体
}
```

设置默认值
如果请求中没有指定某个参数，可以使用@RequestParam注解设置一个默认值，如下所示：

```java
@GetMapping("/users")
public List<User> getUsers(@RequestParam(value = "page", defaultValue = "0") int page) {
    // 方法体
}
```

@RequestParam就这样子的写法没有（）这样子写的作用是什么

```
@RequestParam注解有两种不同的使用方式，分别是带括号和不带括号的写法。它们的作用是相同的，只是写法略有不同。
带括号的写法是@RequestParam(“参数名”)，其中参数名是请求中的参数名称。这种写法显式地声明了要绑定的参数名，同时也可以指定一些可选的属性，例如默认值和是否必需。这种写法通常用于绑定URL路径中的参数或查询参数。

不带括号的写法是@RequestParam参数类型
参数名，其中参数类型是方法参数的类型，参数名是请求中的参数名称。这种写法也可以显式地声明要绑定的参数名，同时还可以指定其他可选属性。这种写法通常用于绑定请求体中的参数，例如POST请求中的表单数据或JSON数据。

虽然这两种写法的作用是相同的，但它们的使用场景略有不同。带括号的写法通常用于绑定URL路径中的参数或查询参数，而不带括号的写法通常用于绑定请求体中的参数。在实际使用中，可以根据需要选择适合的写法。
```

为什么涉及到跨服务调用必须带上这个注解:

```
不是所有跨服务调用都必须带上@RequestParam注解，这取决于具体的实现方式和通信协议。但是，在某些情况下，使用@RequestParam注解可以提高跨服务调用的可靠性和可维护性。

跨服务调用通常使用一些常见的通信协议，例如RESTful
API或SOAP。在这些协议中，客户端向服务器发送HTTP请求，请求中包含一些参数和数据。服务器在接收到请求后，需要从请求中解析出这些参数和数据，以便正确处理请求。

如果在请求中没有指定参数，或者参数格式错误，服务器可能会返回错误响应或执行不正确的操作。为了避免这种情况，我们可以使用@RequestParam注解来显式地声明需要哪些参数，并指定它们的类型和默认值。这可以确保服务器能够正确解析请求，并执行所需的操作。

此外，使用@RequestParam注解还可以提高代码的可维护性。通过显式地声明需要哪些参数，我们可以更清晰地定义接口和方法，使得代码更易于理解和修改。如果我们没有使用@RequestParam注解，请求参数可能会隐式地传递到方法中，这可能会导致代码混乱和难以维护。

综上所述，虽然@RequestParam注解不是必须的，但在跨服务调用中使用它可以提高可靠性和可维护性，从而更好地处理HTTP请求和响应。
```

## 2.RequestBody注解

什么是@RequestBody注解?

在 Spring Boot 中，@RequestBody 注解用于获取 HTTP 请求体中的数据，并将其转换为指定的 Java 对象。通常在处理 POST 或 PUT 请求时，请求体中包含客户端提交的数据，@RequestBody 注解可以将这些数据转换为相应的 Java 对象，方便我们在控制器中进行处理。

## @RequestBody注解的基本使用

> 使用 @RequestBody 注解时，我们需要将它作为控制器方法的参数之一，并指定转换后的 Java 对象类型。例如，假设我们有一个 User 类，它包含 id、name 和 email 三个属性：
>
> 
>
> ```java
> public class User {
>     private Long id;
>     private String name;
>     private String email;
>     // getters and setters
> }
> ```
>
> 我们可以在控制器方法上使用 @RequestBody 注解，以将 HTTP 请求体中的[数据转换](https://so.csdn.net/so/search?q=数据转换&spm=1001.2101.3001.7020)为 User 对象：
>
> ```java
> @PostMapping("/users")
> public ResponseEntity<User> createUser(@RequestBody User user) {
>     // 处理 POST 请求，并返回数据
> 
> }
> ```
>
> 在上面的代码中，我们通过 @PostMapping 注解定义了一个 POST 请求路由，并使用 @RequestBody 注解将 HTTP 请求体中的数据转换为 User 对象。当客户端发送一个 HTTP POST 请求时，请求体中包含 JSON 或 XML 格式的数据，该数据将自动映射到 User 对象中，并传递给 createUser 方法进行处理。





@RequestBody注解的注意事项:

使用 @RequestBody 注解时，需要注意以下几点：

- 请求体中的数据必须符合指定的 Java 对象的格式，否则会发生转换错误；
- 如果请求体中的数据是 JSON 或 XML 格式，需要使用相关的框架进行解析，例如 Jackson 或 JAXB；
- @RequestBody 注解只能用于处理 POST 或 PUT 请求，不能用于处理 GET 或 DELETE 请求；
- 如果请求体中的数据太大，可能会影响性能和安全性，因此应该限制请求体的大小。
- @RequestBody 注解只获取 HTTP 请求体中的数据，并将其转换为指定的 Java 对象，而不是获取请求体的所有内容。通常在处理 POST 或 PUT 请求时，请求体中包含客户端提交的数据，@RequestBody 注解可以将这些数据转换为相应的 Java 对象，方便我们在控制器中进行处理。如果需要获取请求体的其他信息，可以使用其他的注解或方法来实现，例如 @RequestHeader 注解可以获取请求头信息，getRequestURI() 方法可以获取请求的 URI 等等。

## 3.@CrossOrigin

```java
//@CrossOrigin是用于跨域问题的注解
@RestController
public class DataController {
    @GetMapping("/data/test")
    @CrossOrigin
    public Result dataSend() throws JsonProcessingException {
      /*  ObjectMapper mapper=new ObjectMapper();
        String jsonStr = mapper.writeValueAsString("nihao");*/
        User user=new User(23,"zhangsan");
        ObjectMapper mapper=new ObjectMapper();
        String jsonStr = mapper.writeValueAsString(user);
        return new Result(true,user);
    }
}

```

# javaWeb基础

## 1.session

```
   1.概念：服务器端会话技术，一次会话的多次请求间共享数据，将数据保存在服务器端的HttpSession对象中
    2.基本方法
        1.获取HttpSession对象
            HttpSession session = request.getSession();
        2.使用HttpSession对象
            Object getAttribute(String name)
            void setAttribute(String name, Object value)
            void removeAttribute(String name)
    3.基本原理：
        Session的实现依赖于Cookie
        步骤：
            1.服务器端第一次获取HttpSession对象，没有
                cookie，会在内存中创建一个新的HttpSession对象，
                并且会产生一个唯一的SessionID，通过set-cookie响应头
                返回该SessionID
            2.再次访问服务器端，通过请求头的cookie，携带SessionID到
                服务器端，并且按照该SessionID查找内存中是否有一个
                该id的HttpSession对象，如果有，则getSession()将该对象
                返回给HttpSession引用，就获取到了该对象
            注意：所以获取的session是同一个
    4.细节：
        1.当客户端关闭后，服务器不关闭，两次获取session是同一个吗
            不是，因为当客户端关闭后，客户端中cookie中的JSESSIONID会消失，
                打开浏览器后，再次请求服务器时候，不会携带JSESSIONID的cookie，
                也就找不到服务器中的那个session对象了
            如果需要在关闭浏览器后，仍可以获取同一个session，需要设置JSESSIONID以及最大存活时间(持久化)
                Cookie jsessionid = new Cookie("JSESSIONID", session.getId());
                jsessionid.setMaxAge(60*60);
                response.addCookie(jsessionid);
        2.客户端不关闭，服务器关闭后，两次获取session是同一个吗
            不是，服务器关闭后，内存中的session对象会被销毁
                为了服务器session中数据不丢失：
                    session的钝化：
                        在服务器正常关闭后，将获取的session对象序列化到硬盘上
                    session的活化：
                        在服务器启动后，将session文件转化为内存中的session对象
                注意：部署项目时，用本地tomcat，因为它会自动进行session对象的序列化和反序列化
        3.session什么时候被销毁
            1.服务器非正常关闭(正常关闭会被序列化)
            2.session对象调用invalidate()
            3.session默认失效时间30分钟
                选择性配置
                    在tomcat的apache-tomcat-8.5.31\conf下的web.xml中设置
                        <session-config>
                            <session-timeout>设置存活时间(分钟)</session-timeout>
                        </session-config>
    5.session的特点：
        1.session用于存储一次会话的多次请求的数据，存在服务器
        2.session可以存储任意类型，任意大小的数据
        session与cookie的区别
            1.session存储数据在服务器端，cookie在客户端
            2.session没有数据大小限制，cookie有限制4kb
            3.session数据安全，cookie相对不安全
```

![image-20230610143245278](C:\Users\86184\AppData\Roaming\Typora\typora-user-images\image-20230610143245278.png)

第一次请求时，服务器会创建一个session对象，并且同时给session对象生成一个id,然后服务器会将session的id发送给浏览器，浏览器会把id存到内存中，即cookie中的jessionID



第一次请求时，JessionId在reponse请求体中，request中没有，第二次请求时，sessionID在request中，resonse没有。



JESSIONID=xxxxxxx是以cookie的形式保存在浏览器的内存中，浏览器只要关闭，这个cookie对象就没有了



![image-20230610150644111](C:\Users\86184\AppData\Roaming\Typora\typora-user-images\image-20230610150644111.png)

# spring

自定义拦截器中不能使用spring注入，不能使用Resource，Autworid







# JSON的几种处理方式

## 1.springmvc默认的处理方式

springmvc自带jackson的依赖

```java
private static final ObjectMapper mapper=new ObjectMapper()
//序列化
User user=new User();
mapper.writeValueAsString(user);
//获取数据
String jsonUser=stringRedisTemplate.opsForValue().get("user");
//反序列化
User user=mapper.readValue(jsonUser,User.class);
```

## 2.jackson的处理方式

### 2.1添加依赖

```
<dependency>
  <groupId>com.fasterxml.jackson.core</groupId>
  <artifactId>jackson-core</artifactId>
  <version>2.9.6</version>
</dependency>

<dependency>
  <groupId>com.fasterxml.jackson.core</groupId>
  <artifactId>jackson-annotations</artifactId>
  <version>2.9.6</version>
</dependency>

<dependency>
  <groupId>com.fasterxml.jackson.core</groupId>
  <artifactId>jackson-databind</artifactId>
  <version>2.9.6</version>
</dependency>
```

### 2.2使用步骤

```java
ObjectMapper mapper=new ObjectMapper()
mapper.writeValueAsString(user);
mapper.readValue(jsonUser,User.class);
```

# Redis

## 1.分布式锁

1.1分布式锁 可使用setnx命令，使用lua脚本实现原子性操作

​                      进阶使用hset   可重入锁的问题