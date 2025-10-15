#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\Foundation\BOOL.ahk

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
     * @type {PWSTR}
     */
    pcwszUserAgent{
        get {
            if(!this.HasProp("__pcwszUserAgent"))
                this.__pcwszUserAgent := PWSTR(this.ptr + 8)
            return this.__pcwszUserAgent
        }
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
     * @type {BOOL}
     */
    fLocalBypass{
        get {
            if(!this.HasProp("__fLocalBypass"))
                this.__fLocalBypass := BOOL(this.ptr + 20)
            return this.__fLocalBypass
        }
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
     * @type {PWSTR}
     */
    pcwszProxyName{
        get {
            if(!this.HasProp("__pcwszProxyName"))
                this.__pcwszProxyName := PWSTR(this.ptr + 32)
            return this.__pcwszProxyName
        }
    }

    /**
     * Type: <b>LPCWSTR</b>
     * 
     * The list of sites that will bypass the proxy.
     * @type {PWSTR}
     */
    pcwszBypassList{
        get {
            if(!this.HasProp("__pcwszBypassList"))
                this.__pcwszBypassList := PWSTR(this.ptr + 40)
            return this.__pcwszBypassList
        }
    }
}
