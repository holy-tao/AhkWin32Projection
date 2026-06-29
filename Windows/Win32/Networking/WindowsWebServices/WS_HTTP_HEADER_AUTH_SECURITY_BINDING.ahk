#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_WINDOWS_INTEGRATED_AUTH_CREDENTIAL.ahk" { WS_WINDOWS_INTEGRATED_AUTH_CREDENTIAL }
#Import ".\WS_SECURITY_BINDING.ahk" { WS_SECURITY_BINDING }
#Import ".\WS_SECURITY_BINDING_PROPERTY.ahk" { WS_SECURITY_BINDING_PROPERTY }
#Import ".\WS_SECURITY_BINDING_TYPE.ahk" { WS_SECURITY_BINDING_TYPE }

/**
 * The security binding subtype for specifying the use of HTTP header authentication against a target service or a HTTP proxy server based on the basic, digest (RFC 2617) and the SPNEGO (RFC4559) protocols.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_http_header_auth_security_binding
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_HTTP_HEADER_AUTH_SECURITY_BINDING {
    #StructPack 8

    /**
     * The base type from which this security binding subtype and all other security binding subtypes derive.
     */
    binding : WS_SECURITY_BINDING

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
     */
    clientCredential : WS_WINDOWS_INTEGRATED_AUTH_CREDENTIAL.Ptr

}
