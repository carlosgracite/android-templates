<?xml version="1.0"?>
<globals>
	
	<global id="manifestOut" value="${manifestDir}" />

    <global id="resOutMain" value="${resDir}" />
    <global id="srcOutMain" value="${srcDir}/${slashedPackageName(packageName)}" />

    <global id="resOutDebug" value="app/src/debug/res" />
    <global id="srcOutDebug" value="app/src/debug/java/${slashedPackageName(packageName)}" />

    <global id="resOutRelease" value="app/src/release/res" />
    <global id="srcOutRelease" value="app/src/release/java/${slashedPackageName(packageName)}" />

</globals>