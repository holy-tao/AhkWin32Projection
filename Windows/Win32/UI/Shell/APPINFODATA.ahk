#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Provides information about a published application to the Add/Remove Programs Control Panel utility.
 * @see https://docs.microsoft.com/windows/win32/api//shappmgr/ns-shappmgr-appinfodata
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
     * @type {Pointer<Char>}
     */
    pszDisplayName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: <b>LPWSTR</b>
     * 
     * Not applicable to published applications.
     * @type {Pointer<Char>}
     */
    pszVersion {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * 
     * @type {Pointer<Char>}
     */
    pszPublisher {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Type: <b>LPWSTR</b>
     * 
     * Not applicable to published applications.
     * @type {Pointer<Char>}
     */
    pszProductID {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Type: <b>LPWSTR</b>
     * 
     * Not applicable to published applications.
     * @type {Pointer<Char>}
     */
    pszRegisteredOwner {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Type: <b>LPWSTR</b>
     * 
     * Not applicable to published applications.
     * @type {Pointer<Char>}
     */
    pszRegisteredCompany {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Type: <b>LPWSTR</b>
     * 
     * Not applicable to published applications.
     * 
     * Type: <b>LPWSTR</b>
     * 
     * Not applicable to published applications.
     * @type {Pointer<Char>}
     */
    pszLanguage {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A URL to support information. This string is displayed as a link with the application name in Control Panel Add/Remove Programs. Memory for this string must be allocated using <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemalloc">CoTaskMemAlloc</a> and freed using <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
     * @type {Pointer<Char>}
     */
    pszSupportUrl {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * Type: <b>LPWSTR</b>
     * 
     * Not applicable to published applications.
     * @type {Pointer<Char>}
     */
    pszSupportTelephone {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * Type: <b>LPWSTR</b>
     * 
     * Not applicable to published applications.
     * @type {Pointer<Char>}
     */
    pszHelpLink {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * Type: <b>LPWSTR</b>
     * 
     * Not applicable to published applications.
     * @type {Pointer<Char>}
     */
    pszInstallLocation {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * Type: <b>LPWSTR</b>
     * 
     * Not applicable to published applications.
     * @type {Pointer<Char>}
     */
    pszInstallSource {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * Type: <b>LPWSTR</b>
     * 
     * Not applicable to published applications.
     * @type {Pointer<Char>}
     */
    pszInstallDate {
        get => NumGet(this, 104, "ptr")
        set => NumPut("ptr", value, this, 104)
    }

    /**
     * Type: <b>LPWSTR</b>
     * 
     * Not applicable to published applications.
     * @type {Pointer<Char>}
     */
    pszContact {
        get => NumGet(this, 112, "ptr")
        set => NumPut("ptr", value, this, 112)
    }

    /**
     * Type: <b>LPWSTR</b>
     * 
     * Not applicable to published applications.
     * @type {Pointer<Char>}
     */
    pszComments {
        get => NumGet(this, 120, "ptr")
        set => NumPut("ptr", value, this, 120)
    }

    /**
     * Type: <b>LPWSTR</b>
     * 
     * Not applicable to published applications.
     * @type {Pointer<Char>}
     */
    pszImage {
        get => NumGet(this, 128, "ptr")
        set => NumPut("ptr", value, this, 128)
    }

    /**
     * Type: <b>LPWSTR</b>
     * 
     * Not applicable to published applications.
     * @type {Pointer<Char>}
     */
    pszReadmeUrl {
        get => NumGet(this, 136, "ptr")
        set => NumPut("ptr", value, this, 136)
    }

    /**
     * Type: <b>LPWSTR</b>
     * 
     * Not applicable to published applications.
     * @type {Pointer<Char>}
     */
    pszUpdateInfoUrl {
        get => NumGet(this, 144, "ptr")
        set => NumPut("ptr", value, this, 144)
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
