#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents post-upgrade state information for the cluster service.
 * @see https://docs.microsoft.com/windows/win32/api//resapi/ns-resapi-post_upgrade_version_info
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class POST_UPGRADE_VERSION_INFO extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    /**
     * The major version of the cluster service after the upgrade.
     * @type {Integer}
     */
    newMajorVersion {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The minor version of the cluster service after the update.
     * @type {Integer}
     */
    newUpgradeVersion {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The major version of the cluster service before the upgrade.
     * 
     * <div class="alert"><b>Tip</b>  In some error conditions this field can be zero.</div>
     * <div> </div>
     * @type {Integer}
     */
    oldMajorVersion {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The minor version of the cluster service before the upgrade.
     * 
     * <div class="alert"><b>Tip</b>  In some error conditions this field can be zero.</div>
     * <div> </div>
     * @type {Integer}
     */
    oldUpgradeVersion {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Reserved.
     * @type {Integer}
     */
    reserved {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
