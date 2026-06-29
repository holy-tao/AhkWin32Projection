#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
class CLUSCTL_RESOURCE_TYPE_STORAGE_GET_AVAILABLE_DISKS_EX2_INPUT extends Win32Struct {
    static sizeof => 20

    static packingSize => 4

    /**
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Guid}
     */
    guidPoolFilter {
        get {
            if(!this.HasProp("__guidPoolFilter"))
                this.__guidPoolFilter := Guid(4, this)
            return this.__guidPoolFilter
        }
    }
}
