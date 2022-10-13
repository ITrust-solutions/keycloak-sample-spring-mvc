FROM quay.io/keycloak/keycloak:19.0.3 as builder

ENV KC_HEALTH_ENABLED=true
ENV KC_METRICS_ENABLED=true
ENV KC_FEATURES=token-exchange
ENV KC_DB=postgres
ENV PROXY_ADDRESS_FORWARDING=true
ENV KC_HOSTNAME_STRICT=false
ENV KC_PROXY=edge
ENV KC_HTTP_ENABLED=true

# Instaluje metryki dla Prometeusza (/realms/{realmName}/metrics) przykładowo (https://localhost:8443/realms/keycloak_example/metrics)
RUN curl -sL https://github.com/aerogear/keycloak-metrics-spi/releases/download/2.5.3/keycloak-metrics-spi-2.5.3.jar -o /opt/keycloak/providers/keycloak-metrics-spi-2.5.3.jar
RUN /opt/keycloak/bin/kc.sh build

FROM quay.io/keycloak/keycloak:19.0.3
COPY --from=builder /opt/keycloak/ /opt/keycloak/
WORKDIR /opt/keycloak
# for demonstration purposes only, please make sure to use proper certificates in production instead
RUN keytool -genkeypair -storepass password -storetype PKCS12 -keyalg RSA -keysize 2048 -dname "CN=server" -alias server -ext "SAN:c=DNS:localhost,IP:127.0.0.1" -keystore conf/server.keystore
ENV KC_DB_URL=jdbc:postgresql://db:5432/keycloak?ssl=allow
ENV KC_DB_USERNAME=user
ENV KC_DB_PASSWORD=password
ENV KC_HOSTNAME=localhost
ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=admin
ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]
