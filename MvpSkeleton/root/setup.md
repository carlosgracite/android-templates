

Add the following dependencies at build.graddle:

```groovy
classpath 'com.neenbedankt.gradle.plugins:android-apt:1.8'
classpath 'com.getkeepsafe.dexcount:dexcount-gradle-plugin:0.6.1'
classpath 'me.tatarka:gradle-retrolambda:3.5.0'
```


Modify app/build.gradle with the following template:

```groovy
apply plugin: 'com.android.application'
apply plugin: 'com.neenbedankt.android-apt'
apply plugin: 'com.getkeepsafe.dexcount'
apply plugin: 'me.tatarka.retrolambda'

repositories {
    maven { url 'https://maven.fabric.io/public' }
    maven { url "https://clojars.org/repo/" }
    maven { url "https://jitpack.io" }
    maven { url 'https://oss.sonatype.org/content/repositories/snapshots/' }
}

android {
    compileSdkVersion 25
    buildToolsVersion "24.0.3"

    // Para poder ter rxjava 1 e 2 no projeto
    packagingOptions {
        exclude 'META-INF/rxjava.properties'
    }

    compileOptions {
        // For retrolambda support
        sourceCompatibility JavaVersion.VERSION_1_8
        targetCompatibility JavaVersion.VERSION_1_8
    }

    defaultConfig {
        applicationId "${packageName}"
        minSdkVersion 15
        targetSdkVersion 25
        versionCode 1
        versionName "1.0"
        testInstrumentationRunner "android.support.test.runner.AndroidJUnitRunner"
        vectorDrawables.useSupportLibrary = true
    }

    signingConfigs {
        appDebug {
            storeFile file('debug_keystore.jks')
            keyAlias 'application'
            keyPassword 'application'
            storePassword 'application'
        }
    }

    buildTypes {
        debug {
            buildConfigField 'String', 'HOST', '"https://192.168.4.20:8443"'
            buildConfigField 'boolean', 'CRASH_ANALYTICS_ENABLED', "false"
            manifestPlaceholders = [ devSettingsEnabled:false ]

            signingConfig signingConfigs.appDebug
        }
        release {
            buildConfigField 'String', 'HOST', '"https://192.168.4.2:8443"'
            buildConfigField 'boolean', 'CRASH_ANALYTICS_ENABLED', "false"
            manifestPlaceholders = [ devSettingsEnabled:false ]

            minifyEnabled false
            proguardFiles getDefaultProguardFile('proguard-android.txt'), 'proguard-rules.pro'
        }
    }
}

dependencies {
    compile fileTree(dir: 'libs', include: ['*.jar'])

    // Support library
    compile 'com.android.support:appcompat-v7:25.1.1'
    compile 'com.android.support:cardview-v7:25.1.1'
    compile 'com.android.support:recyclerview-v7:25.1.1'
    compile 'com.android.support:design:25.1.1'
    compile 'com.android.support:support-annotations:25.1.1'
    compile 'com.android.support.constraint:constraint-layout:1.0.0-beta4'

    compile "me.henrytao:smooth-app-bar-layout:24.2.1.0"

    // Gson
    compile 'com.google.code.gson:gson:2.8.0'

    // Retrofit
    compile 'com.squareup.retrofit2:retrofit:2.1.0'
    compile 'com.jakewharton.retrofit:retrofit2-rxjava2-adapter:1.0.0'
    compile 'com.squareup.retrofit2:converter-gson:2.1.0'
    compile 'com.squareup.retrofit2:converter-scalars:2.1.0'

    // OkHttp
    compile 'com.squareup.okhttp3:okhttp:3.4.1'
    compile 'com.squareup.okhttp3:logging-interceptor:3.4.1'

    // RxJava
    compile 'io.reactivex.rxjava2:rxjava:2.0.5'
    compile 'io.reactivex.rxjava2:rxandroid:2.0.1'
    compile 'com.jakewharton.rxrelay2:rxrelay:2.0.0'

    // Necessário aparecer antes do dagger para resolver problema com auto-value-parcel auto-value-parcel
    apt 'com.squareup:javapoet:1.7.0'

    // Dagger
    compile 'com.google.dagger:dagger:2.7'
    apt 'com.google.dagger:dagger-compiler:2.7'

    // Butterknife
    compile 'com.jakewharton:butterknife:8.2.1'
    apt 'com.jakewharton:butterknife-compiler:8.2.1'

    // Picasso
    // Usando versão de snapshot devido a esse bug: https://github.com/square/picasso/issues/364
    compile 'com.squareup.picasso:picasso:2.5.3-SNAPSHOT'
    compile 'jp.wasabeef:picasso-transformations:2.1.0'

    // AutoValue
    provided 'com.google.auto.value:auto-value:1.2'
    apt 'com.google.auto.value:auto-value:1.2'
    apt 'com.ryanharter.auto.value:auto-value-parcel:0.2.4-rc2'
    apt 'com.ryanharter.auto.value:auto-value-gson:0.4.4'
    provided 'com.ryanharter.auto.value:auto-value-gson:0.4.4'
    apt 'com.gabrielittner.auto.value:auto-value-with:1.0.0-rc1'

    // Crashlytics
    compile('com.crashlytics.sdk.android:crashlytics:2.6.2@aar') {
        transitive = true;
    }

    // Others
    compile 'com.github.carlosgracite:katamorph:0.3.1'
    compile 'com.jakewharton.timber:timber:4.2.0'
    compile 'de.hdodenhof:circleimageview:2.1.0'
    compile 'com.andkulikov:transitionseverywhere:1.6.3'
    compile 'uk.co.chrisjenx:calligraphy:2.2.0'

    // Testing
    androidTestCompile('com.android.support.test.espresso:espresso-core:2.2.2', {
        exclude group: 'com.android.support', module: 'support-annotations'
    })
    testCompile 'junit:junit:4.12'
}

```
