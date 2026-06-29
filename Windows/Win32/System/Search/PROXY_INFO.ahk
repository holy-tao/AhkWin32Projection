#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\PROXY_ACCESS.ahk" { PROXY_ACCESS }

/**
 * Stores information about a proxy. Used by ISearchProtocol.
 * @see https://learn.microsoft.com/windows/win32/api/searchapi/ns-searchapi-proxy_info
 * @namespace Windows.Win32.System.Search
 */
export default struct PROXY_INFO {
    #StructPack 8

    /**
     * Type: <b>DWORD</b>
     * 
     * The size of the structure in bytes.
     */
    dwSize : UInt32

    /**
     * Type: <b>LPCWSTR</b>
     * 
     * A pointer to a Unicode string buffer containing the user agent string.
     */
    pcwszUserAgent : PWSTR

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/searchapi/ne-searchapi-proxy_access">PROXY_ACCESS</a></b>
     * 
     * The proxy type to use.
     */
    paUseProxy : PROXY_ACCESS

    /**
     * Type: <b>BOOL</b>
     * 
     * The bypass proxy for local addresses.
     */
    fLocalBypass : BOOL

    /**
     * Type: <b>DWORD</b>
     * 
     * The port number to use.
     */
    dwPortNumber : UInt32

    /**
     * Type: <b>LPCWSTR</b>
     * 
     * A pointer to a Unicode string buffer that contains the name of the proxy server.
     */
    pcwszProxyName : PWSTR

    /**
     * Type: <b>LPCWSTR</b>
     * 
     * The list of sites that will bypass the proxy.
     */
    pcwszBypassList : PWSTR

}
