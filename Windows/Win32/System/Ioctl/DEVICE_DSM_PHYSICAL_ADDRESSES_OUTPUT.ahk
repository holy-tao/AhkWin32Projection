#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DEVICE_STORAGE_ADDRESS_RANGE.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class DEVICE_DSM_PHYSICAL_ADDRESSES_OUTPUT extends Win32Struct
{
    static sizeof => 24

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
    Flags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    TotalNumberOfRanges {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    NumberOfRangesReturned {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Array<DEVICE_STORAGE_ADDRESS_RANGE>}
     */
    Ranges{
        get {
            if(!this.HasProp("__RangesProxyArray"))
                this.__RangesProxyArray := Win32FixedArray(this.ptr + 16, 8, DEVICE_STORAGE_ADDRESS_RANGE, "")
            return this.__RangesProxyArray
        }
    }
}
