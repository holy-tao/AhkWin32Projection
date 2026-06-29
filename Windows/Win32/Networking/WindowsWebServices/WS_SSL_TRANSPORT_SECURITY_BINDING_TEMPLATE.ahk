#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_CERT_CREDENTIAL.ahk" { WS_CERT_CREDENTIAL }
#Import ".\WS_SECURITY_BINDING_PROPERTIES.ahk" { WS_SECURITY_BINDING_PROPERTIES }
#Import ".\WS_SECURITY_BINDING_PROPERTY.ahk" { WS_SECURITY_BINDING_PROPERTY }

/**
 * The security binding template for specifying the use of SSL/TLS protocol based transport security.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_ssl_transport_security_binding_template
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_SSL_TRANSPORT_SECURITY_BINDING_TEMPLATE {
    #StructPack 8

    /**
     * Application provided security binding properties that cannot be represented in policy.
     */
    securityBindingProperties : WS_SECURITY_BINDING_PROPERTIES

    /**
     * The local certificate credential to be used with this security binding.
     *         
     * 
     * Server side: When SSL is used for transport security with <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_channel_binding">WS_HTTP_CHANNEL_BINDING</a>, the server certificate must be
     *           registered by the application using the <a href="https://docs.microsoft.com/windows/win32/http/httpcfg-exe">HttpCfg.exe</a> and this field must be set to <b>NULL</b>.  In all other cases, the
     *           server SSL certificate must be specified using this field.
     *         
     * 
     * Client side: If a client certificate is to be used with SSL, it must
     *           be specified using this field.  If no client certificate is to be
     *           used, this field must be set to <b>NULL</b>.
     */
    localCertCredential : WS_CERT_CREDENTIAL.Ptr

}
