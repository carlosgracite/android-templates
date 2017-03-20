<manifest xmlns:android="http://schemas.android.com/apk/res/android" >
  <uses-permission android:name="android.permission.INTERNET"/>
  <application
  	android:name=".CustomApp">
    <activity android:name=".developer_settings.DeveloperSettingsActivity"
            android:screenOrientation="portrait"
            android:label="Dev Settings"
            <#noparse>android:enabled="${devSettingsEnabled}"></#noparse>
            <intent-filter>
                <action android:name="android.intent.action.MAIN" />

                <category android:name="android.intent.category.LAUNCHER" />
            </intent-filter>
        </activity>
  </application>
</manifest>