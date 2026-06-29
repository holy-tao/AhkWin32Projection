#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents a CIM qualifier declaration.
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_qualifierdecl
 * @namespace Windows.Win32.System.Wmi
 */
export default struct MI_QualifierDecl {
    #StructPack 8

    /**
     * Name of this qualifier.
     */
    name : IntPtr

    /**
     * Type of this qualifier.
     */
    type : UInt32

    /**
     * Scope of this qualifier.
     */
    scope : UInt32

    /**
     * Flavor of this qualifier. The flavor value may contain  any combination of these bit flags:
     */
    flavor : UInt32

    /**
     * Array subscript. If this is an array type with a fixed length, the subscript value represents the array length.
     */
    subscript : UInt32

    /**
     * Pointer to a qualifier value of a particular type.
     */
    value : IntPtr

}
