#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\STORAGE_DEVICE_NUMBER.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class STORAGE_DEVICE_NUMBERS extends Win32Struct
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
    Size {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    NumberOfDevices {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Array<STORAGE_DEVICE_NUMBER>}
     */
    Devices{
        get {
            if(!this.HasProp("__DevicesProxyArray"))
                this.__DevicesProxyArray := Win32FixedArray(this.ptr + 16, 8, STORAGE_DEVICE_NUMBER, "")
            return this.__DevicesProxyArray
        }
    }
}
