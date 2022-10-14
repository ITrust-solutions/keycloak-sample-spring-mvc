package pl.konrad.keycloaksamplespringmvc.config;

import org.keycloak.adapters.springboot.KeycloakSpringBootConfigResolver;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class KeycloakConfig {

    //Bean musi być zdefiniowany w osobnej klasie, nie w SecurityConfig ( klasie po której dziedziczy adapter keycloaka)
    @Bean
    public KeycloakSpringBootConfigResolver keycloakConfigResolver() {
        return new KeycloakSpringBootConfigResolver();
    }
}
