#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include .\WS_STRING.ahk

/**
 * A structure that is used to specify the custom proxy for the channel, using the WS_CHANNEL_PROPERTY_CUSTOM_HTTP_PROXY.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_custom_http_proxy
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_CUSTOM_HTTP_PROXY extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * A semicolon-separated list of the proxy servers to be used by the channel. Each 
     *                     entry must follow the following EBNF.
     *                 
     * 
     * 
     * ``` syntax
     * 
     * &lt;server&gt;[":"&lt;port&gt;]
     * ```
     * 
     * 
     * <ul>
     * <li>server=Address of the server
     *                     </li>
     * <li>port=TCP port number 
     *                     </li>
     * </ul>
     * @type {WS_STRING}
     */
    servers{
        get {
            if(!this.HasProp("__servers"))
                this.__servers := WS_STRING(this.ptr + 0)
            return this.__servers
        }
    }

    /**
     * A semicolon separated list of servers which must be bypassed by the proxy. 
     *                     The bypass list can contain the string &lt;local&gt; to indicate that 
     *                     all local machine servers are bypassed.
     * @type {WS_STRING}
     */
    bypass{
        get {
            if(!this.HasProp("__bypass"))
                this.__bypass := WS_STRING(this.ptr + 16)
            return this.__bypass
        }
    }
}
