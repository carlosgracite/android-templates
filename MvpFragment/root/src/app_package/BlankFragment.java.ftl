package ${packageName}.${packName};

import android.os.Bundle;

<#if applicationPackage??>import ${applicationPackage}.ApplicationComponent;</#if>
<#if applicationPackage??>import ${applicationPackage}.R;</#if>
<#if applicationPackage??>import ${applicationPackage}.ui.base.BaseMvpFragment;</#if>

public class ${featureName}Fragment extends BaseMvpFragment<${featureName}View, ${featureName}Presenter> implements ${featureName}View {

    public static ${featureName}Fragment newInstance() {
        Bundle args = new Bundle();
        ${featureName}Fragment fragment = new ${featureName}Fragment();
        fragment.setArguments(args);
        return fragment;
    }

    // =============================================================================================
    //  Lifecycle
    // =============================================================================================

    @Override
    public int getLayoutRes() {
        return R.layout.${layoutName};
    }

    @Override
    protected void setupComponent(ApplicationComponent appComponent) {
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
