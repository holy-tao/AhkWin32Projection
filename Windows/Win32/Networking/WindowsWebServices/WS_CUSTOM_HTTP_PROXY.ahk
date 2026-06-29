#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_STRING.ahk" { WS_STRING }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * A structure that is used to specify the custom proxy for the channel, using the WS_CHANNEL_PROPERTY_CUSTOM_HTTP_PROXY.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_custom_http_proxy
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_CUSTOM_HTTP_PROXY {
    #StructPack 8

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
     */
    servers : WS_STRING

    /**
     * A semicolon separated list of servers which must be bypassed by the proxy. 
     *                     The bypass list can contain the string &lt;local&gt; to indicate that 
     *                     all local machine servers are bypassed.
     */
    bypass : WS_STRING

}
