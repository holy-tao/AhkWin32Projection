#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 * @charset ANSI
 */
class RASSUBENTRYA extends Win32Struct
{
    static sizeof => 288

    static packingSize => 4

    /**
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    dwfFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Array<SByte>}
     */
    szDeviceType{
        get {
            if(!this.HasProp("__szDeviceTypeProxyArray"))
                this.__szDeviceTypeProxyArray := Win32FixedArray(this.ptr + 8, 17, Primitive, "char")
            return this.__szDeviceTypeProxyArray
        }
    }

    /**
     * @type {Array<SByte>}
     */
    szDeviceName{
        get {
            if(!this.HasProp("__szDeviceNameProxyArray"))
                this.__szDeviceNameProxyArray := Win32FixedArray(this.ptr + 25, 129, Primitive, "char")
            return this.__szDeviceNameProxyArray
        }
    }

    /**
     * @type {Array<SByte>}
     */
    szLocalPhoneNumber{
        get {
            if(!this.HasProp("__szLocalPhoneNumberProxyArray"))
                this.__szLocalPhoneNumberProxyArray := Win32FixedArray(this.ptr + 154, 129, Primitive, "char")
            return this.__szLocalPhoneNumberProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    dwAlternateOffset {
        get => NumGet(this, 284, "uint")
        set => NumPut("uint", value, this, 284)
    }
}
