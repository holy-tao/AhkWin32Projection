#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * A support structure used in the MI_Operation structure. Use the functions with the name prefix &quot;MI_Operation_&quot; to manipulate these structures.
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_operationft
 * @namespace Windows.Win32.System.Wmi
 */
export default struct MI_OperationFT {
    #StructPack 8

    /**
     * Closes an operation handle. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_operation_close">MI_Operation_Close</a>.
     */
    Close : IntPtr

    /**
     * Cancels a running operation. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_operation_cancel">MI_Operation_Cancel</a>.
     */
    Cancel : IntPtr

    /**
     * Gets the session associated with an operation. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_operation_getsession">MI_Operation_GetSession</a>.
     */
    GetSession : IntPtr

    /**
     * Gets a synchronous result for an instance operation. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_operation_getinstance">MI_Operation_GetInstance</a>.
     */
    GetInstance : IntPtr

    /**
     * Get the synchronous results from a subscription. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_operation_getindication">MI_Operation_GetIndication</a>.
     */
    GetIndication : IntPtr

    /**
     * Closes an operation handle. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_operation_close">MI_Operation_Close</a>.
     */
    GetClass : IntPtr

}
