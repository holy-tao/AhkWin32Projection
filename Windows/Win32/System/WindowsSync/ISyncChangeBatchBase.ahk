#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumSyncChanges.ahk
#Include .\ISyncChangeBuilder.ahk
#Include .\ISyncKnowledge.ahk
#Include .\IForgottenKnowledge.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Represents metadata for a set of changes.
 * @remarks
 * 
 * <b>ISyncChangeBatchBase</b> is the base interface for change batches. Typically, it is overridden by a derived interface, such as <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winsync/nn-winsync-isyncchangebatch">ISyncChangeBatch</a> for a knowledge synchronization, and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winsync/nn-winsync-isyncfullenumerationchangebatch">ISyncFullEnumerationChangeBatch</a> for a full enumeration synchronization.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//winsync/nn-winsync-isyncchangebatchbase
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class ISyncChangeBatchBase extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISyncChangeBatchBase
     * @type {Guid}
     */
    static IID => Guid("{52f6e694-6a71-4494-a184-a8311bf5d227}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetChangeEnumerator", "GetIsLastBatch", "GetWorkEstimateForBatch", "GetRemainingWorkEstimateForSession", "BeginOrderedGroup", "EndOrderedGroup", "AddItemMetadataToGroup", "GetLearnedKnowledge", "GetPrerequisiteKnowledge", "GetSourceForgottenKnowledge", "SetLastBatch", "SetWorkEstimateForBatch", "SetRemainingWorkEstimateForSession", "Serialize"]

    /**
     * Gets an IEnumSyncChanges object that enumerates the item changes in this change batch.
     * @returns {IEnumSyncChanges} Returns an enumerator that contains the item changes in this change batch.
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-isyncchangebatchbase-getchangeenumerator
     */
    GetChangeEnumerator() {
        result := ComCall(3, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumSyncChanges(ppEnum)
    }

    /**
     * Gets a flag that indicates whether the changes in this change batch are the last batch of a synchronization session.
     * @param {Pointer<BOOL>} pfLastBatch Returns a flag that indicates whether this batch is the last batch.
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
     * <dt><b>E_POINTER
     * 
     * </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>pfLastBatch</i> is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-isyncchangebatchbase-getislastbatch
     */
    GetIsLastBatch(pfLastBatch) {
        pfLastBatchMarshal := pfLastBatch is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, pfLastBatchMarshal, pfLastBatch, "HRESULT")
        return result
    }

    /**
     * Gets the work estimate for the batch.
     * @param {Pointer<Integer>} pdwWorkForBatch Returns the work estimate for the batch. The default value is 0.
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
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-isyncchangebatchbase-getworkestimateforbatch
     */
    GetWorkEstimateForBatch(pdwWorkForBatch) {
        pdwWorkForBatchMarshal := pdwWorkForBatch is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, pdwWorkForBatchMarshal, pdwWorkForBatch, "HRESULT")
        return result
    }

    /**
     * Gets the estimate of the remaining work for the session.
     * @param {Pointer<Integer>} pdwRemainingWorkForSession The estimated remaining work for the session. The default value is 0.
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
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-isyncchangebatchbase-getremainingworkestimateforsession
     */
    GetRemainingWorkEstimateForSession(pdwRemainingWorkForSession) {
        pdwRemainingWorkForSessionMarshal := pdwRemainingWorkForSession is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, pdwRemainingWorkForSessionMarshal, pdwRemainingWorkForSession, "HRESULT")
        return result
    }

    /**
     * Opens an ordered group in the change batch. This group is ordered by item ID.
     * @param {Pointer<Integer>} pbLowerBound The closed lower bound of item IDs for this ordered group. To specify a lower bound of zero, use <b>NULL</b>.
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
     * <dt><b>SYNC_E_INVALID_OPERATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A group is already open or an empty group was previously added to the batch.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SYNC_E_CHANGE_BATCH_IS_READ_ONLY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object is an <b>ISyncFullEnumerationChangeBatch</b>  object and a group has already been added to the batch. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SYNC_E_RANGE_OUT_OF_ORDER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object is an <b>ISyncFullEnumerationChangeBatch</b> object and <i>pbLowerBound</i> is greater than the lower bound ID that was used to create the batch.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-isyncchangebatchbase-beginorderedgroup
     */
    BeginOrderedGroup(pbLowerBound) {
        pbLowerBoundMarshal := pbLowerBound is VarRef ? "char*" : "ptr"

        result := ComCall(7, this, pbLowerBoundMarshal, pbLowerBound, "HRESULT")
        return result
    }

    /**
     * Closes a previously opened ordered group in the change batch.
     * @param {Pointer<Integer>} pbUpperBound The closed upper bound of item IDs for this ordered group. To specify an upper bound of infinity, use <b>NULL</b>.
     * @param {ISyncKnowledge} pMadeWithKnowledge The knowledge of the replica that made this group.
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
     * <dt><b>SYNC_E_INVALID_OPERATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No group is open or an unordered group is open.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SYNC_E_RANGE_OUT_OF_ORDER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>pbUpperBound</i> is less than the ID of the last item that was added to the group.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SYNC_E_CHANGE_BATCH_IS_READ_ONLY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object is an <b>ISyncFullEnumerationChangeBatch</b> object and a group has already been added to the batch.
     *  
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-isyncchangebatchbase-endorderedgroup
     */
    EndOrderedGroup(pbUpperBound, pMadeWithKnowledge) {
        pbUpperBoundMarshal := pbUpperBound is VarRef ? "char*" : "ptr"

        result := ComCall(8, this, pbUpperBoundMarshal, pbUpperBound, "ptr", pMadeWithKnowledge, "HRESULT")
        return result
    }

    /**
     * Adds a specified item change to the group that is currently open.
     * @param {Pointer<Integer>} pbOwnerReplicaId The replica ID of the replica where <i>pChangeVersion</i> and <i>pCreationVersion</i> are valid. The ID format must match the format that is specified by the <a href="https://docs.microsoft.com/windows/desktop/api/winsync/ns-winsync-id_parameters">ID_PARAMETERS</a> structure of the provider.
     * @param {Pointer<Integer>} pbItemId The ID of the item. The ID format must match the format that is specified by the <a href="https://docs.microsoft.com/windows/desktop/api/winsync/ns-winsync-id_parameters">ID_PARAMETERS</a> structure of the provider.
     * @param {Pointer<SYNC_VERSION>} pChangeVersion The version of this change.
     * @param {Pointer<SYNC_VERSION>} pCreationVersion The creation version of the item.
     * @param {Integer} dwFlags Flags that specify the state of the item change. For the flag values, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winsync/nf-winsync-isyncchange-getflags">ISyncChange::GetFlags</a>.
     * @param {Integer} dwWorkForChange The work estimate for the change. This value is used during change application to report completed work to the application.
     * @returns {ISyncChangeBuilder} Returns an object that can be used to add change unit information to the change.
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-isyncchangebatchbase-additemmetadatatogroup
     */
    AddItemMetadataToGroup(pbOwnerReplicaId, pbItemId, pChangeVersion, pCreationVersion, dwFlags, dwWorkForChange) {
        pbOwnerReplicaIdMarshal := pbOwnerReplicaId is VarRef ? "char*" : "ptr"
        pbItemIdMarshal := pbItemId is VarRef ? "char*" : "ptr"

        result := ComCall(9, this, pbOwnerReplicaIdMarshal, pbOwnerReplicaId, pbItemIdMarshal, pbItemId, "ptr", pChangeVersion, "ptr", pCreationVersion, "uint", dwFlags, "uint", dwWorkForChange, "ptr*", &ppChangeBuilder := 0, "HRESULT")
        return ISyncChangeBuilder(ppChangeBuilder)
    }

    /**
     * Gets the knowledge that the destination replica learns when the destination provider applies all the changes in this change batch.
     * @returns {ISyncKnowledge} Returns the knowledge that a replica will learn when a provider applies all the changes in this change batch to the replica. This knowledge is valid only when the current knowledge of the replica contains the prerequisite knowledge of the change batch. The prerequisite knowledge can be obtained by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winsync/nf-winsync-isyncchangebatchbase-getprerequisiteknowledge">ISyncChangeBatchBase::GetPrerequisiteKnowledge</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-isyncchangebatchbase-getlearnedknowledge
     */
    GetLearnedKnowledge() {
        result := ComCall(10, this, "ptr*", &ppLearnedKnowledge := 0, "HRESULT")
        return ISyncKnowledge(ppLearnedKnowledge)
    }

    /**
     * Gets the minimum knowledge that a destination provider is required to have to process this change batch.
     * @returns {ISyncKnowledge} Returns the minimum knowledge that a destination provider is required to have to process this change batch.
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-isyncchangebatchbase-getprerequisiteknowledge
     */
    GetPrerequisiteKnowledge() {
        result := ComCall(11, this, "ptr*", &ppPrerequisteKnowledge := 0, "HRESULT")
        return ISyncKnowledge(ppPrerequisteKnowledge)
    }

    /**
     * Gets the forgotten knowledge of the source replica.
     * @returns {IForgottenKnowledge} Returns the forgotten knowledge of the source replica.
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-isyncchangebatchbase-getsourceforgottenknowledge
     */
    GetSourceForgottenKnowledge() {
        result := ComCall(12, this, "ptr*", &ppSourceForgottenKnowledge := 0, "HRESULT")
        return IForgottenKnowledge(ppSourceForgottenKnowledge)
    }

    /**
     * Sets a flag that indicates there are no more changes to be enumerated in the synchronization session.
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
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-isyncchangebatchbase-setlastbatch
     */
    SetLastBatch() {
        result := ComCall(13, this, "HRESULT")
        return result
    }

    /**
     * Sets the work estimate for the batch.
     * @param {Integer} dwWorkForBatch The work estimate for the batch.
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
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-isyncchangebatchbase-setworkestimateforbatch
     */
    SetWorkEstimateForBatch(dwWorkForBatch) {
        result := ComCall(14, this, "uint", dwWorkForBatch, "HRESULT")
        return result
    }

    /**
     * Sets the estimate of the remaining work for the session.
     * @param {Integer} dwRemainingWorkForSession The estimate of the remaining work for the session.
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
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-isyncchangebatchbase-setremainingworkestimateforsession
     */
    SetRemainingWorkEstimateForSession(dwRemainingWorkForSession) {
        result := ComCall(15, this, "uint", dwRemainingWorkForSession, "HRESULT")
        return result
    }

    /**
     * Serializes the change batch to an array of bytes.
     * @param {Pointer<Integer>} pbChangeBatch The byte array that receives the change batch data.
     * @param {Pointer<Integer>} pcbChangeBatch Specifies the number of bytes in <i>pbChangeBatch</i>. Returns the number of bytes required for <i>pbChangeBatch</i> when <i>pbChangeBatch</i> is too small, or the number of bytes written to <i>pbChangeBatch</i> when data is written.
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
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_MORE_DATA)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>pbChangeBatch</i> is too small. In this case, the required number of bytes is stored in <i>pcbChangeBatch</i>.
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
     * The last group added to the batch was not ended.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-isyncchangebatchbase-serialize
     */
    Serialize(pbChangeBatch, pcbChangeBatch) {
        pbChangeBatchMarshal := pbChangeBatch is VarRef ? "char*" : "ptr"
        pcbChangeBatchMarshal := pcbChangeBatch is VarRef ? "uint*" : "ptr"

        result := ComCall(16, this, pbChangeBatchMarshal, pbChangeBatch, pcbChangeBatchMarshal, pcbChangeBatch, "HRESULT")
        return result
    }
}
