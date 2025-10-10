#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Stores information about a proxy. Used by ISearchProtocol.
 * @see https://docs.microsoft.com/windows/win32/api//searchapi/ns-searchapi-proxy_info
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class PROXY_INFO extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * Type: <b>DWORD</b>
     * 
     * The size of the structure in bytes.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>LPCWSTR</b>
     * 
     * A pointer to a Unicode string buffer containing the user agent string.
     * @type {Pointer<Char>}
     */
    pcwszUserAgent {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/searchapi/ne-searchapi-proxy_access">PROXY_ACCESS</a></b>
     * 
     * The proxy type to use.
     * @type {Integer}
     */
    paUseProxy {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * The bypass proxy for local addresses.
     * @type {Integer}
     */
    fLocalBypass {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The port number to use.
     * @type {Integer}
     */
    dwPortNumber {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Type: <b>LPCWSTR</b>
     * 
     * A pointer to a Unicode string buffer that contains the name of the proxy server.
     * @type {Pointer<Char>}
     */
    pcwszProxyName {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Type: <b>LPCWSTR</b>
     * 
     * The list of sites that will bypass the proxy.
     * @type {Pointer<Char>}
     */
    pcwszBypassList {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }
}
