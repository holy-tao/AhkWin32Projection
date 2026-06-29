#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_SECURITY_CONTEXT_MESSAGE_SECURITY_BINDING_POLICY_DESCRIPTION.ahk" { WS_SECURITY_CONTEXT_MESSAGE_SECURITY_BINDING_POLICY_DESCRIPTION }
#Import ".\WS_MESSAGE_SECURITY_USAGE.ahk" { WS_MESSAGE_SECURITY_USAGE }
#Import ".\WS_SECURITY_BINDING_PROPERTIES.ahk" { WS_SECURITY_BINDING_PROPERTIES }
#Import ".\WS_SECURITY_PROPERTY.ahk" { WS_SECURITY_PROPERTY }
#Import ".\WS_SECURITY_BINDING_PROPERTY.ahk" { WS_SECURITY_BINDING_PROPERTY }
#Import ".\WS_SECURITY_PROPERTIES.ahk" { WS_SECURITY_PROPERTIES }

/**
 * This type description is used with template APIs to describe the security context related templates generated accordingly to input policy setting.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_security_context_security_binding_policy_description
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_SECURITY_CONTEXT_SECURITY_BINDING_POLICY_DESCRIPTION {
    #StructPack 8

    /**
     * Specifies the message security binding usage.
     */
    securityContextMessageSecurityBinding : WS_SECURITY_CONTEXT_MESSAGE_SECURITY_BINDING_POLICY_DESCRIPTION

    /**
     * Specifies the security properties for the service channel according to the specific policy.
     */
    securityProperties : WS_SECURITY_PROPERTIES

}
