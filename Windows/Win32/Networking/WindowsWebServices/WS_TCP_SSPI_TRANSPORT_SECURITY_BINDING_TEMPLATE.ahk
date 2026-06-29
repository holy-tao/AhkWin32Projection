#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_WINDOWS_INTEGRATED_AUTH_CREDENTIAL.ahk" { WS_WINDOWS_INTEGRATED_AUTH_CREDENTIAL }
#Import ".\WS_SECURITY_BINDING_PROPERTIES.ahk" { WS_SECURITY_BINDING_PROPERTIES }
#Import ".\WS_SECURITY_BINDING_PROPERTY.ahk" { WS_SECURITY_BINDING_PROPERTY }

/**
 * The security binding template for specifying the use of Windows SSPI protocol based transport security.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_tcp_sspi_transport_security_binding_template
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_TCP_SSPI_TRANSPORT_SECURITY_BINDING_TEMPLATE {
    #StructPack 8

    /**
     * Application provided security binding properties that cannot be represented in policy.
     */
    securityBindingProperties : WS_SECURITY_BINDING_PROPERTIES

    /**
     * The Windows credential to be used to obtain this security token.  This
     *           is required on the client and must not be specified on the server.
     */
    clientCredential : WS_WINDOWS_INTEGRATED_AUTH_CREDENTIAL.Ptr

}
