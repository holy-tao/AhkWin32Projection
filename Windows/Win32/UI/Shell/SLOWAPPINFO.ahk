#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }

/**
 * Provides specialized application information to Add/Remove Programs in Control Panel. This structure is not applicable to published applications.
 * @remarks
 * This structure is used by the <a href="https://docs.microsoft.com/windows/desktop/api/shappmgr/nf-shappmgr-ishellapp-getslowappinfo">IShellApp::GetSlowAppInfo</a> and <a href="https://docs.microsoft.com/windows/desktop/api/shappmgr/nf-shappmgr-ishellapp-getcachedslowappinfo">IShellApp::GetCachedSlowAppInfo</a> interfaces, neither of which are applicable to published applications. Therefore, this structure is also not applicable to published applications.
 * @see https://learn.microsoft.com/windows/win32/api/shappmgr/ns-shappmgr-slowappinfo
 * @namespace Windows.Win32.UI.Shell
 */
export default struct SLOWAPPINFO {
    #StructPack 8

    /**
     * Type: <b>ULONGLONG</b>
     * 
     * The size of the application in bytes.
     */
    ullSize : Int64

    /**
     * Type: <b>FILETIME</b>
     * 
     * The time the application was last used.
     */
    ftLastUsed : FILETIME

    /**
     * Type: <b>int</b>
     * 
     * The count of times the application has been used.
     */
    iTimesUsed : Int32

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A pointer to a string containing the path to the image that represents the application. The string buffer must be allocated using <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemalloc">CoTaskMemAlloc</a> and freed using <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
     */
    pszImage : PWSTR

}
