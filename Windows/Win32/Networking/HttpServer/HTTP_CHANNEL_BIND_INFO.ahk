#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * HTTP_CHANNEL_BIND_INFO.
 * @remarks
 * <div class="alert"><b>Note</b>  <p class="note">This structure is used to set server session or URL group properties by passing it to <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpsetserversessionproperty">HttpSetServerSessionProperty</a>  or <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpseturlgroupproperty">HttpSetUrlGroupProperty</a>.
 * 
 * <p class="note">The <b>HTTP_CHANNEL_BIND_INFO</b> structure is also returned when server session or URL group properties are queried
 * 
 * </div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/http/ns-http-http_channel_bind_info
 * @namespace Windows.Win32.Networking.HttpServer
 * @version v4.0.30319
 */
class HTTP_CHANNEL_BIND_INFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/http/ne-http-http_authentication_hardening_levels">HTTP_AUTHENTICATION_HARDENING_LEVELS</a> value indicating the hardening level  levels to be set or queried per server session or URL group.
     * @type {Integer}
     */
    Hardening {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * A bitwise OR combination of flags that determine the behavior of authentication.
     * 
     * The following values are supported.
     * 
     * 
     * <table>
     * <tr>
     * <td>Name</td>
     * <td>Value</td>
     * <td>Meaning</td>
     * </tr>
     * <tr>
     * <td>HTTP_CHANNEL_BIND_PROXY</td>
     * <td>0x1</td>
     * <td>The exact Channel Bind Token (CBT) match is bypassed. CBT is checked not to be equal to ‘unbound’. Service Principle Name (SPN) check is enabled. </td>
     * </tr>
     * <tr>
     * <td>HTTP_CHANNEL_BIND_PROXY_COHOSTING</td>
     * <td>Ox20</td>
     * <td>This flag is valid only if HTTP_CHANNEL_BIND_PROXY is also set. With the flag set, the CBT check (comparing with ‘unbound’) is skipped. The flag should be set if both secure channel traffic passed through proxy and traffic originally sent through insecure channel have to be authenticated. </td>
     * </tr>
     * <tr>
     * <td>HTTP_CHANNEL_BIND_NO_SERVICE_NAME_CHECK</td>
     * <td>0x2</td>
     * <td>SPN check always succeeds.</td>
     * </tr>
     * <tr>
     * <td>HTTP_CHANNEL_BIND_DOTLESS_SERVICE</td>
     * <td>0x4</td>
     * <td>Enables dotless service names.  Otherwise configuring CBT properties with dotless service names will fail. </td>
     * </tr>
     * <tr>
     * <td>HTTP_CHANNEL_BIND_SECURE_CHANNEL_TOKEN</td>
     * <td>0x8</td>
     * <td>Server session, URL group, or response is configured to retrieve secure channel endpoint binding for each request and pass it to user the mode application. When set, a pointer to a buffer with the secure channel endpoint binding is stored in an <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_request_channel_bind_status">HTTP_REQUEST_CHANNEL_BIND_STATUS</a> structure. </td>
     * </tr>
     * <tr>
     * <td>HTTP_CHANNEL_BIND_CLIENT_SERVICE</td>
     * <td>0x10</td>
     * <td>Server session, URL group, or response is configured to retrieve SPN for each request and pass it to the user mode application. The SPN is stored in the <b>ServiceName</b> field of the <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_request_channel_bind_status">HTTP_REQUEST_CHANNEL_BIND_STATUS</a> structure. The  type is always <b>HttpServiceBindingTypeW</b> (Unicode). 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Pointer to a buffer holding an array of 1 or more service names.  Each service name is represented by either an <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_service_binding_a">HTTP_SERVICE_BINDING_A</a> structure or an <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_service_binding_w">HTTP_SERVICE_BINDING_W</a> structure, dependent upon whether the name is ASCII or Unicode.  Regardless of which structure type is used, the array is cast into a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_service_binding_base">HTTP_SERVICE_BINDING_BASE</a> structure.
     * @type {Pointer<Pointer<HTTP_SERVICE_BINDING_BASE>>}
     */
    ServiceNames {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The number of names in <b>ServiceNames</b>.
     * @type {Integer}
     */
    NumberOfServiceNames {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
