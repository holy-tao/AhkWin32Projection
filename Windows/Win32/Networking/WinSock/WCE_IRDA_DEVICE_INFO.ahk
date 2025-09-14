#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class WCE_IRDA_DEVICE_INFO extends Win32Struct
{
    static sizeof => 28

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
     * @type {Array<Byte>}
     */
    Reserved{
        get {
            if(!this.HasProp("__ReservedProxyArray"))
                this.__ReservedProxyArray := Win32FixedArray(this.ptr + 26, 2, Primitive, "char")
            return this.__ReservedProxyArray
        }
    }
}
