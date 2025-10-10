#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WS_SECURITY_BINDING.ahk

/**
 * The security binding subtype for specifying the use of HTTP header authentication against a target service or a HTTP proxy server based on the basic, digest (RFC 2617) and the SPNEGO (RFC4559) protocols.
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ns-webservices-ws_http_header_auth_security_binding
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_HTTP_HEADER_AUTH_SECURITY_BINDING extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The base type from which this security binding subtype and all other security binding subtypes derive.
     * @type {WS_SECURITY_BINDING}
     */
    binding{
        get {
            if(!this.HasProp("__binding"))
                this.__binding := WS_SECURITY_BINDING(this.ptr + 0)
            return this.__binding
        }
    }

    /**
     * The Windows Integrated Authentication credential to be used to
     * authenticate the client.  This is required on the client side and must
     * be <b>NULL</b> on the server side.
     *                 
     * 
     * If the credential used is a <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_default_windows_integrated_auth_credential">WS_DEFAULT_WINDOWS_INTEGRATED_AUTH_CREDENTIAL</a> then 
     *                     <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_binding_property_id">WS_SECURITY_BINDING_PROPERTY_HTTP_HEADER_AUTH_SCHEME</a> must be set to 
     *                     <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_node_type">WS_HTTP_HEADER_AUTH_SCHEME_NONE</a>, <b>WS_HTTP_HEADER_AUTH_SCHEME_NTLM</b>, 
     *                     <b>WS_HTTP_HEADER_AUTH_SCHEME_NEGOTIATE</b> or <b>WS_HTTP_HEADER_AUTH_SCHEME_PASSPORT</b>.
     *                     <b>WS_HTTP_HEADER_AUTH_SCHEME_PASSPORT</b> defaults to using the Passport keyring.
     * @type {Pointer<WS_WINDOWS_INTEGRATED_AUTH_CREDENTIAL>}
     */
    clientCredential {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
