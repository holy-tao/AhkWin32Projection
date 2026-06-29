#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_WINDOWS_INTEGRATED_AUTH_CREDENTIAL.ahk" { WS_WINDOWS_INTEGRATED_AUTH_CREDENTIAL }
#Import ".\WS_SECURITY_BINDING_PROPERTIES.ahk" { WS_SECURITY_BINDING_PROPERTIES }
#Import ".\WS_SECURITY_BINDING_PROPERTY.ahk" { WS_SECURITY_BINDING_PROPERTY }

/**
 * The security binding template for specifying the use of HTP header authentication protocol based security.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_http_header_auth_security_binding_template
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_HTTP_HEADER_AUTH_SECURITY_BINDING_TEMPLATE {
    #StructPack 8

    /**
     * Application provided security binding properties that cannot be represented in policy.
     */
    securityBindingProperties : WS_SECURITY_BINDING_PROPERTIES

    /**
     * The Windows credential to be used to obtain this security token.  This
     *           is required on the client side and must be <b>NULL</b> on the server side.
     */
    clientCredential : WS_WINDOWS_INTEGRATED_AUTH_CREDENTIAL.Ptr

}
