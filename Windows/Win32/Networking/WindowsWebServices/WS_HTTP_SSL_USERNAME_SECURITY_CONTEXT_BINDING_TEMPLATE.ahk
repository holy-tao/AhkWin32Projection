#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WS_CHANNEL_PROPERTIES.ahk
#Include .\WS_SECURITY_PROPERTIES.ahk
#Include .\WS_SECURITY_BINDING_PROPERTIES.ahk
#Include .\WS_SSL_TRANSPORT_SECURITY_BINDING_TEMPLATE.ahk
#Include .\WS_USERNAME_MESSAGE_SECURITY_BINDING_TEMPLATE.ahk
#Include .\WS_SECURITY_CONTEXT_MESSAGE_SECURITY_BINDING_TEMPLATE.ahk
#Include .\WS_SECURITY_CONTEXT_SECURITY_BINDING_TEMPLATE.ahk

/**
 * Security template information to be filled in by application. Associated with WS_HTTP_SSL_USERNAME_SECURITY_CONTEXT_BINDING_TEMPLATE_TYPE.
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ns-webservices-ws_http_ssl_username_security_context_binding_template
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_HTTP_SSL_USERNAME_SECURITY_CONTEXT_BINDING_TEMPLATE extends Win32Struct
{
    static sizeof => 128

    static packingSize => 8

    /**
     * Application provided additional channel properties for both bootstrap channel and service channel
     *           that cannot be represented in policy.
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
     * Application provided additional security properties for the bootstrap channel 
     *           that cannot be represented in policy.
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
     * Application provided SSL transport security binding information for both bootstrap channel and 
     *           service channel that cannot be represented
     *           in policy.
     * @type {WS_SSL_TRANSPORT_SECURITY_BINDING_TEMPLATE}
     */
    sslTransportSecurityBinding{
        get {
            if(!this.HasProp("__sslTransportSecurityBinding"))
                this.__sslTransportSecurityBinding := WS_SSL_TRANSPORT_SECURITY_BINDING_TEMPLATE(32, this)
            return this.__sslTransportSecurityBinding
        }
    }

    /**
     * Application provided username binding information for the bootstrap channel that cannot be represented in policy.
     * @type {WS_USERNAME_MESSAGE_SECURITY_BINDING_TEMPLATE}
     */
    usernameMessageSecurityBinding{
        get {
            if(!this.HasProp("__usernameMessageSecurityBinding"))
                this.__usernameMessageSecurityBinding := WS_USERNAME_MESSAGE_SECURITY_BINDING_TEMPLATE(56, this)
            return this.__usernameMessageSecurityBinding
        }
    }

    /**
     * Application provided security context message binding information for service channel that cannot be represented in policy.
     * @type {WS_SECURITY_CONTEXT_SECURITY_BINDING_TEMPLATE}
     */
    securityContextSecurityBinding{
        get {
            if(!this.HasProp("__securityContextSecurityBinding"))
                this.__securityContextSecurityBinding := WS_SECURITY_CONTEXT_SECURITY_BINDING_TEMPLATE(96, this)
            return this.__securityContextSecurityBinding
        }
    }
}
