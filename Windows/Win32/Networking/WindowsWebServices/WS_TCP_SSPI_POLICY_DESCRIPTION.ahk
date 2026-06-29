#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_SECURITY_BINDING_PROPERTY.ahk" { WS_SECURITY_BINDING_PROPERTY }
#Import ".\WS_SECURITY_PROPERTY.ahk" { WS_SECURITY_PROPERTY }
#Import ".\WS_SSPI_TRANSPORT_SECURITY_BINDING_POLICY_DESCRIPTION.ahk" { WS_SSPI_TRANSPORT_SECURITY_BINDING_POLICY_DESCRIPTION }
#Import ".\WS_SECURITY_PROPERTIES.ahk" { WS_SECURITY_PROPERTIES }
#Import ".\WS_SECURITY_BINDING_PROPERTIES.ahk" { WS_SECURITY_BINDING_PROPERTIES }
#Import ".\WS_CHANNEL_PROPERTIES.ahk" { WS_CHANNEL_PROPERTIES }
#Import ".\WS_CHANNEL_PROPERTY.ahk" { WS_CHANNEL_PROPERTY }

/**
 * Describes the policy specifying TCP channel binding with windows SSPI.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_tcp_sspi_policy_description
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_TCP_SSPI_POLICY_DESCRIPTION {
    #StructPack 8

    /**
     * Template description for the channel properties specified in policy.
     */
    channelProperties : WS_CHANNEL_PROPERTIES

    /**
     * Template description for the security properties specified in policy.
     */
    securityProperties : WS_SECURITY_PROPERTIES

    /**
     * Windows SSPI security binding description.
     */
    sspiTransportSecurityBinding : WS_SSPI_TRANSPORT_SECURITY_BINDING_POLICY_DESCRIPTION

}
