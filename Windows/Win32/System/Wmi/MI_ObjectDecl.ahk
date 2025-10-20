#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains properties common to the MI_ClassDecl and MI_PropertyDecl structures.
 * @see https://docs.microsoft.com/windows/win32/api//mi/ns-mi-mi_objectdecl
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class MI_ObjectDecl extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * Flags.
     * @type {Integer}
     */
    flags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Hash code.
     * @type {Integer}
     */
    code {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Name of this feature.
     * @type {Pointer<Integer>}
     */
    name {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Describes metadata for classes and properties.
     * @type {Pointer<Pointer<MI_Qualifier>>}
     */
    qualifiers {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Length of <b>qualifiers</b> array.
     * @type {Integer}
     */
    numQualifiers {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * The properties of this object.
     * @type {Pointer<Pointer<MI_PropertyDecl>>}
     */
    properties {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * The number of properties of this object.
     * @type {Integer}
     */
    numProperties {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Size of the structure.
     * @type {Integer}
     */
    size {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }
}
