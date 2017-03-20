package ${packageName}.${packName};

<#if applicationPackage??>import ${applicationPackage}.dagger.ActivityScope;</#if>

import dagger.Module;
import dagger.Subcomponent;

@ActivityScope
@Subcomponent(
        modules = ${featureName}Component.${featureName}Module.class
)
public interface ${featureName}Component {

    ${featureName}Activity inject(${featureName}Activity activity);

    ${featureName}Presenter getPresenter();

    @Module
    class ${featureName}Module {
        
    }

}
