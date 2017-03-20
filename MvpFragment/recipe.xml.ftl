<?xml version="1.0"?>
<recipe>

  <instantiate from="res/layout/fragment_blank.xml.ftl"
               to="${escapeXmlAttribute(resOut)}/layout/${layoutName}.xml" />

  <instantiate from="src/app_package/BlankView.java.ftl"
               to="${escapeXmlAttribute(srcOut)}/${packName}/${featureName}View.java" />

  <instantiate from="src/app_package/BlankComponent.java.ftl"
               to="${escapeXmlAttribute(srcOut)}/${packName}/${featureName}Component.java" />

  <open file="${escapeXmlAttribute(srcOut)}/${packName}/${featureName}Presenter.java" />

  <instantiate from="src/app_package/BlankPresenter.java.ftl"
               to="${escapeXmlAttribute(srcOut)}/${packName}/${featureName}Presenter.java" />

  <instantiate from="src/app_package/BlankFragment.java.ftl"
               to="${escapeXmlAttribute(srcOut)}/${packName}/${featureName}Fragment.java" />

  <open file="${escapeXmlAttribute(srcOut)}/${packName}/${featureName}Fragment.java" />

</recipe>