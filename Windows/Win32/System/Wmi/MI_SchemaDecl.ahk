#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents the schema objects in a CIM schema, which include CIM classes and CIM qualifier declarations.
 * @see https://docs.microsoft.com/windows/win32/api//mi/ns-mi-mi_schemadecl
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class MI_SchemaDecl extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Qualifiers.
     * @type {Pointer<Pointer<MI_QualifierDecl>>}
     */
    qualifierDecls {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Number of qualifiers.
     * @type {Integer}
     */
    numQualifierDecls {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Classes in this schema.
     * @type {Pointer<Pointer<MI_ClassDecl>>}
     */
    classDecls {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Number of <b>classDecls</b>.
     * @type {Integer}
     */
    numClassDecls {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
