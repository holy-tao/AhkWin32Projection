#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncchangebatch-beginunorderedgroup
     */
    BeginUnorderedGroup() {
        result := ComCall(17, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISyncKnowledge} pMadeWithKnowledge 
     * @param {BOOL} fAllChangesForKnowledge 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncchangebatch-endunorderedgroup
     */
    EndUnorderedGroup(pMadeWithKnowledge, fAllChangesForKnowledge) {
        result := ComCall(18, this, "ptr", pMadeWithKnowledge, "int", fAllChangesForKnowledge, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbOwnerReplicaId 
     * @param {Pointer<Integer>} pbItemId 
     * @param {Pointer<SYNC_VERSION>} pChangeVersion 
     * @param {Pointer<SYNC_VERSION>} pCreationVersion 
     * @param {Integer} dwFlags 
     * @param {Integer} dwWorkForChange 
     * @param {ISyncKnowledge} pConflictKnowledge 
     * @param {Pointer<ISyncChangeBuilder>} ppChangeBuilder 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncchangebatch-addloggedconflict
     */
    AddLoggedConflict(pbOwnerReplicaId, pbItemId, pChangeVersion, pCreationVersion, dwFlags, dwWorkForChange, pConflictKnowledge, ppChangeBuilder) {
        result := ComCall(19, this, "char*", pbOwnerReplicaId, "char*", pbItemId, "ptr", pChangeVersion, "ptr", pCreationVersion, "uint", dwFlags, "uint", dwWorkForChange, "ptr", pConflictKnowledge, "ptr*", ppChangeBuilder, "HRESULT")
        return result
    }
}
