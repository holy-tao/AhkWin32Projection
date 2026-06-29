#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ISyncKnowledge.ahk" { ISyncKnowledge }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ISyncChangeBatchBase.ahk" { ISyncChangeBatchBase }

/**
 * Represents the metadata for a set of changes that is created as part of a recovery synchronization.
 * @see https://learn.microsoft.com/windows/win32/api/winsync/nn-winsync-isyncfullenumerationchangebatch
 * @namespace Windows.Win32.System.WindowsSync
 */
export default struct ISyncFullEnumerationChangeBatch extends ISyncChangeBatchBase {
    /**
     * The interface identifier for ISyncFullEnumerationChangeBatch
     * @type {Guid}
     */
    static IID := Guid("{ef64197d-4f44-4ea2-b355-4524713e3bed}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISyncFullEnumerationChangeBatch interfaces
    */
    struct Vtbl extends ISyncChangeBatchBase.Vtbl {
        GetLearnedKnowledgeAfterRecoveryComplete : IntPtr
        GetClosedLowerBoundItemId                : IntPtr
        GetClosedUpperBoundItemId                : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISyncFullEnumerationChangeBatch.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the knowledge the destination replica will learn after it applies all the changes in the recovery synchronization.
     * @returns {ISyncKnowledge} Returns the knowledge that the destination replica will learn after it applies all the changes in the recovery synchronization.
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncfullenumerationchangebatch-getlearnedknowledgeafterrecoverycomplete
     */
    GetLearnedKnowledgeAfterRecoveryComplete() {
        result := ComCall(17, this, "ptr*", &ppLearnedKnowledgeAfterRecoveryComplete := 0, "HRESULT")
        return ISyncKnowledge(ppLearnedKnowledgeAfterRecoveryComplete)
    }

    /**
     * Gets the closed lower bound on item IDs that require destination versions.
     * @remarks
     * When the destination provider processes this change batch, it must provide version information for all its items that have item IDs that fall between the specified closed lower bound and closed upper bound, inclusive.
     * @param {Pointer<Integer>} pbClosedLowerBoundItemId Returns the closed lower bound on item IDs that require destination versions.
     * @param {Pointer<Integer>} pcbIdSize Specifies the number of bytes in <i>pbClosedLowerBoundItemId</i>. Returns the number of bytes required for the size of <i>pbClosedLowerBoundItemId</i> when <i>pcbIdSize</i> is too small, or the number of bytes written to <i>pbClosedLowerBoundItemId</i>.
     * @returns {HRESULT} The possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid pointer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_MORE_DATA)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>pbClosedLowerBoundItemId</i> is too small. In this case, the required number of bytes is stored in <i>pcbIdSize</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SYNC_E_INVALID_OPERATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No group was added to the batch, or a group was opened but not ended.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncfullenumerationchangebatch-getclosedlowerbounditemid
     */
    GetClosedLowerBoundItemId(pbClosedLowerBoundItemId, pcbIdSize) {
        pbClosedLowerBoundItemIdMarshal := pbClosedLowerBoundItemId is VarRef ? "char*" : "ptr"
        pcbIdSizeMarshal := pcbIdSize is VarRef ? "uint*" : "ptr"

        result := ComCall(18, this, pbClosedLowerBoundItemIdMarshal, pbClosedLowerBoundItemId, pcbIdSizeMarshal, pcbIdSize, "HRESULT")
        return result
    }

    /**
     * Gets the closed upper bound on item IDs that require destination versions.
     * @remarks
     * When the destination provider processes this change batch, it must provide version information for all its items that have item IDs that fall between the specified closed lower bound and closed upper bound, inclusive.
     * @param {Pointer<Integer>} pbClosedUpperBoundItemId Returns the closed upper bound on item IDs that require destination versions.
     * @param {Pointer<Integer>} pcbIdSize Specifies the number of bytes in <i>pbClosedUpperBoundItemId</i>. Returns the number of bytes required for the size of <i>pbClosedUpperBoundItemId</i> when <i>pcbIdSize</i> is too small, or the number of bytes written to <i>pbClosedUpperBoundItemId</i>.
     * @returns {HRESULT} The possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid pointer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_MORE_DATA)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>pbClosedLowerBoundItemId</i> is too small. In this case, the required number of bytes is stored in <i>pcbIdSize</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SYNC_E_INVALID_OPERATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No group was added to the batch, or a group was opened but not ended.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncfullenumerationchangebatch-getclosedupperbounditemid
     */
    GetClosedUpperBoundItemId(pbClosedUpperBoundItemId, pcbIdSize) {
        pbClosedUpperBoundItemIdMarshal := pbClosedUpperBoundItemId is VarRef ? "char*" : "ptr"
        pcbIdSizeMarshal := pcbIdSize is VarRef ? "uint*" : "ptr"

        result := ComCall(19, this, pbClosedUpperBoundItemIdMarshal, pbClosedUpperBoundItemId, pcbIdSizeMarshal, pcbIdSize, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISyncFullEnumerationChangeBatch.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetLearnedKnowledgeAfterRecoveryComplete := CallbackCreate(GetMethod(implObj, "GetLearnedKnowledgeAfterRecoveryComplete"), flags, 2)
        this.vtbl.GetClosedLowerBoundItemId := CallbackCreate(GetMethod(implObj, "GetClosedLowerBoundItemId"), flags, 3)
        this.vtbl.GetClosedUpperBoundItemId := CallbackCreate(GetMethod(implObj, "GetClosedUpperBoundItemId"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetLearnedKnowledgeAfterRecoveryComplete)
        CallbackFree(this.vtbl.GetClosedLowerBoundItemId)
        CallbackFree(this.vtbl.GetClosedUpperBoundItemId)
    }
}
