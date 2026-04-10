#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\SCM_REGION.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class SCM_REGIONS extends Win32Struct {
    static sizeof => 96

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    RegionCount {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {SCM_REGION}
     */
    Regions {
        get {
            if(!this.HasProp("__RegionsProxyArray"))
                this.__RegionsProxyArray := Win32FixedArray(this.ptr + 16, 1, SCM_REGION, "")
            return this.__RegionsProxyArray
        }
    }
}
