#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MI_PropertyDecl.ahk" { MI_PropertyDecl }
#Import ".\MI_Qualifier.ahk" { MI_Qualifier }

/**
 * Contains properties common to the MI_ClassDecl and MI_PropertyDecl structures.
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_objectdecl
 * @namespace Windows.Win32.System.Wmi
 */
export default struct MI_ObjectDecl {
    #StructPack 8

    /**
     * Flags.
     */
    flags : UInt32

    /**
     * Hash code.
     */
    code : UInt32

    /**
     * Name of this feature.
     */
    name : IntPtr

    /**
     * Describes metadata for classes and properties.
     */
    qualifiers : IntPtr

    /**
     * Length of <b>qualifiers</b> array.
     */
    numQualifiers : UInt32

    /**
     * The properties of this object.
     */
    properties : IntPtr

    /**
     * The number of properties of this object.
     */
    numProperties : UInt32

    /**
     * Size of the structure.
     */
    size : UInt32

}
