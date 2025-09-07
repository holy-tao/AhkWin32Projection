#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WS_CHANNEL_PROPERTIES.ahk
#Include .\WS_SECURITY_PROPERTIES.ahk
#Include .\WS_SECURITY_BINDING_PROPERTIES.ahk
#Include .\WS_SSL_TRANSPORT_SECURITY_BINDING_TEMPLATE.ahk
#Include .\WS_KERBEROS_APREQ_MESSAGE_SECURITY_BINDING_TEMPLATE.ahk

/**
 * Username/password security template information to be filled in by application. Associated with WS_HTTP_SSL_KERBEROS_APREQ_BINDING_TEMPLATE_TYPE.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_http_ssl_kerberos_apreq_binding_template
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_HTTP_SSL_KERBEROS_APREQ_BINDING_TEMPLATE extends Win32Struct
{
    static sizeof => 80

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
     * Application provided SSL transport security binding information that cannot be represented
     *           in policy.
     * @type {WS_SSL_TRANSPORT_SECURITY_BINDING_TEMPLATE}
     */
    sslTransportSecurityBinding{
        get {
            if(!this.HasProp("__sslTransportSecurityBinding"))
                this.__sslTransportSecurityBinding := WS_SSL_TRANSPORT_SECURITY_BINDING_TEMPLATE(this.ptr + 32)
            return this.__sslTransportSecurityBinding
        }
    }

    /**
     * Application provided kerberos binding information that cannot be represented in policy.
     * @type {WS_KERBEROS_APREQ_MESSAGE_SECURITY_BINDING_TEMPLATE}
     */
    kerberosApreqMessageSecurityBinding{
        get {
            if(!this.HasProp("__kerberosApreqMessageSecurityBinding"))
                this.__kerberosApreqMessageSecurityBinding := WS_KERBEROS_APREQ_MESSAGE_SECURITY_BINDING_TEMPLATE(this.ptr + 56)
            return this.__kerberosApreqMessageSecurityBinding
        }
    }
}
