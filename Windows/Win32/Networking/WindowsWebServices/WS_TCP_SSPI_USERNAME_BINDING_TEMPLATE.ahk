#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_USERNAME_CREDENTIAL.ahk" { WS_USERNAME_CREDENTIAL }
#Import ".\WS_WINDOWS_INTEGRATED_AUTH_CREDENTIAL.ahk" { WS_WINDOWS_INTEGRATED_AUTH_CREDENTIAL }
#Import ".\WS_TCP_SSPI_TRANSPORT_SECURITY_BINDING_TEMPLATE.ahk" { WS_TCP_SSPI_TRANSPORT_SECURITY_BINDING_TEMPLATE }
#Import ".\WS_SECURITY_BINDING_PROPERTY.ahk" { WS_SECURITY_BINDING_PROPERTY }
#Import ".\WS_SECURITY_PROPERTY.ahk" { WS_SECURITY_PROPERTY }
#Import ".\WS_SECURITY_PROPERTIES.ahk" { WS_SECURITY_PROPERTIES }
#Import ".\WS_SECURITY_BINDING_PROPERTIES.ahk" { WS_SECURITY_BINDING_PROPERTIES }
#Import ".\WS_CHANNEL_PROPERTIES.ahk" { WS_CHANNEL_PROPERTIES }
#Import ".\WS_CHANNEL_PROPERTY.ahk" { WS_CHANNEL_PROPERTY }
#Import ".\WS_USERNAME_MESSAGE_SECURITY_BINDING_TEMPLATE.ahk" { WS_USERNAME_MESSAGE_SECURITY_BINDING_TEMPLATE }

/**
 * Username/password security template information to be filled in by application. Associated with WS_TCP_SSPI_USERNAME_BINDING_TEMPLATE_TYPE.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_tcp_sspi_username_binding_template
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_TCP_SSPI_USERNAME_BINDING_TEMPLATE {
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
     * Application provided SSPI transport security information that cannot be represented
     *           in policy.
     */
    sspiTransportSecurityBinding : WS_TCP_SSPI_TRANSPORT_SECURITY_BINDING_TEMPLATE

    /**
     * Application provided username/password authentication binding information
     *           that cannot be represented in policy.
     */
    usernameMessageSecurityBinding : WS_USERNAME_MESSAGE_SECURITY_BINDING_TEMPLATE

}
