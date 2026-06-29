#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_SECURITY_BINDING_PROPERTIES.ahk" { WS_SECURITY_BINDING_PROPERTIES }
#Import ".\WS_SECURITY_PROPERTY.ahk" { WS_SECURITY_PROPERTY }
#Import ".\WS_SECURITY_BINDING_PROPERTY.ahk" { WS_SECURITY_BINDING_PROPERTY }
#Import ".\WS_SECURITY_CONTEXT_MESSAGE_SECURITY_BINDING_TEMPLATE.ahk" { WS_SECURITY_CONTEXT_MESSAGE_SECURITY_BINDING_TEMPLATE }
#Import ".\WS_SECURITY_PROPERTIES.ahk" { WS_SECURITY_PROPERTIES }

/**
 * The security binding template for specifying the use of an application supplied security context security binding. (WS_SECURITY_CONTEXT_SECURITY_BINDING_TEMPLATE)
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_security_context_security_binding_template
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_SECURITY_CONTEXT_SECURITY_BINDING_TEMPLATE {
    #StructPack 8

    /**
     * Application provided security binding properties that cannot be represented in policy.
     */
    securityContextMessageSecurityBinding : WS_SECURITY_CONTEXT_MESSAGE_SECURITY_BINDING_TEMPLATE

    /**
     * Application provided additional security properties for the service channel
     *           that cannot be represented in policy. Only policy specified security properties is used if no additional properties are specified here.
     */
    securityProperties : WS_SECURITY_PROPERTIES

}
