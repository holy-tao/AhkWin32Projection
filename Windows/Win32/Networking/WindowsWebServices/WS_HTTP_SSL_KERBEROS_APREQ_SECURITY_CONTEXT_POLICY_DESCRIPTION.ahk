#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_SECURITY_CONTEXT_MESSAGE_SECURITY_BINDING_POLICY_DESCRIPTION.ahk" { WS_SECURITY_CONTEXT_MESSAGE_SECURITY_BINDING_POLICY_DESCRIPTION }
#Import ".\WS_MESSAGE_SECURITY_USAGE.ahk" { WS_MESSAGE_SECURITY_USAGE }
#Import ".\WS_SECURITY_BINDING_PROPERTIES.ahk" { WS_SECURITY_BINDING_PROPERTIES }
#Import ".\WS_SECURITY_PROPERTY.ahk" { WS_SECURITY_PROPERTY }
#Import ".\WS_CHANNEL_PROPERTY.ahk" { WS_CHANNEL_PROPERTY }
#Import ".\WS_SECURITY_CONTEXT_SECURITY_BINDING_POLICY_DESCRIPTION.ahk" { WS_SECURITY_CONTEXT_SECURITY_BINDING_POLICY_DESCRIPTION }
#Import ".\WS_KERBEROS_APREQ_MESSAGE_SECURITY_BINDING_POLICY_DESCRIPTION.ahk" { WS_KERBEROS_APREQ_MESSAGE_SECURITY_BINDING_POLICY_DESCRIPTION }
#Import ".\WS_SECURITY_BINDING_PROPERTY.ahk" { WS_SECURITY_BINDING_PROPERTY }
#Import ".\WS_CHANNEL_PROPERTIES.ahk" { WS_CHANNEL_PROPERTIES }
#Import ".\WS_SSL_TRANSPORT_SECURITY_BINDING_POLICY_DESCRIPTION.ahk" { WS_SSL_TRANSPORT_SECURITY_BINDING_POLICY_DESCRIPTION }
#Import ".\WS_SECURITY_PROPERTIES.ahk" { WS_SECURITY_PROPERTIES }

/**
 * Describes the policy specifying security context message binding over http channel binding, with SSL transport security. The bootstrap channel uses http channel binding with SSL transport security and KERBEROS AP_REQ message security.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_http_ssl_kerberos_apreq_security_context_policy_description
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_HTTP_SSL_KERBEROS_APREQ_SECURITY_CONTEXT_POLICY_DESCRIPTION {
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
     * SSL security binding description.
     */
    sslTransportSecurityBinding : WS_SSL_TRANSPORT_SECURITY_BINDING_POLICY_DESCRIPTION

    /**
     * kerberos message security binding description.
     */
    kerberosApreqMessageSecurityBinding : WS_KERBEROS_APREQ_MESSAGE_SECURITY_BINDING_POLICY_DESCRIPTION

    /**
     * Security context security binding description.
     */
    securityContextSecurityBinding : WS_SECURITY_CONTEXT_SECURITY_BINDING_POLICY_DESCRIPTION

}
