#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_SECURITY_BINDING_PROPERTY_CONSTRAINT.ahk" { WS_SECURITY_BINDING_PROPERTY_CONSTRAINT }
#Import ".\WS_SECURITY_BINDING_CONSTRAINT.ahk" { WS_SECURITY_BINDING_CONSTRAINT }
#Import ".\WS_SECURITY_BINDING_CONSTRAINT_TYPE.ahk" { WS_SECURITY_BINDING_CONSTRAINT_TYPE }

/**
 * A security binding constraint that corresponds to the WS_HTTP_HEADER_AUTH_SECURITY_BINDING.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_http_header_auth_security_binding_constraint
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_HTTP_HEADER_AUTH_SECURITY_BINDING_CONSTRAINT {
    #StructPack 8

    /**
     * The base binding constraint that this binding constraint derives from.
     */
    bindingConstraint : WS_SECURITY_BINDING_CONSTRAINT

}
