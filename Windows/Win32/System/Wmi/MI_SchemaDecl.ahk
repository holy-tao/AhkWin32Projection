#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MI_ClassDecl.ahk" { MI_ClassDecl }
#Import ".\MI_QualifierDecl.ahk" { MI_QualifierDecl }

/**
 * Represents the schema objects in a CIM schema, which include CIM classes and CIM qualifier declarations.
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_schemadecl
 * @namespace Windows.Win32.System.Wmi
 */
export default struct MI_SchemaDecl {
    #StructPack 8

    /**
     * Qualifiers.
     */
    qualifierDecls : IntPtr

    /**
     * Number of qualifiers.
     */
    numQualifierDecls : UInt32

    /**
     * Classes in this schema.
     */
    classDecls : IntPtr

    /**
     * Number of <b>classDecls</b>.
     */
    numClassDecls : UInt32

}
