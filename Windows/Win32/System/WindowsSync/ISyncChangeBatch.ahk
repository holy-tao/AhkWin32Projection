#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISyncChangeBuilder.ahk
#Include .\ISyncChangeBatchBase.ahk

/**
 * Represents metadata for a set of changes.
 * @remarks
 * 
 * Change batches are used by synchronization providers to communicate metadata for item changes from a source provider to a destination provider. The source provider enumerates changes and adds a specified number of them to a change batch. The change batch is then sent to the destination provider. The destination provider enumerates the changes in the change batch and applies them to its item store.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//winsync/nn-winsync-isyncchangebatch
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class ISyncChangeBatch extends ISyncChangeBatchBase{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISyncChangeBatch
     * @type {Guid}
     */
    static IID => Guid("{70c64dee-380f-4c2e-8f70-31c55bd5f9b3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 17

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["BeginUnorderedGroup", "EndUnorderedGroup", "AddLoggedConflict"]

    /**
     * Opens an unordered group in the change batch. Item changes in this group can be in any order.
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
     * <td width="60%"></td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-isyncchangebatch-beginunorderedgroup
     */
    BeginUnorderedGroup() {
        result := ComCall(17, this, "HRESULT")
        return result
    }

    /**
     * Closes a previously opened unordered group in the change batch.
     * @param {ISyncKnowledge} pMadeWithKnowledge The made-with knowledge for the changes in the group. Typically, this is the knowledge of the replica that made this group.
     * @param {BOOL} fAllChangesForKnowledge <b>TRUE</b> when all the changes contained in <i>pMadeWithKnowledge</i> are included in this change batch; otherwise, <b>FALSE</b>.
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
     * No group is open or an ordered group is open.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SYNC_E_CHANGE_BATCH_IS_READ_ONLY</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-isyncchangebatch-endunorderedgroup
     */
    EndUnorderedGroup(pMadeWithKnowledge, fAllChangesForKnowledge) {
        result := ComCall(18, this, "ptr", pMadeWithKnowledge, "int", fAllChangesForKnowledge, "HRESULT")
        return result
    }

    /**
     * Adds metadata that represents a conflict to the change batch.
     * @param {Pointer<Integer>} pbOwnerReplicaId The ID of the replica that made the change in conflict.
     * @param {Pointer<Integer>} pbItemId The ID of the item.
     * @param {Pointer<SYNC_VERSION>} pChangeVersion The version of the change.
     * @param {Pointer<SYNC_VERSION>} pCreationVersion The creation version of the item.
     * @param {Integer} dwFlags Flags that specify the state of the item change. For the SYNC_CHANGE_FLAG values, see the Remarks section of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winsync/nf-winsync-isyncchange-getflags">ISyncChange::GetFlags</a> method.
     * @param {Integer} dwWorkForChange The work estimate for the change. This value is used during change application to report completed work to the application.
     * @param {ISyncKnowledge} pConflictKnowledge The conflict knowledge that was saved when the conflict was logged.
     * @returns {ISyncChangeBuilder} Returns an object that can be used to add change unit information to the change.
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-isyncchangebatch-addloggedconflict
     */
    AddLoggedConflict(pbOwnerReplicaId, pbItemId, pChangeVersion, pCreationVersion, dwFlags, dwWorkForChange, pConflictKnowledge) {
        pbOwnerReplicaIdMarshal := pbOwnerReplicaId is VarRef ? "char*" : "ptr"
        pbItemIdMarshal := pbItemId is VarRef ? "char*" : "ptr"

        result := ComCall(19, this, pbOwnerReplicaIdMarshal, pbOwnerReplicaId, pbItemIdMarshal, pbItemId, "ptr", pChangeVersion, "ptr", pCreationVersion, "uint", dwFlags, "uint", dwWorkForChange, "ptr", pConflictKnowledge, "ptr*", &ppChangeBuilder := 0, "HRESULT")
        return ISyncChangeBuilder(ppChangeBuilder)
    }
}
