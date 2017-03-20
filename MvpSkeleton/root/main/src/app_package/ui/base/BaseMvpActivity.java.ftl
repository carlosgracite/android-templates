package ${packageName}.ui.base;

import android.content.Context;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;

import com.carlosgracite.katamorph.view.MvpAppCompatActivity;
import com.carlosgracite.katamorph.presenter.RxPresenter;
import ${packageName}.ApplicationComponent;
import ${packageName}.CustomApp;
import ${packageName}.utils.ViewUtils;

import uk.co.chrisjenx.calligraphy.CalligraphyContextWrapper;

public abstract class BaseMvpActivity<V, P extends RxPresenter<V>> extends MvpAppCompatActivity<V, P> {

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
    public void onSaveInstanceState(@NonNull Bundle outState) {
        super.onSaveInstanceState(outState);
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