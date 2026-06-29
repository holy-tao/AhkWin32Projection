#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * A support structure used in the MI_Filter structure. Use the functions with the name prefix &quot;MI_Filter_&quot; to manipulate these structures.
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_filterft
 * @namespace Windows.Win32.System.Wmi
 */
export default struct MI_FilterFT {
    #StructPack 8

    /**
     * The provider calls this function to evaluate an instance against a given filter. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_filter_evaluate">MI_Filter_Evaluate</a>.
     */
    Evaluate : IntPtr

    /**
     * Gets the filter language and expression. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_filter_getexpression">MI_Filter_GetExpression</a>.
     */
    GetExpression : IntPtr

}
