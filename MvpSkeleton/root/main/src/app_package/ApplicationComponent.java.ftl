package ${packageName};

import android.support.annotation.NonNull;

import ${packageName}.api.ApiModule;
import ${packageName}.developer_settings.DeveloperSettingsComponent;
import ${packageName}.network.NetworkModule;
import ${packageName}.network.OkHttpInterceptorsModule;

import javax.inject.Singleton;

import dagger.Component;

@Singleton
@Component(modules = {
        ApplicationModule.class,
        OkHttpInterceptorsModule.class,
        NetworkModule.class,
        ApiModule.class
})
public interface ApplicationComponent {

    void inject(@NonNull CustomApp customApp);

    DeveloperSettingsComponent plus(DeveloperSettingsComponent.DeveloperSettingsModule developerSettingsModule);

}