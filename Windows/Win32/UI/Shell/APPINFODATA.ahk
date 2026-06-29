#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Provides information about a published application to the Add/Remove Programs Control Panel utility.
 * @see https://learn.microsoft.com/windows/win32/api/shappmgr/ns-shappmgr-appinfodata
 * @namespace Windows.Win32.UI.Shell
 */
export default struct APPINFODATA {
    #StructPack 8

    /**
     * Type: <b>DWORD</b>
     * 
     * A value of type <b>DWORD</b> that specifies the size of the <b>APPINFODATA</b> data structure. This field is set by the Add/Remove Program executable code.
     */
    cbSize : UInt32 := this.Size

    /**
     * Type: <b>DWORD</b>
     * 
     * A value of type <b>DWORD</b> that specifies the bitmask that indicates which items in the structure are desired or valid. Implementations of <a href="https://docs.microsoft.com/windows/desktop/api/shappmgr/nf-shappmgr-ishellapp-getappinfo">GetAppInfo</a> should inspect this value for bits that are set and attempt to provide values corresponding to those bits. Implementations should also return with bits set for only those members that are being returned.
     */
    dwMask : UInt32

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A pointer to a string that contains the application display name. Memory for this string must be allocated using <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemalloc">CoTaskMemAlloc</a> and freed using <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
     */
    pszDisplayName : PWSTR

    /**
     * Type: <b>LPWSTR</b>
     * 
     * Not applicable to published applications.
     */
    pszVersion : PWSTR

    pszPublisher : PWSTR

    /**
     * Type: <b>LPWSTR</b>
     * 
     * Not applicable to published applications.
     */
    pszProductID : PWSTR

    /**
     * Type: <b>LPWSTR</b>
     * 
     * Not applicable to published applications.
     */
    pszRegisteredOwner : PWSTR

    /**
     * Type: <b>LPWSTR</b>
     * 
     * Not applicable to published applications.
     */
    pszRegisteredCompany : PWSTR

    /**
     * Type: <b>LPWSTR</b>
     * 
     * Not applicable to published applications.
     * 
     * Type: <b>LPWSTR</b>
     * 
     * Not applicable to published applications.
     */
    pszLanguage : PWSTR

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A URL to support information. This string is displayed as a link with the application name in Control Panel Add/Remove Programs. Memory for this string must be allocated using <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemalloc">CoTaskMemAlloc</a> and freed using <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
     */
    pszSupportUrl : PWSTR

    /**
     * Type: <b>LPWSTR</b>
     * 
     * Not applicable to published applications.
     */
    pszSupportTelephone : PWSTR

    /**
     * Type: <b>LPWSTR</b>
     * 
     * Not applicable to published applications.
     */
    pszHelpLink : PWSTR

    /**
     * Type: <b>LPWSTR</b>
     * 
     * Not applicable to published applications.
     */
    pszInstallLocation : PWSTR

    /**
     * Type: <b>LPWSTR</b>
     * 
     * Not applicable to published applications.
     */
    pszInstallSource : PWSTR

    /**
     * Type: <b>LPWSTR</b>
     * 
     * Not applicable to published applications.
     */
    pszInstallDate : PWSTR

    /**
     * Type: <b>LPWSTR</b>
     * 
     * Not applicable to published applications.
     */
    pszContact : PWSTR

    /**
     * Type: <b>LPWSTR</b>
     * 
     * Not applicable to published applications.
     */
    pszComments : PWSTR

    /**
     * Type: <b>LPWSTR</b>
     * 
     * Not applicable to published applications.
     */
    pszImage : PWSTR

    /**
     * Type: <b>LPWSTR</b>
     * 
     * Not applicable to published applications.
     */
    pszReadmeUrl : PWSTR

    /**
     * Type: <b>LPWSTR</b>
     * 
     * Not applicable to published applications.
     */
    pszUpdateInfoUrl : PWSTR

}
