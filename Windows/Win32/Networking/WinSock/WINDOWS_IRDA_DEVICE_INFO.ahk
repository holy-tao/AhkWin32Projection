#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class WINDOWS_IRDA_DEVICE_INFO extends Win32Struct
{
    static sizeof => 52

    static packingSize => 2

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
     * @type {String}
     */
    irdaDeviceName {
        get => StrGet(this.ptr + 4, 21, "UTF-16")
        set => StrPut(value, this.ptr + 4, 21, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    irdaDeviceHints1 {
        get => NumGet(this, 48, "char")
        set => NumPut("char", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    irdaDeviceHints2 {
        get => NumGet(this, 49, "char")
        set => NumPut("char", value, this, 49)
    }

    /**
     * @type {Integer}
     */
    irdaCharSet {
        get => NumGet(this, 50, "char")
        set => NumPut("char", value, this, 50)
    }
}
