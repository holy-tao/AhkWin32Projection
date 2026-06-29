#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_SECURITY_BINDING_PROPERTY_CONSTRAINT.ahk" { WS_SECURITY_BINDING_PROPERTY_CONSTRAINT }
#Import ".\WS_SECURITY_BINDING_CONSTRAINT_TYPE.ahk" { WS_SECURITY_BINDING_CONSTRAINT_TYPE }

/**
 * The base class for all security binding constraint structures.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_security_binding_constraint
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_SECURITY_BINDING_CONSTRAINT {
    #StructPack 8

    /**
     * This value depends on which type of security binding constraint that is used.
     */
    type : WS_SECURITY_BINDING_CONSTRAINT_TYPE

    /**
     * A set of binding-specific security property constraints.
     *                 
     * 
     * See <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_security_binding_property_constraint">WS_SECURITY_BINDING_PROPERTY_CONSTRAINT</a> for more information.
     */
    propertyConstraints : WS_SECURITY_BINDING_PROPERTY_CONSTRAINT.Ptr

    /**
     * The number of elements in the propertyConstraints array.
     *                 
     * 
     * If the array has zero elements, the propertyConstraints field may be <b>NULL</b>.
     */
    propertyConstraintCount : UInt32

}
