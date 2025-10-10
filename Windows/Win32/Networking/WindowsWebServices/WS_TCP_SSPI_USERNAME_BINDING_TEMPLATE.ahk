#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WS_CHANNEL_PROPERTIES.ahk
#Include .\WS_SECURITY_PROPERTIES.ahk
#Include .\WS_SECURITY_BINDING_PROPERTIES.ahk
#Include .\WS_TCP_SSPI_TRANSPORT_SECURITY_BINDING_TEMPLATE.ahk
#Include .\WS_USERNAME_MESSAGE_SECURITY_BINDING_TEMPLATE.ahk

/**
 * Username/password security template information to be filled in by application. Associated with WS_TCP_SSPI_USERNAME_BINDING_TEMPLATE_TYPE.
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ns-webservices-ws_tcp_sspi_username_binding_template
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_TCP_SSPI_USERNAME_BINDING_TEMPLATE extends Win32Struct
{
    static sizeof => 96

    static packingSize => 8

    /**
     * Application provided additional channel properties that cannot be represented in policy.
     * @type {WS_CHANNEL_PROPERTIES}
     */
    channelProperties{
        get {
            if(!this.HasProp("__channelProperties"))
                this.__channelProperties := WS_CHANNEL_PROPERTIES(this.ptr + 0)
            return this.__channelProperties
        }
    }

    /**
     * Application provided additional security properties that cannot be represented in policy.
     * @type {WS_SECURITY_PROPERTIES}
     */
    securityProperties{
        get {
            if(!this.HasProp("__securityProperties"))
                this.__securityProperties := WS_SECURITY_PROPERTIES(this.ptr + 16)
            return this.__securityProperties
        }
    }

    /**
     * Application provided SSPI transport security information that cannot be represented
     *           in policy.
     * @type {WS_TCP_SSPI_TRANSPORT_SECURITY_BINDING_TEMPLATE}
     */
    sspiTransportSecurityBinding{
        get {
            if(!this.HasProp("__sspiTransportSecurityBinding"))
                this.__sspiTransportSecurityBinding := WS_TCP_SSPI_TRANSPORT_SECURITY_BINDING_TEMPLATE(this.ptr + 32)
            return this.__sspiTransportSecurityBinding
        }
    }

    /**
     * Application provided username/password authentication binding information
     *           that cannot be represented in policy.
     * @type {WS_USERNAME_MESSAGE_SECURITY_BINDING_TEMPLATE}
     */
    usernameMessageSecurityBinding{
        get {
            if(!this.HasProp("__usernameMessageSecurityBinding"))
                this.__usernameMessageSecurityBinding := WS_USERNAME_MESSAGE_SECURITY_BINDING_TEMPLATE(this.ptr + 56)
            return this.__usernameMessageSecurityBinding
        }
    }
}
