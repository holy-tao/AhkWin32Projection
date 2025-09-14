#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class WINDOWS_IRDA_DEVICE_INFO extends Win32Struct
{
    static sizeof => 29

    static packingSize => 1

    /**
     * @type {Array<Byte>}
     */
    irdaDeviceID{
        get {
            if(!this.HasProp("__irdaDeviceIDProxyArray"))
                this.__irdaDeviceIDProxyArray := Win32FixedArray(this.ptr + 0, 4, Primitive, "char")
            return this.__irdaDeviceIDProxyArray
        }
    }

    /**
     * @type {Array<SByte>}
     */
    irdaDeviceName{
        get {
            if(!this.HasProp("__irdaDeviceNameProxyArray"))
                this.__irdaDeviceNameProxyArray := Win32FixedArray(this.ptr + 4, 22, Primitive, "char")
            return this.__irdaDeviceNameProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    irdaDeviceHints1 {
        get => NumGet(this, 26, "char")
        set => NumPut("char", value, this, 26)
    }

    /**
     * @type {Integer}
     */
    irdaDeviceHints2 {
        get => NumGet(this, 27, "char")
        set => NumPut("char", value, this, 27)
    }

    /**
     * @type {Integer}
     */
    irdaCharSet {
        get => NumGet(this, 28, "char")
        set => NumPut("char", value, this, 28)
    }
}
