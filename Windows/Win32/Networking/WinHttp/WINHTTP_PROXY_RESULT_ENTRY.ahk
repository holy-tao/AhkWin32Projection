#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The WINHTTP_PROXY_RESULT_ENTRY structure contains a result entry from a call to WinHttpGetProxyResult.
 * @remarks
 * 
 * This structure is stored in an array inside of a <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/ns-winhttp-winhttp_proxy_result">WINHTTP_PROXY_RESULT</a> structure.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//winhttp/ns-winhttp-winhttp_proxy_result_entry
 * @namespace Windows.Win32.Networking.WinHttp
 * @version v4.0.30319
 */
class WINHTTP_PROXY_RESULT_ENTRY extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * A <b>BOOL</b> that whether a result is from a proxy. It is set to <b>TRUE</b>   if the result contains a proxy or <b>FALSE</b> if the result does not contain a proxy.
     * @type {BOOL}
     */
    fProxy {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * A BOOL that indicates if the result is bypassing a proxy (on an intranet). It is set to  <b>TRUE</b> if the result is bypassing a proxy or <b>FALSE</b> if all traffic is direct. This parameter applies only if <i>fProxy</i> is <b>FALSE</b>.
     * @type {BOOL}
     */
    fBypass {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/WinHttp/internet-scheme">INTERNET_SCHEME</a> value that specifies the scheme of the proxy.
     * @type {Integer}
     */
    ProxyScheme {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * A string that contains the hostname of the proxy.
     * @type {PWSTR}
     */
    pwszProxy {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/WinHttp/internet-port">INTERNET_PORT</a> value that specifies the port of the proxy.
     * @type {Integer}
     */
    ProxyPort {
        get => NumGet(this, 24, "ushort")
        set => NumPut("ushort", value, this, 24)
    }
}
