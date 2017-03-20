package ${packageName}.network;

import ${packageName}.BuildConfig;
import ${packageName}.developer_settings.DeveloperSettingsStore;

import java.io.IOException;

import okhttp3.HttpUrl;
import okhttp3.Interceptor;
import okhttp3.Request;
import okhttp3.Response;

public class HostSelectionInterceptor implements Interceptor {

    private volatile String host;
    private volatile int port;

    public HostSelectionInterceptor(DeveloperSettingsStore developerSettingsStore) {
        this.host = developerSettingsStore.getBaseHostUrl();
        this.port = developerSettingsStore.getBaseHostPort();
    }

    public void setHost(String host, int port) {
        this.host = host;
        this.port = port;
    }

    @Override
    public Response intercept(Chain chain) throws IOException {
        Request request = chain.request();

        String host = this.host;
        int port = this.port;

        if (host != null && BuildConfig.HOST.contains(request.url().host())) {
            HttpUrl newUrl = request.url().newBuilder()
                    .host(host)
                    .port(port)
                    .build();
            request = request.newBuilder()
                    .url(newUrl)
                    .build();
        }

        return chain.proceed(request);
    }

}