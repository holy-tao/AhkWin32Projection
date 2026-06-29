#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DFS_SITENAME_INFO.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.Storage.DistributedFileSystem
 */
class DFS_SITELIST_INFO extends Win32Struct {
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Integer}
     */
    cSites {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {DFS_SITENAME_INFO}
     */
    Site {
        get {
            if(!this.HasProp("__SiteProxyArray"))
                this.__SiteProxyArray := Win32FixedArray(this.ptr + 8, 1, DFS_SITENAME_INFO, "")
            return this.__SiteProxyArray
        }
    }
}
