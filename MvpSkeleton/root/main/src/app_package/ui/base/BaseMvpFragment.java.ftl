package ${packageName}.ui.base;

import android.os.Bundle;
import android.support.annotation.LayoutRes;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import com.carlosgracite.katamorph.view.MvpSupportFragment;
import com.carlosgracite.katamorph.presenter.RxPresenter;
import ${packageName}.ApplicationComponent;
import ${packageName}.CustomApp;
import ${packageName}.utils.ViewUtils;

import butterknife.ButterKnife;
import butterknife.Unbinder;

public abstract class BaseMvpFragment<V, P extends RxPresenter<V>> extends MvpSupportFragment<V, P> {

    private Unbinder unbinder;

    @Override
    public void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setupComponent(getApplicationComponent());
    }

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        View rootView = inflater.inflate(getLayoutRes(), container, false);
        unbinder = ButterKnife.bind(this, rootView);
        return rootView;
    }

    @Override
    public void onSaveInstanceState(@NonNull Bundle outState) {
        super.onSaveInstanceState(outState);
    }

    @Override
    public void onDestroyView() {
        unbinder.unbind();
        super.onDestroyView();
    }

    public abstract @LayoutRes
    int getLayoutRes();

    protected ApplicationComponent getApplicationComponent() {
        return CustomApp.get(getContext()).applicationComponent();
    }

    protected int dp(float valueInDip) {
        return ViewUtils.dipsToPix(getContext(), valueInDip);
    }

    protected void setupComponent(ApplicationComponent appComponent) {

    }
}