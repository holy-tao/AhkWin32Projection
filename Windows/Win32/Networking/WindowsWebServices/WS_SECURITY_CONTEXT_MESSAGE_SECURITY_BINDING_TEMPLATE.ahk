#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_SECURITY_BINDING_PROPERTIES.ahk" { WS_SECURITY_BINDING_PROPERTIES }
#Import ".\WS_SECURITY_BINDING_PROPERTY.ahk" { WS_SECURITY_BINDING_PROPERTY }

/**
 * The security binding template for specifying the use of an application supplied security context security binding. (WS_SECURITY_CONTEXT_MESSAGE_SECURITY_BINDING_TEMPLATE)
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_security_context_message_security_binding_template
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_SECURITY_CONTEXT_MESSAGE_SECURITY_BINDING_TEMPLATE {
    #StructPack 8

    /**
     * Application provided security binding properties that cannot be represented in policy.
     */
    securityBindingProperties : WS_SECURITY_BINDING_PROPERTIES

}
