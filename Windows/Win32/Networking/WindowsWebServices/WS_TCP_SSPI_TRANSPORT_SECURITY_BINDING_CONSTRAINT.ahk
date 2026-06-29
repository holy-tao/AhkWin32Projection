#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_SECURITY_BINDING_PROPERTY_CONSTRAINT.ahk" { WS_SECURITY_BINDING_PROPERTY_CONSTRAINT }
#Import ".\WS_SECURITY_BINDING_CONSTRAINT.ahk" { WS_SECURITY_BINDING_CONSTRAINT }
#Import ".\WS_SECURITY_BINDING_CONSTRAINT_TYPE.ahk" { WS_SECURITY_BINDING_CONSTRAINT_TYPE }

/**
 * A security binding constraint that corresponds to the WS_TCP_SSPI_TRANSPORT_SECURITY_BINDING.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_tcp_sspi_transport_security_binding_constraint
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_TCP_SSPI_TRANSPORT_SECURITY_BINDING_CONSTRAINT {
    #StructPack 8

    /**
     * The base binding constraint that this binding constraint derives from.
     *                 
     * 
     * There are currently no binding-specific properties defined for this binding constraint.
     */
    bindingConstraint : WS_SECURITY_BINDING_CONSTRAINT

}
