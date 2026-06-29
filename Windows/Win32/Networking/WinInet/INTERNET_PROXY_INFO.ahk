#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\INTERNET_ACCESS_TYPE.ahk" { INTERNET_ACCESS_TYPE }

/**
 * Contains information that is supplied with the INTERNET_OPTION_PROXY value to get or set proxy information on a handle obtained from a call to the InternetOpen function.
 * @remarks
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/wininet/ns-wininet-internet_proxy_info
 * @namespace Windows.Win32.Networking.WinInet
 */
export default struct INTERNET_PROXY_INFO {
    #StructPack 8

    dwAccessType : INTERNET_ACCESS_TYPE

    /**
     * Pointer to a string that contains the proxy server list.
     */
    lpszProxy : IntPtr

    /**
     * Pointer to a string that contains the proxy bypass list.
     */
    lpszProxyBypass : IntPtr

}
