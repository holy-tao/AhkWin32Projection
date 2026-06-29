#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\WINHTTP_INTERNET_SCHEME.ahk" { WINHTTP_INTERNET_SCHEME }

/**
 * The WINHTTP_PROXY_RESULT_ENTRY structure contains a result entry from a call to WinHttpGetProxyResult.
 * @remarks
 * This structure is stored in an array inside of a <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/ns-winhttp-winhttp_proxy_result">WINHTTP_PROXY_RESULT</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/winhttp/ns-winhttp-winhttp_proxy_result_entry
 * @namespace Windows.Win32.Networking.WinHttp
 */
export default struct WINHTTP_PROXY_RESULT_ENTRY {
    #StructPack 8

    /**
     * A <b>BOOL</b> that whether a result is from a proxy. It is set to <b>TRUE</b>   if the result contains a proxy or <b>FALSE</b> if the result does not contain a proxy.
     */
    fProxy : BOOL

    /**
     * A BOOL that indicates if the result is bypassing a proxy (on an intranet). It is set to  <b>TRUE</b> if the result is bypassing a proxy or <b>FALSE</b> if all traffic is direct. This parameter applies only if <i>fProxy</i> is <b>FALSE</b>.
     */
    fBypass : BOOL

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/WinHttp/internet-scheme">INTERNET_SCHEME</a> value that specifies the scheme of the proxy.
     */
    ProxyScheme : WINHTTP_INTERNET_SCHEME

    /**
     * A string that contains the hostname of the proxy.
     */
    pwszProxy : PWSTR

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/WinHttp/internet-port">INTERNET_PORT</a> value that specifies the port of the proxy.
     */
    ProxyPort : UInt16

}
