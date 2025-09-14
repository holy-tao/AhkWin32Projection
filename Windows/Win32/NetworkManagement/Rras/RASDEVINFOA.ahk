#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 * @charset ANSI
 */
class RASDEVINFOA extends Win32Struct
{
    static sizeof => 152

    static packingSize => 4

    /**
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Array<SByte>}
     */
    szDeviceType{
        get {
            if(!this.HasProp("__szDeviceTypeProxyArray"))
                this.__szDeviceTypeProxyArray := Win32FixedArray(this.ptr + 4, 17, Primitive, "char")
            return this.__szDeviceTypeProxyArray
        }
    }

    /**
     * @type {Array<SByte>}
     */
    szDeviceName{
        get {
            if(!this.HasProp("__szDeviceNameProxyArray"))
                this.__szDeviceNameProxyArray := Win32FixedArray(this.ptr + 21, 129, Primitive, "char")
            return this.__szDeviceNameProxyArray
        }
    }
}
