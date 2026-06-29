#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\WINHTTP_ACCESS_TYPE.ahk" { WINHTTP_ACCESS_TYPE }

/**
 * The WINHTTP_PROXY_INFO structure contains the session or default proxy configuration.
 * @remarks
 * This structure is used with 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpsetoption">WinHttpSetOption</a> and 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpqueryoption">WinHttpQueryOption</a> to get or set the proxy configuration for the current session by specifying the WINHTTP_OPTION_PROXY flag.
 * 
 * This structure is used with 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpsetdefaultproxyconfiguration">WinHttpSetDefaultProxyConfiguration</a> and 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpgetdefaultproxyconfiguration">WinHttpGetDefaultProxyConfiguration</a> to get or set the default proxy configuration in the registry.
 * 
 * The proxy server list contains one or more of the following strings separated by semicolons or whitespace.
 * 
 * 
 * 
 * ``` syntax
 * ([<scheme>=][<scheme>"://"]<server>[":"<port>])
 * ```
 * 
 * The proxy bypass list contains one or more server names separated by semicolons or whitespace.  The proxy bypass list can also contain the string "&lt;local&gt;" to indicate that all local intranet sites are bypassed.  Local intranet sites are considered to be all servers that do not contain a period in their name.
 * 
 * <div class="alert"><b>Note</b>  For Windows XP and Windows 2000, see the <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Run-Time Requirements</a> section of the WinHttp start page.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/winhttp/ns-winhttp-winhttp_proxy_info
 * @namespace Windows.Win32.Networking.WinHttp
 */
export default struct WINHTTP_PROXY_INFO {
    #StructPack 8

    dwAccessType : WINHTTP_ACCESS_TYPE

    /**
     * Pointer to a string value that contains the proxy server list.
     */
    lpszProxy : PWSTR

    /**
     * Pointer to a string value that contains the proxy bypass list.
     */
    lpszProxyBypass : PWSTR

}
