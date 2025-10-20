#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISyncChangeBatch.ahk

/**
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class ISyncChangeBatch2 extends ISyncChangeBatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISyncChangeBatch2
     * @type {Guid}
     */
    static IID => Guid("{225f4a33-f5ee-4cc7-b039-67a262b4b2ac}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 20

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddMergeTombstoneMetadataToGroup", "AddMergeTombstoneLoggedConflict"]

    /**
     * 
     * @param {Pointer<Integer>} pbOwnerReplicaId 
     * @param {Pointer<Integer>} pbWinnerItemId 
     * @param {Pointer<Integer>} pbItemId 
     * @param {Pointer<SYNC_VERSION>} pChangeVersion 
     * @param {Pointer<SYNC_VERSION>} pCreationVersion 
     * @param {Integer} dwWorkForChange 
     * @param {Pointer<ISyncChangeBuilder>} ppChangeBuilder 
     * @returns {HRESULT} 
     */
    AddMergeTombstoneMetadataToGroup(pbOwnerReplicaId, pbWinnerItemId, pbItemId, pChangeVersion, pCreationVersion, dwWorkForChange, ppChangeBuilder) {
        result := ComCall(20, this, "char*", pbOwnerReplicaId, "char*", pbWinnerItemId, "char*", pbItemId, "ptr", pChangeVersion, "ptr", pCreationVersion, "uint", dwWorkForChange, "ptr*", ppChangeBuilder, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbOwnerReplicaId 
     * @param {Pointer<Integer>} pbWinnerItemId 
     * @param {Pointer<Integer>} pbItemId 
     * @param {Pointer<SYNC_VERSION>} pChangeVersion 
     * @param {Pointer<SYNC_VERSION>} pCreationVersion 
     * @param {Integer} dwWorkForChange 
     * @param {ISyncKnowledge} pConflictKnowledge 
     * @param {Pointer<ISyncChangeBuilder>} ppChangeBuilder 
     * @returns {HRESULT} 
     */
    AddMergeTombstoneLoggedConflict(pbOwnerReplicaId, pbWinnerItemId, pbItemId, pChangeVersion, pCreationVersion, dwWorkForChange, pConflictKnowledge, ppChangeBuilder) {
        result := ComCall(21, this, "char*", pbOwnerReplicaId, "char*", pbWinnerItemId, "char*", pbItemId, "ptr", pChangeVersion, "ptr", pCreationVersion, "uint", dwWorkForChange, "ptr", pConflictKnowledge, "ptr*", ppChangeBuilder, "HRESULT")
        return result
    }
}
