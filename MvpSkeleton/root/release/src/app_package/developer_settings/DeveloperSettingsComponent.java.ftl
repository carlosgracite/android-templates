package ${packageName}.developer_settings;

import ${packageName}.dagger.ActivityScope;

import dagger.Module;
import dagger.Subcomponent;

@ActivityScope
@Subcomponent(
        modules = DeveloperSettingsComponent.DeveloperSettingsModule.class
)
public interface DeveloperSettingsComponent {

    @Module
    class DeveloperSettingsModule {
        public DeveloperSettingsModule() {
        }
    }

}