<?xml version="1.0"?>
<recipe>

  <merge from="AndroidManifest.xml.ftl"
         to="${escapeXmlAttribute(manifestOut)}/AndroidManifest.xml" />

  <instantiate from="res/layout/activity_blank.xml.ftl"
               to="${escapeXmlAttribute(resOut)}/layout/${layoutName}.xml" />

  <instantiate from="src/app_package/BlankView.java.ftl"
               to="${escapeXmlAttribute(srcOut)}/${packName}/${featureName}View.java" />

  <instantiate from="src/app_package/BlankComponent.java.ftl"
               to="${escapeXmlAttribute(srcOut)}/${packName}/${featureName}Component.java" />

  <open file="${escapeXmlAttribute(srcOut)}/${packName}/${featureName}Presenter.java" />

  <instantiate from="src/app_package/BlankPresenter.java.ftl"
               to="${escapeXmlAttribute(srcOut)}/${packName}/${featureName}Presenter.java" />

  <instantiate from="src/app_package/BlankActivity.java.ftl"
               to="${escapeXmlAttribute(srcOut)}/${packName}/${featureName}Activity.java" />

  <open file="${escapeXmlAttribute(srcOut)}/${packName}/${featureName}Activity.java" />

</recipe>