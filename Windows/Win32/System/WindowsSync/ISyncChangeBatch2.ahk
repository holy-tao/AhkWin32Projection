#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ISyncKnowledge.ahk" { ISyncKnowledge }
#Import ".\ISyncChangeBatch.ahk" { ISyncChangeBatch }
#Import ".\ISyncChangeBuilder.ahk" { ISyncChangeBuilder }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\SYNC_VERSION.ahk" { SYNC_VERSION }

/**
 * @namespace Windows.Win32.System.WindowsSync
 */
export default struct ISyncChangeBatch2 extends ISyncChangeBatch {
    /**
     * The interface identifier for ISyncChangeBatch2
     * @type {Guid}
     */
    static IID := Guid("{225f4a33-f5ee-4cc7-b039-67a262b4b2ac}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISyncChangeBatch2 interfaces
    */
    struct Vtbl extends ISyncChangeBatch.Vtbl {
        AddMergeTombstoneMetadataToGroup : IntPtr
        AddMergeTombstoneLoggedConflict  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISyncChangeBatch2.Vtbl()
        }
        super.__New(implObj, flags)
    }

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

        result := ComCall(20, this, pbOwnerReplicaIdMarshal, pbOwnerReplicaId, pbWinnerItemIdMarshal, pbWinnerItemId, pbItemIdMarshal, pbItemId, SYNC_VERSION.Ptr, pChangeVersion, SYNC_VERSION.Ptr, pCreationVersion, "uint", dwWorkForChange, "ptr*", &ppChangeBuilder := 0, "HRESULT")
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

        result := ComCall(21, this, pbOwnerReplicaIdMarshal, pbOwnerReplicaId, pbWinnerItemIdMarshal, pbWinnerItemId, pbItemIdMarshal, pbItemId, SYNC_VERSION.Ptr, pChangeVersion, SYNC_VERSION.Ptr, pCreationVersion, "uint", dwWorkForChange, "ptr", pConflictKnowledge, "ptr*", &ppChangeBuilder := 0, "HRESULT")
        return ISyncChangeBuilder(ppChangeBuilder)
    }

    Query(iid) {
        if (ISyncChangeBatch2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AddMergeTombstoneMetadataToGroup := CallbackCreate(GetMethod(implObj, "AddMergeTombstoneMetadataToGroup"), flags, 8)
        this.vtbl.AddMergeTombstoneLoggedConflict := CallbackCreate(GetMethod(implObj, "AddMergeTombstoneLoggedConflict"), flags, 9)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AddMergeTombstoneMetadataToGroup)
        CallbackFree(this.vtbl.AddMergeTombstoneLoggedConflict)
    }
}
