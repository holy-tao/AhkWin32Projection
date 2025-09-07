#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include ..\..\Foundation\HWND.ahk

/**
 * @namespace Windows.Win32.System.ErrorReporting
 * @version v4.0.30319
 */
class WER_REPORT_INFORMATION_V5 extends Win32Struct
{
    static sizeof => 2504

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {HANDLE}
     */
    hProcess{
        get {
            if(!this.HasProp("__hProcess"))
                this.__hProcess := HANDLE(this.ptr + 8)
            return this.__hProcess
        }
    }

    /**
     * @type {String}
     */
    wzConsentKey {
        get => StrGet(this.ptr + 16, 63, "UTF-16")
        set => StrPut(value, this.ptr + 16, 63, "UTF-16")
    }

    /**
     * @type {String}
     */
    wzFriendlyEventName {
        get => StrGet(this.ptr + 144, 127, "UTF-16")
        set => StrPut(value, this.ptr + 144, 127, "UTF-16")
    }

    /**
     * @type {String}
     */
    wzApplicationName {
        get => StrGet(this.ptr + 400, 127, "UTF-16")
        set => StrPut(value, this.ptr + 400, 127, "UTF-16")
    }

    /**
     * @type {String}
     */
    wzApplicationPath {
        get => StrGet(this.ptr + 656, 259, "UTF-16")
        set => StrPut(value, this.ptr + 656, 259, "UTF-16")
    }

    /**
     * @type {String}
     */
    wzDescription {
        get => StrGet(this.ptr + 1176, 511, "UTF-16")
        set => StrPut(value, this.ptr + 1176, 511, "UTF-16")
    }

    /**
     * @type {HWND}
     */
    hwndParent{
        get {
            if(!this.HasProp("__hwndParent"))
                this.__hwndParent := HWND(this.ptr + 2200)
            return this.__hwndParent
        }
    }

    /**
     * @type {String}
     */
    wzNamespacePartner {
        get => StrGet(this.ptr + 2208, 63, "UTF-16")
        set => StrPut(value, this.ptr + 2208, 63, "UTF-16")
    }

    /**
     * @type {String}
     */
    wzNamespaceGroup {
        get => StrGet(this.ptr + 2336, 63, "UTF-16")
        set => StrPut(value, this.ptr + 2336, 63, "UTF-16")
    }

    /**
     * @type {Array<Byte>}
     */
    rgbApplicationIdentity{
        get {
            if(!this.HasProp("__rgbApplicationIdentityProxyArray"))
                this.__rgbApplicationIdentityProxyArray := Win32FixedArray(this.ptr + 2464, 1, Primitive, "char")
            return this.__rgbApplicationIdentityProxyArray
        }
    }

    /**
     * @type {HANDLE}
     */
    hSnapshot{
        get {
            if(!this.HasProp("__hSnapshot"))
                this.__hSnapshot := HANDLE(this.ptr + 2480)
            return this.__hSnapshot
        }
    }

    /**
     * @type {HANDLE}
     */
    hDeleteFilesImpersonationToken{
        get {
            if(!this.HasProp("__hDeleteFilesImpersonationToken"))
                this.__hDeleteFilesImpersonationToken := HANDLE(this.ptr + 2488)
            return this.__hDeleteFilesImpersonationToken
        }
    }

    /**
     * @type {Integer}
     */
    submitResultMax {
        get => NumGet(this, 2496, "int")
        set => NumPut("int", value, this, 2496)
    }
}
