#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\STORAGE_TIER.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\STORAGE_TIER_CLASS.ahk
#Include .\STORAGE_TIER_MEDIA_TYPE.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class STORAGE_DEVICE_TIERING_DESCRIPTOR extends Win32Struct {
    static sizeof => 1088

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
    Flags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    TotalNumberOfTiers {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    NumberOfTiersReturned {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {STORAGE_TIER}
     */
    Tiers {
        get {
            if(!this.HasProp("__TiersProxyArray"))
                this.__TiersProxyArray := Win32FixedArray(this.ptr + 24, 1, STORAGE_TIER, "")
            return this.__TiersProxyArray
        }
    }
}
