#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_CERT_CREDENTIAL.ahk" { WS_CERT_CREDENTIAL }
#Import ".\WS_SECURITY_BINDING_PROPERTIES.ahk" { WS_SECURITY_BINDING_PROPERTIES }
#Import ".\WS_SECURITY_PROPERTY.ahk" { WS_SECURITY_PROPERTY }
#Import ".\WS_CHANNEL_PROPERTY.ahk" { WS_CHANNEL_PROPERTY }
#Import ".\WS_SSL_TRANSPORT_SECURITY_BINDING_TEMPLATE.ahk" { WS_SSL_TRANSPORT_SECURITY_BINDING_TEMPLATE }
#Import ".\WS_SECURITY_BINDING_PROPERTY.ahk" { WS_SECURITY_BINDING_PROPERTY }
#Import ".\WS_CHANNEL_PROPERTIES.ahk" { WS_CHANNEL_PROPERTIES }
#Import ".\WS_SECURITY_PROPERTIES.ahk" { WS_SECURITY_PROPERTIES }

/**
 * SSL security template information to be filled in by application. Associated with WS_HTTP_SSL_BINDING_TEMPLATE_TYPE.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_http_ssl_binding_template
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_HTTP_SSL_BINDING_TEMPLATE {
    #StructPack 8

    /**
     * Application provided additional channel properties that cannot be represented in policy.
     */
    channelProperties : WS_CHANNEL_PROPERTIES

    /**
     * Application provided additional security properties that cannot be represented in policy.
     */
    securityProperties : WS_SECURITY_PROPERTIES

    /**
     * Application provided SSL transport security binding information that cannot be represented
     *           in policy.
     */
    sslTransportSecurityBinding : WS_SSL_TRANSPORT_SECURITY_BINDING_TEMPLATE

}
