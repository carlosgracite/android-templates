package ${packageName}.developer_settings;

import android.content.Context;
import android.content.SharedPreferences;

import javax.inject.Inject;
import javax.inject.Singleton;

@Singleton
public class DeveloperSettingsStore {

    private static final String PREFERENCE_DEVELOPER_SETTINGS = "developer_settings_preferences";

    private static final String PREF_BASE_HOST_URL = "pref_base_host_url";
    private static final String PREF_BASE_HOST_PORT = "pref_base_host_port";

    private SharedPreferences preferences;

    @Inject
    public DeveloperSettingsStore(Context context) {
        preferences = context.getSharedPreferences(PREFERENCE_DEVELOPER_SETTINGS, 0);
    }

    public void saveBaseHost(String url, int port) {
        preferences.edit()
                .putString(PREF_BASE_HOST_URL, url)
                .putInt(PREF_BASE_HOST_PORT, port)
                .commit();
    }

    public String getBaseHostUrl() {
        return preferences.getString(PREF_BASE_HOST_URL, null);
    }

    public int getBaseHostPort() {
        return preferences.getInt(PREF_BASE_HOST_PORT, 80);
    }

}