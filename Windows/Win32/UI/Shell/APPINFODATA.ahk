#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * Provides information about a published application to the Add/Remove Programs Control Panel utility.
 * @see https://learn.microsoft.com/windows/win32/api/shappmgr/ns-shappmgr-appinfodata
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class APPINFODATA extends Win32Struct
{
    static sizeof => 152

    static packingSize => 8

    /**
     * Type: <b>DWORD</b>
     * 
     * A value of type <b>DWORD</b> that specifies the size of the <b>APPINFODATA</b> data structure. This field is set by the Add/Remove Program executable code.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * A value of type <b>DWORD</b> that specifies the bitmask that indicates which items in the structure are desired or valid. Implementations of <a href="https://docs.microsoft.com/windows/desktop/api/shappmgr/nf-shappmgr-ishellapp-getappinfo">GetAppInfo</a> should inspect this value for bits that are set and attempt to provide values corresponding to those bits. Implementations should also return with bits set for only those members that are being returned.
     * @type {Integer}
     */
    dwMask {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A pointer to a string that contains the application display name. Memory for this string must be allocated using <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemalloc">CoTaskMemAlloc</a> and freed using <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
     * @type {PWSTR}
     */
    pszDisplayName{
        get {
            if(!this.HasProp("__pszDisplayName"))
                this.__pszDisplayName := PWSTR(this.ptr + 8)
            return this.__pszDisplayName
        }
    }

    /**
     * Type: <b>LPWSTR</b>
     * 
     * Not applicable to published applications.
     * @type {PWSTR}
     */
    pszVersion{
        get {
            if(!this.HasProp("__pszVersion"))
                this.__pszVersion := PWSTR(this.ptr + 16)
            return this.__pszVersion
        }
    }

    /**
     * 
     * @type {PWSTR}
     */
    pszPublisher{
        get {
            if(!this.HasProp("__pszPublisher"))
                this.__pszPublisher := PWSTR(this.ptr + 24)
            return this.__pszPublisher
        }
    }

    /**
     * Type: <b>LPWSTR</b>
     * 
     * Not applicable to published applications.
     * @type {PWSTR}
     */
    pszProductID{
        get {
            if(!this.HasProp("__pszProductID"))
                this.__pszProductID := PWSTR(this.ptr + 32)
            return this.__pszProductID
        }
    }

    /**
     * Type: <b>LPWSTR</b>
     * 
     * Not applicable to published applications.
     * @type {PWSTR}
     */
    pszRegisteredOwner{
        get {
            if(!this.HasProp("__pszRegisteredOwner"))
                this.__pszRegisteredOwner := PWSTR(this.ptr + 40)
            return this.__pszRegisteredOwner
        }
    }

    /**
     * Type: <b>LPWSTR</b>
     * 
     * Not applicable to published applications.
     * @type {PWSTR}
     */
    pszRegisteredCompany{
        get {
            if(!this.HasProp("__pszRegisteredCompany"))
                this.__pszRegisteredCompany := PWSTR(this.ptr + 48)
            return this.__pszRegisteredCompany
        }
    }

    /**
     * Type: <b>LPWSTR</b>
     * 
     * Not applicable to published applications.
     * 
     * Type: <b>LPWSTR</b>
     * 
     * Not applicable to published applications.
     * @type {PWSTR}
     */
    pszLanguage{
        get {
            if(!this.HasProp("__pszLanguage"))
                this.__pszLanguage := PWSTR(this.ptr + 56)
            return this.__pszLanguage
        }
    }

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A URL to support information. This string is displayed as a link with the application name in Control Panel Add/Remove Programs. Memory for this string must be allocated using <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemalloc">CoTaskMemAlloc</a> and freed using <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
     * @type {PWSTR}
     */
    pszSupportUrl{
        get {
            if(!this.HasProp("__pszSupportUrl"))
                this.__pszSupportUrl := PWSTR(this.ptr + 64)
            return this.__pszSupportUrl
        }
    }

    /**
     * Type: <b>LPWSTR</b>
     * 
     * Not applicable to published applications.
     * @type {PWSTR}
     */
    pszSupportTelephone{
        get {
            if(!this.HasProp("__pszSupportTelephone"))
                this.__pszSupportTelephone := PWSTR(this.ptr + 72)
            return this.__pszSupportTelephone
        }
    }

    /**
     * Type: <b>LPWSTR</b>
     * 
     * Not applicable to published applications.
     * @type {PWSTR}
     */
    pszHelpLink{
        get {
            if(!this.HasProp("__pszHelpLink"))
                this.__pszHelpLink := PWSTR(this.ptr + 80)
            return this.__pszHelpLink
        }
    }

    /**
     * Type: <b>LPWSTR</b>
     * 
     * Not applicable to published applications.
     * @type {PWSTR}
     */
    pszInstallLocation{
        get {
            if(!this.HasProp("__pszInstallLocation"))
                this.__pszInstallLocation := PWSTR(this.ptr + 88)
            return this.__pszInstallLocation
        }
    }

    /**
     * Type: <b>LPWSTR</b>
     * 
     * Not applicable to published applications.
     * @type {PWSTR}
     */
    pszInstallSource{
        get {
            if(!this.HasProp("__pszInstallSource"))
                this.__pszInstallSource := PWSTR(this.ptr + 96)
            return this.__pszInstallSource
        }
    }

    /**
     * Type: <b>LPWSTR</b>
     * 
     * Not applicable to published applications.
     * @type {PWSTR}
     */
    pszInstallDate{
        get {
            if(!this.HasProp("__pszInstallDate"))
                this.__pszInstallDate := PWSTR(this.ptr + 104)
            return this.__pszInstallDate
        }
    }

    /**
     * Type: <b>LPWSTR</b>
     * 
     * Not applicable to published applications.
     * @type {PWSTR}
     */
    pszContact{
        get {
            if(!this.HasProp("__pszContact"))
                this.__pszContact := PWSTR(this.ptr + 112)
            return this.__pszContact
        }
    }

    /**
     * Type: <b>LPWSTR</b>
     * 
     * Not applicable to published applications.
     * @type {PWSTR}
     */
    pszComments{
        get {
            if(!this.HasProp("__pszComments"))
                this.__pszComments := PWSTR(this.ptr + 120)
            return this.__pszComments
        }
    }

    /**
     * Type: <b>LPWSTR</b>
     * 
     * Not applicable to published applications.
     * @type {PWSTR}
     */
    pszImage{
        get {
            if(!this.HasProp("__pszImage"))
                this.__pszImage := PWSTR(this.ptr + 128)
            return this.__pszImage
        }
    }

    /**
     * Type: <b>LPWSTR</b>
     * 
     * Not applicable to published applications.
     * @type {PWSTR}
     */
    pszReadmeUrl{
        get {
            if(!this.HasProp("__pszReadmeUrl"))
                this.__pszReadmeUrl := PWSTR(this.ptr + 136)
            return this.__pszReadmeUrl
        }
    }

    /**
     * Type: <b>LPWSTR</b>
     * 
     * Not applicable to published applications.
     * @type {PWSTR}
     */
    pszUpdateInfoUrl{
        get {
            if(!this.HasProp("__pszUpdateInfoUrl"))
                this.__pszUpdateInfoUrl := PWSTR(this.ptr + 144)
            return this.__pszUpdateInfoUrl
        }
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 152
    }
}
