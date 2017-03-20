package ${packageName}.network;

import android.support.annotation.NonNull;

import ${packageName}.developer_settings.DeveloperSettingsStore;

import java.util.Arrays;
import java.util.List;

import javax.inject.Singleton;

import dagger.Module;
import dagger.Provides;
import okhttp3.Interceptor;
import okhttp3.logging.HttpLoggingInterceptor;

import static java.util.Collections.emptyList;

@Module
public class OkHttpInterceptorsModule {

    @Provides @Singleton @NonNull
    public HttpLoggingInterceptor provideHttpLoggingInterceptor() {
        return new HttpLoggingInterceptor().setLevel(HttpLoggingInterceptor.Level.BODY);
    }

    @Provides @Singleton @NonNull
    public HostSelectionInterceptor provideHostSelectionInterceptor(DeveloperSettingsStore developerSettingsStore) {
        return new HostSelectionInterceptor(developerSettingsStore);
    }

    @Provides @OkHttpInterceptors
    @Singleton @NonNull
    public List<Interceptor> provideOkHttpInterceptors(@NonNull HttpLoggingInterceptor httpLoggingInterceptor,
                                                       @NonNull HostSelectionInterceptor hostSelectionInterceptor) {
        return Arrays.asList(httpLoggingInterceptor, hostSelectionInterceptor);
    }

    @Provides @OkHttpNetworkInterceptors
    @Singleton @NonNull
    public List<Interceptor> provideOkHttpNetworkInterceptors() {
        return emptyList();
    }

}