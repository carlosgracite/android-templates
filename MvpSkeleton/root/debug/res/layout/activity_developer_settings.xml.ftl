<?xml version="1.0" encoding="utf-8"?>
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:orientation="vertical"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:layout_margin="16dp">

    <TextView
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:textAllCaps="true"
        android:text="Base Url"/>

    <RadioGroup
        android:id="@+id/radio_group_base_url"
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:layout_marginTop="8dp">

        <RadioButton
            android:id="@+id/radio_base_url_production"
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:textColor="?android:attr/textColorPrimary"
            android:text="Production (prod.com)"/>

        <RadioButton
            android:id="@+id/radio_base_url_local"
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:textColor="?android:attr/textColorPrimary"
            android:text="Local (local.com)"/>

    </RadioGroup>

</LinearLayout>