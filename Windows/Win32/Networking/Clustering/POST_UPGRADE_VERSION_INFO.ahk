#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents post-upgrade state information for the cluster service.
 * @see https://learn.microsoft.com/windows/win32/api/resapi/ns-resapi-post_upgrade_version_info
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct POST_UPGRADE_VERSION_INFO {
    #StructPack 4

    /**
     * The major version of the cluster service after the upgrade.
     */
    newMajorVersion : UInt32

    /**
     * The minor version of the cluster service after the update.
     */
    newUpgradeVersion : UInt32

    /**
     * The major version of the cluster service before the upgrade.
     * 
     * <div class="alert"><b>Tip</b>  In some error conditions this field can be zero.</div>
     * <div> </div>
     */
    oldMajorVersion : UInt32

    /**
     * The minor version of the cluster service before the upgrade.
     * 
     * <div class="alert"><b>Tip</b>  In some error conditions this field can be zero.</div>
     * <div> </div>
     */
    oldUpgradeVersion : UInt32

    /**
     * Reserved.
     */
    reserved : UInt32

}
