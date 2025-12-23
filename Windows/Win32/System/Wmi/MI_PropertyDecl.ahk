#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents a class property (element) in a class's declaration.
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_propertydecl
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class MI_PropertyDecl extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * 
     * @type {Integer}
     */
    flags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Hash code: (name[0] &lt;&lt; 16) | (name[len-1] &lt;&lt; 8) | len
     * @type {Integer}
     */
    code {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Name of this property.
     * @type {Pointer<Integer>}
     */
    name {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Qualifier set for this property.
     * @type {Pointer<Pointer<MI_Qualifier>>}
     */
    qualifiers {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Number of qualifiers.
     * @type {Integer}
     */
    numQualifiers {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Type of  property.
     * @type {Integer}
     */
    type {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Name of reference class or embedded instance class name.
     * @type {Pointer<Integer>}
     */
    className {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * If property is a fixed length array, then this value will hold the length of the array.
     * @type {Integer}
     */
    subscript {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Offset of this property field from the start of the <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_instance">MI_Instance</a>.
     * @type {Integer}
     */
    offset {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * Ancestor class that first defined a property with this name.
     * @type {Pointer<Integer>}
     */
    origin {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Ancestor class that last defined a property with this name.
     * @type {Pointer<Integer>}
     */
    propagator {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * Default value of this property.
     * @type {Pointer<Void>}
     */
    value {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }
}
