#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WS_CHANNEL_PROPERTIES.ahk
#Include .\WS_SECURITY_PROPERTIES.ahk
#Include .\WS_SECURITY_BINDING_PROPERTIES.ahk
#Include .\WS_HTTP_HEADER_AUTH_SECURITY_BINDING_POLICY_DESCRIPTION.ahk

/**
 * Describes the policy specifying http channel binding.
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ns-webservices-ws_http_header_auth_policy_description
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_HTTP_HEADER_AUTH_POLICY_DESCRIPTION extends Win32Struct
{
    static sizeof => 48

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
     * header authentication security binding description.
     * @type {WS_HTTP_HEADER_AUTH_SECURITY_BINDING_POLICY_DESCRIPTION}
     */
    httpHeaderAuthSecurityBinding{
        get {
            if(!this.HasProp("__httpHeaderAuthSecurityBinding"))
                this.__httpHeaderAuthSecurityBinding := WS_HTTP_HEADER_AUTH_SECURITY_BINDING_POLICY_DESCRIPTION(32, this)
            return this.__httpHeaderAuthSecurityBinding
        }
    }
}
