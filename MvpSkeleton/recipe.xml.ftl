<?xml version="1.0"?>
<recipe>

  <merge from="AndroidManifest.xml.ftl"
               to="${escapeXmlAttribute(manifestOut)}/AndroidManifest.xml" />

  <open file="app/setuṕ.md"/>

  <copy from="debug_keystore.jks"
            to="app/debug_keystore.jks" />

  <instantiate from="setup.md"
               to="app/setup.md" />

  <!--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-->
  <!-- MAIN                                                                                                         -->
  <!--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-->

  <instantiate from="main/src/app_package/ApplicationComponent.java.ftl"
               to="${escapeXmlAttribute(srcOut)}/ApplicationComponent.java" />

  <instantiate from="main/src/app_package/ApplicationModule.java.ftl"
               to="${escapeXmlAttribute(srcOut)}/ApplicationModule.java" />

  <instantiate from="main/src/app_package/CustomApp.java.ftl"
               to="${escapeXmlAttribute(srcOut)}/CustomApp.java" />


  <!-- Dagger -->

  <instantiate from="main/src/app_package/dagger/ActivityScope.java.ftl"
               to="${escapeXmlAttribute(srcOut)}/dagger/ActivityScope.java" />


  <!-- Network -->

  <instantiate from="main/src/app_package/network/NetworkModule.java.ftl"
               to="${escapeXmlAttribute(srcOut)}/network/NetworkModule.java" />

  <instantiate from="main/src/app_package/network/OkHttpInterceptors.java.ftl"
               to="${escapeXmlAttribute(srcOut)}/network/OkHttpInterceptors.java" />

  <instantiate from="main/src/app_package/network/OkHttpNetworkInterceptors.java.ftl"
               to="${escapeXmlAttribute(srcOut)}/network/OkHttpNetworkInterceptors.java" />


  <!-- Utils -->

  <instantiate from="main/src/app_package/utils/ViewUtils.java.ftl"
               to="${escapeXmlAttribute(srcOut)}/utils/ViewUtils.java" />


  <!-- Crashlytics -->

  <instantiate from="main/src/app_package/crashlytics/CrashlyticsTree.java.ftl"
               to="${escapeXmlAttribute(srcOut)}/crashlytics/CrashlyticsTree.java" />


  <!-- Api -->

  <instantiate from="main/src/app_package/api/ApiModule.java.ftl"
               to="${escapeXmlAttribute(srcOut)}/api/ApiModule.java" />

  <instantiate from="main/src/app_package/api/ApiTypeAdapterFactory.java.ftl"
               to="${escapeXmlAttribute(srcOut)}/api/ApiTypeAdapterFactory.java" />

  <instantiate from="main/src/app_package/api/ServiceApi.java.ftl"
               to="${escapeXmlAttribute(srcOut)}/api/ServiceApi.java" />

  <instantiate from="main/src/app_package/api/entity/Stub.java.ftl"
               to="${escapeXmlAttribute(srcOut)}/api/entity/Stub.java" />


  <!-- Ui -->

  <mkdir at="${escapeXmlAttribute(srcOut)}/ui/features" />


  <!-- Ui/Base -->

  <instantiate from="main/src/app_package/ui/base/ActivityTransitionDelegate.java.ftl"
               to="${escapeXmlAttribute(srcOut)}/ui/base/ActivityTransitionDelegate.java" />

  <instantiate from="main/src/app_package/ui/base/BaseActivity.java.ftl"
               to="${escapeXmlAttribute(srcOut)}/ui/base/BaseActivity.java" />

  <instantiate from="main/src/app_package/ui/base/BaseCustomDialogFragment.java.ftl"
               to="${escapeXmlAttribute(srcOut)}/ui/base/BaseCustomDialogFragment.java" />

  <instantiate from="main/src/app_package/ui/base/BaseFragment.java.ftl"
               to="${escapeXmlAttribute(srcOut)}/ui/base/BaseFragment.java" />

  <instantiate from="main/src/app_package/ui/base/BaseMvpActivity.java.ftl"
               to="${escapeXmlAttribute(srcOut)}/ui/base/BaseMvpActivity.java" />

  <instantiate from="main/src/app_package/ui/base/BaseMvpFragment.java.ftl"
               to="${escapeXmlAttribute(srcOut)}/ui/base/BaseMvpFragment.java" />

  <instantiate from="main/src/app_package/ui/base/BasePresenter.java.ftl"
               to="${escapeXmlAttribute(srcOut)}/ui/base/BasePresenter.java" />


  <!-- Resources -->

  <instantiate from="main/res/anim/enter_from_left.xml.ftl"
               to="${escapeXmlAttribute(resOut)}/anim/enter_from_left.xml" />

  <instantiate from="main/res/anim/enter_from_right.xml.ftl"
               to="${escapeXmlAttribute(resOut)}/anim/enter_from_right.xml" />

  <instantiate from="main/res/anim/exit_to_left.xml.ftl"
               to="${escapeXmlAttribute(resOut)}/anim/exit_to_left.xml" />

  <instantiate from="main/res/anim/exit_to_right.xml.ftl"
               to="${escapeXmlAttribute(resOut)}/anim/exit_to_right.xml" />


  <!--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-->
  <!-- DEBUG                                                                                                        -->
  <!--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-->

  <!-- Developer Settings -->

  <instantiate from="debug/res/layout/activity_developer_settings.xml.ftl"
               to="${escapeXmlAttribute(resOutDebug)}/layout/activity_developer_settings.xml" />

  <instantiate from="debug/src/app_package/developer_settings/DeveloperSettingsActivity.java.ftl"
               to="${escapeXmlAttribute(srcOutDebug)}/developer_settings/DeveloperSettingsActivity.java" />

  <instantiate from="debug/src/app_package/developer_settings/DeveloperSettingsComponent.java.ftl"
               to="${escapeXmlAttribute(srcOutDebug)}/developer_settings/DeveloperSettingsComponent.java" />

  <instantiate from="debug/src/app_package/developer_settings/DeveloperSettingsStore.java.ftl"
               to="${escapeXmlAttribute(srcOutDebug)}/developer_settings/DeveloperSettingsStore.java" />


  <!-- Network -->

  <instantiate from="debug/src/app_package/network/HostSelectionInterceptor.java.ftl"
               to="${escapeXmlAttribute(srcOutDebug)}/network/HostSelectionInterceptor.java" />

  <instantiate from="debug/src/app_package/network/OkHttpInterceptorsModule.java.ftl"
               to="${escapeXmlAttribute(srcOutDebug)}/network/OkHttpInterceptorsModule.java" />



  <!--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-->
  <!-- RELEASE                                                                                                      -->
  <!--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-->

  <!-- Developer Settings -->

  <instantiate from="release/src/app_package/developer_settings/DeveloperSettingsComponent.java.ftl"
               to="${escapeXmlAttribute(srcOutRelease)}/developer_settings/DeveloperSettingsComponent.java" />


  <!-- Network -->

  <instantiate from="release/src/app_package/network/OkHttpInterceptorsModule.java.ftl"
               to="${escapeXmlAttribute(srcOutRelease)}/network/OkHttpInterceptorsModule.java" />

</recipe>
