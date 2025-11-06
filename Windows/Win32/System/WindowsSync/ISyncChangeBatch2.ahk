#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISyncChangeBuilder.ahk
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
     * @returns {ISyncChangeBuilder} 
     */
    AddMergeTombstoneMetadataToGroup(pbOwnerReplicaId, pbWinnerItemId, pbItemId, pChangeVersion, pCreationVersion, dwWorkForChange) {
        pbOwnerReplicaIdMarshal := pbOwnerReplicaId is VarRef ? "char*" : "ptr"
        pbWinnerItemIdMarshal := pbWinnerItemId is VarRef ? "char*" : "ptr"
        pbItemIdMarshal := pbItemId is VarRef ? "char*" : "ptr"

        result := ComCall(20, this, pbOwnerReplicaIdMarshal, pbOwnerReplicaId, pbWinnerItemIdMarshal, pbWinnerItemId, pbItemIdMarshal, pbItemId, "ptr", pChangeVersion, "ptr", pCreationVersion, "uint", dwWorkForChange, "ptr*", &ppChangeBuilder := 0, "HRESULT")
        return ISyncChangeBuilder(ppChangeBuilder)
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
     * @returns {ISyncChangeBuilder} 
     */
    AddMergeTombstoneLoggedConflict(pbOwnerReplicaId, pbWinnerItemId, pbItemId, pChangeVersion, pCreationVersion, dwWorkForChange, pConflictKnowledge) {
        pbOwnerReplicaIdMarshal := pbOwnerReplicaId is VarRef ? "char*" : "ptr"
        pbWinnerItemIdMarshal := pbWinnerItemId is VarRef ? "char*" : "ptr"
        pbItemIdMarshal := pbItemId is VarRef ? "char*" : "ptr"

        result := ComCall(21, this, pbOwnerReplicaIdMarshal, pbOwnerReplicaId, pbWinnerItemIdMarshal, pbWinnerItemId, pbItemIdMarshal, pbItemId, "ptr", pChangeVersion, "ptr", pCreationVersion, "uint", dwWorkForChange, "ptr", pConflictKnowledge, "ptr*", &ppChangeBuilder := 0, "HRESULT")
        return ISyncChangeBuilder(ppChangeBuilder)
    }
}
