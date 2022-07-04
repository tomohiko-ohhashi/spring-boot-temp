package com.temp;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;

import com.temp.auth.LoggingFilter;

/**
 *
 * ログイン処理
 * @see <a href="https://qiita.com/suke_masa/items/908805dd45df08ba28d8">Spring Security 5.7でセキュリティ設定の書き方が大幅に変わる件 - Qiita</a>
 * @see <a href="https://github.com/MasatoshiTada/spring-security-intro">サンプルコード: Spring Security Intro</a>
 *
 * API作成
 * @see <a href="https://spring.pleiades.io/guides/gs/rest-service/">Spring Boot REST API の作成 - 公式サンプルコード</a>
 *
 */
@SpringBootApplication
public class TempApplication {

    public static void main(String[] args) {
        SpringApplication.run(TempApplication.class, args);
    }

    @Bean
    FilterRegistrationBean<?> loggingFilter() {
        FilterRegistrationBean<LoggingFilter> registrationBean = new FilterRegistrationBean<>(new LoggingFilter());
        registrationBean.setOrder(Integer.MIN_VALUE);
        registrationBean.addUrlPatterns("/*");
        return registrationBean;
    }
}
