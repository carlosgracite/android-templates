package ${packageName};

import android.app.Application;
import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.os.Build;
import android.support.annotation.NonNull;
import android.support.annotation.VisibleForTesting;
import android.webkit.WebView;

import com.crashlytics.android.Crashlytics;
import ${packageName}.crashlytics.CrashlyticsTree;

import io.fabric.sdk.android.Fabric;
import timber.log.Timber;

public class CustomApp extends Application {

    private ApplicationComponent applicationComponent;

    private static CustomApp app;

    @NonNull
    public static CustomApp get(@NonNull Context context) {
        return (CustomApp) context.getApplicationContext();
    }

    @Override
    public void onCreate() {
        super.onCreate();

        setupCrashReportAndLog();

        applicationComponent = prepareApplicationComponent().build();
        applicationComponent.inject(this);

        app = this;
    }

    private void setupCrashReportAndLog() {

        if (BuildConfig.DEBUG) {
            Timber.plant(new Timber.DebugTree());
        }

        if (BuildConfig.CRASH_ANALYTICS_ENABLED) {
            Fabric.with(this, new Crashlytics());
            Timber.plant(new CrashlyticsTree());
        }

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.KITKAT) {
            if (0 != (getApplicationInfo().flags & ApplicationInfo.FLAG_DEBUGGABLE)) {
                WebView.setWebContentsDebuggingEnabled(true);
            }
        }
    }

    @NonNull
    protected DaggerApplicationComponent.Builder prepareApplicationComponent() {
        return DaggerApplicationComponent.builder()
                .applicationModule(new ApplicationModule(this));
    }

    @NonNull
    public ApplicationComponent applicationComponent() {
        return applicationComponent;
    }

    public static CustomApp getInstance() {
        return app;
    }

    @VisibleForTesting
    public void setComponent(ApplicationComponent component) {
        applicationComponent = component;
    }

}
