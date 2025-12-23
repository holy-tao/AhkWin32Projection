#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WS_CHANNEL_PROPERTIES.ahk
#Include .\WS_SECURITY_PROPERTIES.ahk
#Include .\WS_SECURITY_BINDING_PROPERTIES.ahk
#Include .\WS_SSPI_TRANSPORT_SECURITY_BINDING_POLICY_DESCRIPTION.ahk
#Include .\WS_USERNAME_MESSAGE_SECURITY_BINDING_POLICY_DESCRIPTION.ahk

/**
 * Describes the policy specifying TCP channel binding with windows SSPI transport security and username/password message security.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_tcp_sspi_username_policy_description
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_TCP_SSPI_USERNAME_POLICY_DESCRIPTION extends Win32Struct
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
     * Windows SSPI security binding description.
     * @type {WS_SSPI_TRANSPORT_SECURITY_BINDING_POLICY_DESCRIPTION}
     */
    sspiTransportSecurityBinding{
        get {
            if(!this.HasProp("__sspiTransportSecurityBinding"))
                this.__sspiTransportSecurityBinding := WS_SSPI_TRANSPORT_SECURITY_BINDING_POLICY_DESCRIPTION(32, this)
            return this.__sspiTransportSecurityBinding
        }
    }

    /**
     * Username/password message security binding description.
     * @type {WS_USERNAME_MESSAGE_SECURITY_BINDING_POLICY_DESCRIPTION}
     */
    usernameMessageSecurityBinding{
        get {
            if(!this.HasProp("__usernameMessageSecurityBinding"))
                this.__usernameMessageSecurityBinding := WS_USERNAME_MESSAGE_SECURITY_BINDING_POLICY_DESCRIPTION(48, this)
            return this.__usernameMessageSecurityBinding
        }
    }
}
