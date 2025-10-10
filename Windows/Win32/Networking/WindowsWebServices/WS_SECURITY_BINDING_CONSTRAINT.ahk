#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The base class for all security binding constraint structures.
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ns-webservices-ws_security_binding_constraint
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_SECURITY_BINDING_CONSTRAINT extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * This value depends on which type of security binding constraint that is used.
     * @type {Integer}
     */
    type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * A set of binding-specific security property constraints.
     *                 
     * 
     * See <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_security_binding_property_constraint">WS_SECURITY_BINDING_PROPERTY_CONSTRAINT</a> for more information.
     * @type {Pointer<WS_SECURITY_BINDING_PROPERTY_CONSTRAINT>}
     */
    propertyConstraints {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The number of elements in the propertyConstraints array.
     *                 
     * 
     * If the array has zero elements, the propertyConstraints field may be <b>NULL</b>.
     * @type {Integer}
     */
    propertyConstraintCount {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
