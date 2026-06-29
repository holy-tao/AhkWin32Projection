#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ISyncChangeBatch.ahk" { ISyncChangeBatch }
#Import ".\ISyncFilterInfo.ahk" { ISyncFilterInfo }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Represents additional information about a set of changes.
 * @remarks
 * An <b>ISyncChangeBatchAdvanced</b> object can be obtained by passing <b>IID_ISyncChangeBatchAdvanced</b> to the <b>QueryInterface</b> method of a change batch object, such as an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winsync/nn-winsync-isyncchangebatch">ISyncChangeBatch</a> or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winsync/nn-winsync-isyncfullenumerationchangebatch">ISyncFullEnumerationChangeBatch</a> object.
 * @see https://learn.microsoft.com/windows/win32/api/winsync/nn-winsync-isyncchangebatchadvanced
 * @namespace Windows.Win32.System.WindowsSync
 */
export default struct ISyncChangeBatchAdvanced extends IUnknown {
    /**
     * The interface identifier for ISyncChangeBatchAdvanced
     * @type {Guid}
     */
    static IID := Guid("{0f1a4995-cbc8-421d-b550-5d0bebf3e9a5}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISyncChangeBatchAdvanced interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetFilterInfo                                         : IntPtr
        ConvertFullEnumerationChangeBatchToRegularChangeBatch : IntPtr
        GetUpperBoundItemId                                   : IntPtr
        GetBatchLevelKnowledgeShouldBeApplied                 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISyncChangeBatchAdvanced.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the ISyncFilterInfo that was specified when the change batch was created.
     * @returns {ISyncFilterInfo} Returns the <b>ISyncFilterInfo</b> that was specified when the change batch was created. <b>NULL</b> indicates that no filter was specified when the change batch was created.
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncchangebatchadvanced-getfilterinfo
     */
    GetFilterInfo() {
        result := ComCall(3, this, "ptr*", &ppFilterInfo := 0, "HRESULT")
        return ISyncFilterInfo(ppFilterInfo)
    }

    /**
     * Converts an ISyncFullEnumerationChangeBatch object to an ISyncChangeBatch object.
     * @returns {ISyncChangeBatch} Returns this change batch object, which is represented as an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winsync/nn-winsync-isyncchangebatch">ISyncChangeBatch</a> object.
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncchangebatchadvanced-convertfullenumerationchangebatchtoregularchangebatch
     */
    ConvertFullEnumerationChangeBatchToRegularChangeBatch() {
        result := ComCall(4, this, "ptr*", &ppChangeBatch := 0, "HRESULT")
        return ISyncChangeBatch(ppChangeBatch)
    }

    /**
     * Gets the highest item ID that is represented in the knowledge of any group in the change batch.
     * @param {Pointer<Integer>} pbItemId Returns the highest item ID that is represented in the knowledge of any group in the change batch.
     * @param {Pointer<Integer>} pcbIdSize Specifies the number of bytes in <i>pbItemId</i>. Returns the number of bytes that are necessary to retrieve the ID when <i>pbItemId</i> is too small, or returns the number of bytes written.
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
     * When <i>pbItemId</i> is too small. In this situation, the required number of bytes is returned in <i>pcbIdSize</i>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncchangebatchadvanced-getupperbounditemid
     */
    GetUpperBoundItemId(pbItemId, pcbIdSize) {
        pbItemIdMarshal := pbItemId is VarRef ? "char*" : "ptr"
        pcbIdSizeMarshal := pcbIdSize is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, pbItemIdMarshal, pbItemId, pcbIdSizeMarshal, pcbIdSize, "HRESULT")
        return result
    }

    /**
     * Gets a value that indicates whether the learned knowledge for the batch must be saved after the batch is applied to the destination replica.
     * @remarks
     * Typically, the destination provider saves the learned knowledge for each item change as it is applied to the destination replica. The value that is returned by <b>GetBatchLevelKnowledgeShouldBeApplied</b> indicates whether it is also necessary to save the learned knowledge of the change batch after the entire change batch has been applied. The learned knowledge of the change batch can be obtained by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winsync/nf-winsync-isyncchangebatchbase-getlearnedknowledge">ISyncChangeBatchBase::GetLearnedKnowledge</a>.
     * @param {Pointer<BOOL>} pfBatchKnowledgeShouldBeApplied Returns a value that indicates whether the learned knowledge for the batch must be saved after the batch is applied to the destination replica.
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
     * <dt><b>SYNC_E_BATCH_NEEDS_KNOWLEDGE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The change batch contains no changes and no knowledge.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncchangebatchadvanced-getbatchlevelknowledgeshouldbeapplied
     */
    GetBatchLevelKnowledgeShouldBeApplied(pfBatchKnowledgeShouldBeApplied) {
        pfBatchKnowledgeShouldBeAppliedMarshal := pfBatchKnowledgeShouldBeApplied is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, pfBatchKnowledgeShouldBeAppliedMarshal, pfBatchKnowledgeShouldBeApplied, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISyncChangeBatchAdvanced.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetFilterInfo := CallbackCreate(GetMethod(implObj, "GetFilterInfo"), flags, 2)
        this.vtbl.ConvertFullEnumerationChangeBatchToRegularChangeBatch := CallbackCreate(GetMethod(implObj, "ConvertFullEnumerationChangeBatchToRegularChangeBatch"), flags, 2)
        this.vtbl.GetUpperBoundItemId := CallbackCreate(GetMethod(implObj, "GetUpperBoundItemId"), flags, 3)
        this.vtbl.GetBatchLevelKnowledgeShouldBeApplied := CallbackCreate(GetMethod(implObj, "GetBatchLevelKnowledgeShouldBeApplied"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetFilterInfo)
        CallbackFree(this.vtbl.ConvertFullEnumerationChangeBatchToRegularChangeBatch)
        CallbackFree(this.vtbl.GetUpperBoundItemId)
        CallbackFree(this.vtbl.GetBatchLevelKnowledgeShouldBeApplied)
    }
}
