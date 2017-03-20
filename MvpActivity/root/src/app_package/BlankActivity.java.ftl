package ${packageName}.${packName};

import android.os.Bundle;
import android.support.annotation.Nullable;

<#if applicationPackage??>import ${applicationPackage}.ApplicationComponent;</#if>
<#if applicationPackage??>import ${applicationPackage}.R;</#if>
<#if applicationPackage??>import ${applicationPackage}.ui.base.BaseMvpActivity;</#if>

import butterknife.ButterKnife;

public class ${featureName}Activity extends BaseMvpActivity<${featureName}View, ${featureName}Presenter> implements ${featureName}View {

    // =============================================================================================
    //  Lifecycle
    // =============================================================================================

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.${layoutName});
        ButterKnife.bind(this);

        setupPresenter(savedInstanceState);
    }

    @Override
    protected void setupActivityComponent(ApplicationComponent appComponent) {
        ${featureName}Component ${featureName?uncap_first}Component = appComponent.plus(new ${featureName}Component.${featureName}Module());
        ${featureName?uncap_first}Component.inject(this);
        setPresenter(${featureName?uncap_first}Component.getPresenter());
    }

    // =============================================================================================
    //  Input Events
    // =============================================================================================

    
    // =============================================================================================
    //  View Callbacks
    // =============================================================================================

    
    // =============================================================================================
    //  Helpers
    // =============================================================================================
}
