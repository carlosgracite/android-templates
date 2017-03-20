package ${packageName};

import android.content.Context;
import android.support.annotation.NonNull;

import javax.inject.Singleton;

import dagger.Module;
import dagger.Provides;

@Module
public class ApplicationModule {

    @NonNull
    private final Context appContext;

    public ApplicationModule(@NonNull Context appContext) {
        this.appContext = appContext;
    }

    @Provides @NonNull @Singleton
    public Context providesCustomAppContext() {
        return appContext;
    }

}