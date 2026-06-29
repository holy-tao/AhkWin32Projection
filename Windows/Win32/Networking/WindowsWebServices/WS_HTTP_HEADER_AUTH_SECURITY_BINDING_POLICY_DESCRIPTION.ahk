#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_SECURITY_BINDING_PROPERTIES.ahk" { WS_SECURITY_BINDING_PROPERTIES }
#Import ".\WS_SECURITY_BINDING_PROPERTY.ahk" { WS_SECURITY_BINDING_PROPERTY }

/**
 * This type description is used with template APIs to describe the templates generated accordingly to input policy setting. (WS_HTTP_HEADER_AUTH_SECURITY_BINDING_POLICY_DESCRIPTION)
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_http_header_auth_security_binding_policy_description
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_HTTP_HEADER_AUTH_SECURITY_BINDING_POLICY_DESCRIPTION {
    #StructPack 8

    /**
     * Specifies the security binding properties according to the specific policy.
     */
    securityBindingProperties : WS_SECURITY_BINDING_PROPERTIES

}
