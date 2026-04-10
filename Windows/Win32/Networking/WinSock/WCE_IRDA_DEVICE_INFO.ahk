#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
class WCE_IRDA_DEVICE_INFO extends Win32Struct {
    static sizeof => 28

    static packingSize => 2

    /**
     * @type {Array<Integer>}
     */
    irdaDeviceID {
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
        get => StrGet(this.ptr + 4, 21, "UTF-8")
        set => StrPut(value, this.ptr + 4, 21, "UTF-8")
    }

    /**
     * @type {Array<Integer>}
     */
    Reserved {
        get {
            if(!this.HasProp("__ReservedProxyArray"))
                this.__ReservedProxyArray := Win32FixedArray(this.ptr + 26, 2, Primitive, "char")
            return this.__ReservedProxyArray
        }
    }
}
