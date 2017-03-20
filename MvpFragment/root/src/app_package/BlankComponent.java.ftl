package ${packageName}.${packName};

import dagger.Module;
import dagger.Subcomponent;

@Subcomponent(
        modules = ${featureName}Component.${featureName}Module.class
)
public interface ${featureName}Component {

    ${featureName}Fragment inject(${featureName}Fragment fragment);

    ${featureName}Presenter getPresenter();

    @Module
    class ${featureName}Module {
        
    }

}
