#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HWND.ahk
#Include ..\..\Foundation\WPARAM.ahk

/**
 * Describes a request initiated by a call to the lineGetRequest function. This data structure is obsolete and should not be used.
 * @see https://docs.microsoft.com/windows/win32/api//tapi/ns-tapi-linereqmediacall
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 * @charset ANSI
 */
class LINEREQMEDIACALL extends Win32Struct
{
    static sizeof => 344

    static packingSize => 8

    /**
     * A handle to the window of the application that  made the request.
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
     * The identifier of the request. Used to match an asynchronous response.
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
     * The device class required to fill the request.
     * @type {String}
     */
    szDeviceClass {
        get => StrGet(this.ptr + 16, 39, "UTF-8")
        set => StrPut(value, this.ptr + 16, 39, "UTF-8")
    }

    /**
     * The device identifier.
     * @type {Array<Byte>}
     */
    ucDeviceID{
        get {
            if(!this.HasProp("__ucDeviceIDProxyArray"))
                this.__ucDeviceIDProxyArray := Win32FixedArray(this.ptr + 56, 40, Primitive, "char")
            return this.__ucDeviceIDProxyArray
        }
    }

    /**
     * Size, in bytes, of this structure.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * Not used.
     * @type {Integer}
     */
    dwSecure {
        get => NumGet(this, 100, "uint")
        set => NumPut("uint", value, this, 100)
    }

    /**
     * The destination address.
     * @type {String}
     */
    szDestAddress {
        get => StrGet(this.ptr + 104, 79, "UTF-8")
        set => StrPut(value, this.ptr + 104, 79, "UTF-8")
    }

    /**
     * The name of application that made the request.
     * @type {String}
     */
    szAppName {
        get => StrGet(this.ptr + 184, 39, "UTF-8")
        set => StrPut(value, this.ptr + 184, 39, "UTF-8")
    }

    /**
     * The called party name.
     * @type {String}
     */
    szCalledParty {
        get => StrGet(this.ptr + 224, 39, "UTF-8")
        set => StrPut(value, this.ptr + 224, 39, "UTF-8")
    }

    /**
     * The comment buffer.
     * @type {String}
     */
    szComment {
        get => StrGet(this.ptr + 264, 79, "UTF-8")
        set => StrPut(value, this.ptr + 264, 79, "UTF-8")
    }
}
