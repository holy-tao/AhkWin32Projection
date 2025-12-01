#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents CIM method parameters.
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_parameterdecl
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class MI_ParameterDecl extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * flags
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
     * Name of this parameter.
     * @type {Pointer<Integer>}
     */
    name {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Set of qualifiers for this parameter.
     * @type {Pointer<Pointer<MI_Qualifier>>}
     */
    qualifiers {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Number of parameter qualifiers.
     * @type {Integer}
     */
    numQualifiers {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Type of  parameter.
     * @type {Integer}
     */
    type {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Name of reference class or strongly typed embedded instance.
     * @type {Pointer<Integer>}
     */
    className {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * If the parameter is an array type of a fixed length, this value holds the subscript value.
     * @type {Integer}
     */
    subscript {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Offset from the start of the instance of where the value field of this parameter will exist.
     * @type {Integer}
     */
    offset {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }
}
