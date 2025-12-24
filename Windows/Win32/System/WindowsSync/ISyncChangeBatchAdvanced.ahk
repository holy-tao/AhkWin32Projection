#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISyncFilterInfo.ahk
#Include .\ISyncChangeBatch.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Represents additional information about a set of changes.
 * @remarks
 * 
 * An <b>ISyncChangeBatchAdvanced</b> object can be obtained by passing <b>IID_ISyncChangeBatchAdvanced</b> to the <b>QueryInterface</b> method of a change batch object, such as an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winsync/nn-winsync-isyncchangebatch">ISyncChangeBatch</a> or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winsync/nn-winsync-isyncfullenumerationchangebatch">ISyncFullEnumerationChangeBatch</a> object.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//winsync/nn-winsync-isyncchangebatchadvanced
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class ISyncChangeBatchAdvanced extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISyncChangeBatchAdvanced
     * @type {Guid}
     */
    static IID => Guid("{0f1a4995-cbc8-421d-b550-5d0bebf3e9a5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetFilterInfo", "ConvertFullEnumerationChangeBatchToRegularChangeBatch", "GetUpperBoundItemId", "GetBatchLevelKnowledgeShouldBeApplied"]

    /**
     * Gets the ISyncFilterInfo that was specified when the change batch was created.
     * @returns {ISyncFilterInfo} Returns the <b>ISyncFilterInfo</b> that was specified when the change batch was created. <b>NULL</b> indicates that no filter was specified when the change batch was created.
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-isyncchangebatchadvanced-getfilterinfo
     */
    GetFilterInfo() {
        result := ComCall(3, this, "ptr*", &ppFilterInfo := 0, "HRESULT")
        return ISyncFilterInfo(ppFilterInfo)
    }

    /**
     * Converts an ISyncFullEnumerationChangeBatch object to an ISyncChangeBatch object.
     * @returns {ISyncChangeBatch} Returns this change batch object, which is represented as an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winsync/nn-winsync-isyncchangebatch">ISyncChangeBatch</a> object.
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-isyncchangebatchadvanced-convertfullenumerationchangebatchtoregularchangebatch
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
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-isyncchangebatchadvanced-getupperbounditemid
     */
    GetUpperBoundItemId(pbItemId, pcbIdSize) {
        pbItemIdMarshal := pbItemId is VarRef ? "char*" : "ptr"
        pcbIdSizeMarshal := pcbIdSize is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, pbItemIdMarshal, pbItemId, pcbIdSizeMarshal, pcbIdSize, "HRESULT")
        return result
    }

    /**
     * Gets a value that indicates whether the learned knowledge for the batch must be saved after the batch is applied to the destination replica.
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
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-isyncchangebatchadvanced-getbatchlevelknowledgeshouldbeapplied
     */
    GetBatchLevelKnowledgeShouldBeApplied(pfBatchKnowledgeShouldBeApplied) {
        pfBatchKnowledgeShouldBeAppliedMarshal := pfBatchKnowledgeShouldBeApplied is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, pfBatchKnowledgeShouldBeAppliedMarshal, pfBatchKnowledgeShouldBeApplied, "HRESULT")
        return result
    }
}
