#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISyncFullEnumerationChangeBatch.ahk

/**
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class ISyncFullEnumerationChangeBatch2 extends ISyncFullEnumerationChangeBatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISyncFullEnumerationChangeBatch2
     * @type {Guid}
     */
    static IID => Guid("{e06449f4-a205-4b65-9724-01b22101eec1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 20

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddMergeTombstoneMetadataToGroup"]

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
        pbOwnerReplicaIdMarshal := pbOwnerReplicaId is VarRef ? "char*" : "ptr"
        pbWinnerItemIdMarshal := pbWinnerItemId is VarRef ? "char*" : "ptr"
        pbItemIdMarshal := pbItemId is VarRef ? "char*" : "ptr"

        result := ComCall(20, this, pbOwnerReplicaIdMarshal, pbOwnerReplicaId, pbWinnerItemIdMarshal, pbWinnerItemId, pbItemIdMarshal, pbItemId, "ptr", pChangeVersion, "ptr", pCreationVersion, "uint", dwWorkForChange, "ptr*", ppChangeBuilder, "HRESULT")
        return result
    }
}
