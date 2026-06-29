#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * A support structure used in the MI_QualifierSet structure. Use the functions with the name prefix &quot;MI_QualifierSet_&quot; to manipulate these structures.
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_qualifiersetft
 * @namespace Windows.Win32.System.Wmi
 */
export default struct MI_QualifierSetFT {
    #StructPack 8

    /**
     * Gets the number of qualifiers in a qualifier set. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_qualifierset_getqualifiercount">MI_QualifierSet_GetQualifierCount</a>.
     */
    GetQualifierCount : IntPtr

    /**
     * Gets a qualifier at the specified index. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_qualifierset_getqualifierat">MI_QualifierSet_GetQualifierAt</a>.
     */
    GetQualifierAt : IntPtr

    /**
     * Gets a named qualifier. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_qualifierset_getqualifier">MI_QualifierSet_GetQualifier</a>.
     */
    GetQualifier : IntPtr

}
