#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MI_QualifierSetFT.ahk" { MI_QualifierSetFT }

/**
 * Allows the developer to view the qualifiers of a class definition.
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_qualifierset
 * @namespace Windows.Win32.System.Wmi
 */
export default struct MI_QualifierSet {
    #StructPack 8

    /**
     * Reserved for internal use.
     */
    reserved1 : Int64

    /**
     * Reserved for internal use.
     */
    reserved2 : IntPtr

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_qualifiersetft">MI_QualifierSetFT</a> structure holding the function pointers to view the qualifier details. To enumerate over the structure, use the functions containing the "MI_QualifierSet_" prefix.
     */
    ft : MI_QualifierSetFT.Ptr

}
