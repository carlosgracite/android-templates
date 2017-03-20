package ${packageName}.developer_settings;

import android.os.Bundle;
import android.support.annotation.Nullable;
import android.widget.RadioGroup;

import ${packageName}.ApplicationComponent;
import ${packageName}.R;
import ${packageName}.network.HostSelectionInterceptor;
import ${packageName}.ui.base.BaseActivity;

import javax.inject.Inject;

import butterknife.BindView;
import butterknife.ButterKnife;

public class DeveloperSettingsActivity extends BaseActivity {

    public static final String HOST_LOCAL = "local.com";
    public static final String HOST_PROD = "prod.com";

    @BindView(R.id.radio_group_base_url)
    RadioGroup baseUrlRadioGroup;

    @Inject
    HostSelectionInterceptor hostSelectionInterceptor;

    @Inject
    DeveloperSettingsStore developerSettingsStore;

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_developer_settings);
        ButterKnife.bind(this);

        String url = developerSettingsStore.getBaseHostUrl();

        if (url != null) {
            if (url.equals(HOST_LOCAL)) {
                baseUrlRadioGroup.check(R.id.radio_base_url_local);
            }
            else if (url.equals(HOST_PROD)) {
                baseUrlRadioGroup.check(R.id.radio_base_url_production);
            }
        }

        baseUrlRadioGroup.setOnCheckedChangeListener((radioGroup, id) -> {
            switch (id) {
                case R.id.radio_base_url_local:
                    changeHost(HOST_LOCAL, 8090);
                    break;

                case R.id.radio_base_url_production:
                    changeHost(HOST_PROD, 80);
                    break;
            }
        });
    }

    private void changeHost(String url, int port) {
        developerSettingsStore.saveBaseHost(url, port);
        hostSelectionInterceptor.setHost(url, port);
    }

    @Override
    protected void setupActivityComponent(ApplicationComponent appComponent) {
        DeveloperSettingsComponent devSettingsComponent = appComponent.plus(new DeveloperSettingsComponent.DeveloperSettingsModule());
        devSettingsComponent.inject(this);
    }

}