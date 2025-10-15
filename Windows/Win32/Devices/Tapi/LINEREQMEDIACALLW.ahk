#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HWND.ahk
#Include ..\..\Foundation\WPARAM.ahk

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
     * @type {HWND}
     */
    hWnd{
        get {
            if(!this.HasProp("__hWnd"))
                this.__hWnd := HWND(this.ptr + 0)
            return this.__hWnd
        }
    }

    /**
     * @type {WPARAM}
     */
    wRequestID{
        get {
            if(!this.HasProp("__wRequestID"))
                this.__wRequestID := WPARAM(this.ptr + 8)
            return this.__wRequestID
        }
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
