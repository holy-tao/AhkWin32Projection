#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WS_CHANNEL_PROPERTIES.ahk
#Include .\WS_SECURITY_PROPERTIES.ahk
#Include .\WS_SECURITY_BINDING_PROPERTIES.ahk
#Include .\WS_HTTP_HEADER_AUTH_SECURITY_BINDING_TEMPLATE.ahk

/**
 * HTTP header authentication security template information to be filled in by application. Associated with WS_HTTP_HEADER_AUTH_BINDING_TEMPLATE_TYPE.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_http_header_auth_binding_template
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_HTTP_HEADER_AUTH_BINDING_TEMPLATE extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * Application provided additional channel properties that cannot be represented in policy.
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
     * Application provided additional security properties that cannot be represented in policy.
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
     * Application provided header authentication security binding information that cannot be represented
     *           in policy.
     * @type {WS_HTTP_HEADER_AUTH_SECURITY_BINDING_TEMPLATE}
     */
    httpHeaderAuthSecurityBinding{
        get {
            if(!this.HasProp("__httpHeaderAuthSecurityBinding"))
                this.__httpHeaderAuthSecurityBinding := WS_HTTP_HEADER_AUTH_SECURITY_BINDING_TEMPLATE(32, this)
            return this.__httpHeaderAuthSecurityBinding
        }
    }
}
