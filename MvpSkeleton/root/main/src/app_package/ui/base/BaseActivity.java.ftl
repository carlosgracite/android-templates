package ${packageName}.ui.base;

import android.content.Context;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v7.app.AppCompatActivity;

import ${packageName}.ApplicationComponent;
import ${packageName}.CustomApp;
import ${packageName}.utils.ViewUtils;

import uk.co.chrisjenx.calligraphy.CalligraphyContextWrapper;

public abstract class BaseActivity extends AppCompatActivity {

    private ActivityTransitionDelegate activityTransitionDelegate;

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        activityTransitionDelegate = new ActivityTransitionDelegate(this);
        activityTransitionDelegate.executeTransitionIn();
        setupActivityComponent(getApplicationComponent());
        super.onCreate(savedInstanceState);
    }

    @Override
    protected void attachBaseContext(Context newBase) {
        super.attachBaseContext(CalligraphyContextWrapper.wrap(newBase));
    }

    @Override
    public void finish() {
        super.finish();
        activityTransitionDelegate.executeTransitionOut();
    }

    protected ApplicationComponent getApplicationComponent() {
        return CustomApp.get(this).applicationComponent();
    }

    protected abstract void setupActivityComponent(ApplicationComponent appComponent);

    protected int dp(float valueInDip) {
        return ViewUtils.dipsToPix(this, valueInDip);
    }

}