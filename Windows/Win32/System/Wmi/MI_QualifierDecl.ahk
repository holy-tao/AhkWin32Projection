#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents a CIM qualifier declaration.
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_qualifierdecl
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class MI_QualifierDecl extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Name of this qualifier.
     * @type {Pointer<Integer>}
     */
    name {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type of this qualifier.
     * @type {Integer}
     */
    type {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Scope of this qualifier.
     * @type {Integer}
     */
    scope {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Flavor of this qualifier. The flavor value may contain  any combination of these bit flags:
     * @type {Integer}
     */
    flavor {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Array subscript. If this is an array type with a fixed length, the subscript value represents the array length.
     * @type {Integer}
     */
    subscript {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Pointer to a qualifier value of a particular type.
     * @type {Pointer<Void>}
     */
    value {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
