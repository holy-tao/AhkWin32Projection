#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_MESSAGE_SECURITY_USAGE.ahk" { WS_MESSAGE_SECURITY_USAGE }
#Import ".\WS_WINDOWS_INTEGRATED_AUTH_CREDENTIAL.ahk" { WS_WINDOWS_INTEGRATED_AUTH_CREDENTIAL }
#Import ".\WS_SECURITY_BINDING.ahk" { WS_SECURITY_BINDING }
#Import ".\WS_SECURITY_BINDING_PROPERTY.ahk" { WS_SECURITY_BINDING_PROPERTY }
#Import ".\WS_SECURITY_BINDING_TYPE.ahk" { WS_SECURITY_BINDING_TYPE }

/**
 * The security binding subtype for specifying the use of the Kerberos AP_REQ ticket as a direct (i.e., without establishing a session) security token with WS-Security.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_kerberos_apreq_message_security_binding
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_KERBEROS_APREQ_MESSAGE_SECURITY_BINDING {
    #StructPack 8

    /**
     * The base type from which this security binding subtype and all other security binding subtypes derive.
     */
    binding : WS_SECURITY_BINDING

    /**
     * How the security token corresponding to this security binding should
     * be attached to a message.
     *                 
     * 
     * Only <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_message_security_usage">WS_SUPPORTING_MESSAGE_SECURITY_USAGE</a> is supported. With this usage, this security binding provides client authentication, but not message protection (such as signing, encryption, replay detection). Consequently, this binding is generally used together with another security binding such as the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_ssl_transport_security_binding">WS_SSL_TRANSPORT_SECURITY_BINDING</a> that provides a protected channel.
     * 
     * 
     * To use this binding on HTTP without SSL, the security description property <b>WS_SECURITY_PROPERTY_TRANSPORT_PROTECTION_LEVEL</b> must be explicitly set to <b>WS_PROTECTION_LEVEL_NONE</b>. This is not supported on the client or on TCP.
     */
    bindingUsage : WS_MESSAGE_SECURITY_USAGE

    /**
     * The Windows Integrated Authentication credential to be used to obtain
     * the Kerberos ticket.  This field is required on the client side, but
     * must be <b>NULL</b> on the server side.
     */
    clientCredential : WS_WINDOWS_INTEGRATED_AUTH_CREDENTIAL.Ptr

}
