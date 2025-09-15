#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 * @charset Unicode
 */
class LINEREQMEDIACALLW extends Win32Struct
{
    static sizeof => 624

    static packingSize => 8

    /**
     * @type {Pointer<HWND>}
     */
    hWnd {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer}
     */
    wRequestID {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {String}
     */
    szDeviceClass {
        get => StrGet(this.ptr + 16, 39, "UTF-16")
        set => StrPut(value, this.ptr + 16, 39, "UTF-16")
    }

    /**
     * @type {Array<Byte>}
     */
    ucDeviceID{
        get {
            if(!this.HasProp("__ucDeviceIDProxyArray"))
                this.__ucDeviceIDProxyArray := Win32FixedArray(this.ptr + 96, 40, Primitive, "char")
            return this.__ucDeviceIDProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 136, "uint")
        set => NumPut("uint", value, this, 136)
    }

    /**
     * @type {Integer}
     */
    dwSecure {
        get => NumGet(this, 140, "uint")
        set => NumPut("uint", value, this, 140)
    }

    /**
     * @type {String}
     */
    szDestAddress {
        get => StrGet(this.ptr + 144, 79, "UTF-16")
        set => StrPut(value, this.ptr + 144, 79, "UTF-16")
    }

    /**
     * @type {String}
     */
    szAppName {
        get => StrGet(this.ptr + 304, 39, "UTF-16")
        set => StrPut(value, this.ptr + 304, 39, "UTF-16")
    }

    /**
     * @type {String}
     */
    szCalledParty {
        get => StrGet(this.ptr + 384, 39, "UTF-16")
        set => StrPut(value, this.ptr + 384, 39, "UTF-16")
    }

    /**
     * @type {String}
     */
    szComment {
        get => StrGet(this.ptr + 464, 79, "UTF-16")
        set => StrPut(value, this.ptr + 464, 79, "UTF-16")
    }
}
