#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class WCE_IRDA_DEVICE_INFO extends Win32Struct
{
    static sizeof => 50

    static packingSize => 2

    /**
     * @type {Array<Byte>}
     */
    irdaDeviceID{
        get {
            if(!this.HasProp("__irdaDeviceIDProxyArray"))
                this.__irdaDeviceIDProxyArray := Win32FixedArray(this.ptr + 0, 1, Primitive, "char")
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
     * @type {Array<Byte>}
     */
    Reserved{
        get {
            if(!this.HasProp("__ReservedProxyArray"))
                this.__ReservedProxyArray := Win32FixedArray(this.ptr + 48, 1, Primitive, "char")
            return this.__ReservedProxyArray
        }
    }
}
