#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WS_CHANNEL_PROPERTIES.ahk
#Include .\WS_SECURITY_PROPERTIES.ahk
#Include .\WS_SECURITY_BINDING_PROPERTIES.ahk
#Include .\WS_SSL_TRANSPORT_SECURITY_BINDING_POLICY_DESCRIPTION.ahk
#Include .\WS_KERBEROS_APREQ_MESSAGE_SECURITY_BINDING_POLICY_DESCRIPTION.ahk

/**
 * Describes the policy specifying http channel binding with SSL transport security and KERBEROS AP_REQ message security.
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ns-webservices-ws_http_ssl_kerberos_apreq_policy_description
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_HTTP_SSL_KERBEROS_APREQ_POLICY_DESCRIPTION extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * Template description for the channel properties specified in policy.
     * @type {WS_CHANNEL_PROPERTIES}
     */
    channelProperties{
        get {
            if(!this.HasProp("__channelProperties"))
                this.__channelProperties := WS_CHANNEL_PROPERTIES(0, this)
            return this.__channelProperties
        }
    }

    /**
     * Template description for the security properties specified in policy.
     * @type {WS_SECURITY_PROPERTIES}
     */
    securityProperties{
        get {
            if(!this.HasProp("__securityProperties"))
                this.__securityProperties := WS_SECURITY_PROPERTIES(16, this)
            return this.__securityProperties
        }
    }

    /**
     * SSL security binding description.
     * @type {WS_SSL_TRANSPORT_SECURITY_BINDING_POLICY_DESCRIPTION}
     */
    sslTransportSecurityBinding{
        get {
            if(!this.HasProp("__sslTransportSecurityBinding"))
                this.__sslTransportSecurityBinding := WS_SSL_TRANSPORT_SECURITY_BINDING_POLICY_DESCRIPTION(32, this)
            return this.__sslTransportSecurityBinding
        }
    }

    /**
     * kerberos message security binding description.
     * @type {WS_KERBEROS_APREQ_MESSAGE_SECURITY_BINDING_POLICY_DESCRIPTION}
     */
    kerberosApreqMessageSecurityBinding{
        get {
            if(!this.HasProp("__kerberosApreqMessageSecurityBinding"))
                this.__kerberosApreqMessageSecurityBinding := WS_KERBEROS_APREQ_MESSAGE_SECURITY_BINDING_POLICY_DESCRIPTION(48, this)
            return this.__kerberosApreqMessageSecurityBinding
        }
    }
}
