#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\FILETIME.ahk

/**
 * Provides specialized application information to Add/Remove Programs in Control Panel. This structure is not applicable to published applications.
 * @remarks
 * 
 * This structure is used by the <a href="https://docs.microsoft.com/windows/desktop/api/shappmgr/nf-shappmgr-ishellapp-getslowappinfo">IShellApp::GetSlowAppInfo</a> and <a href="https://docs.microsoft.com/windows/desktop/api/shappmgr/nf-shappmgr-ishellapp-getcachedslowappinfo">IShellApp::GetCachedSlowAppInfo</a> interfaces, neither of which are applicable to published applications. Therefore, this structure is also not applicable to published applications.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shappmgr/ns-shappmgr-slowappinfo
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class SLOWAPPINFO extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Type: <b>ULONGLONG</b>
     * 
     * The size of the application in bytes.
     * @type {Integer}
     */
    ullSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>FILETIME</b>
     * 
     * The time the application was last used.
     * @type {FILETIME}
     */
    ftLastUsed{
        get {
            if(!this.HasProp("__ftLastUsed"))
                this.__ftLastUsed := FILETIME(8, this)
            return this.__ftLastUsed
        }
    }

    /**
     * Type: <b>int</b>
     * 
     * The count of times the application has been used.
     * @type {Integer}
     */
    iTimesUsed {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A pointer to a string containing the path to the image that represents the application. The string buffer must be allocated using <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemalloc">CoTaskMemAlloc</a> and freed using <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
     * @type {PWSTR}
     */
    pszImage {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
