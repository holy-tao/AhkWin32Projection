#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\MP_DEVICE_DATA_SET_RANGE.ahk

/**
 * @namespace Windows.Win32.Storage.IscsiDisc
 * @version v4.0.30319
 */
class DSM_NOTIFICATION_REQUEST_BLOCK extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    NotifyFlags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    DataSetProfile {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Array<UInt32>}
     */
    Reserved{
        get {
            if(!this.HasProp("__ReservedProxyArray"))
                this.__ReservedProxyArray := Win32FixedArray(this.ptr + 16, 3, Primitive, "uint")
            return this.__ReservedProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    DataSetRangesCount {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * @type {Array<MP_DEVICE_DATA_SET_RANGE>}
     */
    DataSetRanges{
        get {
            if(!this.HasProp("__DataSetRangesProxyArray"))
                this.__DataSetRangesProxyArray := Win32FixedArray(this.ptr + 32, 1, MP_DEVICE_DATA_SET_RANGE, "")
            return this.__DataSetRangesProxyArray
        }
    }
}
