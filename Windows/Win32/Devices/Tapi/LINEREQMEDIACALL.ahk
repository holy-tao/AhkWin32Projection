#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes a request initiated by a call to the lineGetRequest function. This data structure is obsolete and should not be used.
 * @see https://learn.microsoft.com/windows/win32/api/tapi/ns-tapi-linereqmediacall
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 * @charset ANSI
 */
class LINEREQMEDIACALL extends Win32Struct
{
    static sizeof => 344

    static packingSize => 1

    /**
     * A handle to the window of the application that  made the request.
     * @type {Pointer<HWND>}
     */
    hWnd {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The identifier of the request. Used to match an asynchronous response.
     * @type {Pointer}
     */
    wRequestID {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The device class required to fill the request.
     * @type {Array<SByte>}
     */
    szDeviceClass{
        get {
            if(!this.HasProp("__szDeviceClassProxyArray"))
                this.__szDeviceClassProxyArray := Win32FixedArray(this.ptr + 16, 40, Primitive, "char")
            return this.__szDeviceClassProxyArray
        }
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
     * @type {Array<SByte>}
     */
    szDestAddress{
        get {
            if(!this.HasProp("__szDestAddressProxyArray"))
                this.__szDestAddressProxyArray := Win32FixedArray(this.ptr + 104, 80, Primitive, "char")
            return this.__szDestAddressProxyArray
        }
    }

    /**
     * The name of application that made the request.
     * @type {Array<SByte>}
     */
    szAppName{
        get {
            if(!this.HasProp("__szAppNameProxyArray"))
                this.__szAppNameProxyArray := Win32FixedArray(this.ptr + 184, 40, Primitive, "char")
            return this.__szAppNameProxyArray
        }
    }

    /**
     * The called party name.
     * @type {Array<SByte>}
     */
    szCalledParty{
        get {
            if(!this.HasProp("__szCalledPartyProxyArray"))
                this.__szCalledPartyProxyArray := Win32FixedArray(this.ptr + 224, 40, Primitive, "char")
            return this.__szCalledPartyProxyArray
        }
    }

    /**
     * The comment buffer.
     * @type {Array<SByte>}
     */
    szComment{
        get {
            if(!this.HasProp("__szCommentProxyArray"))
                this.__szCommentProxyArray := Win32FixedArray(this.ptr + 264, 80, Primitive, "char")
            return this.__szCommentProxyArray
        }
    }
}
