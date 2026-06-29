#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ISyncFullEnumerationChangeBatch.ahk" { ISyncFullEnumerationChangeBatch }
#Import ".\ISyncChangeBuilder.ahk" { ISyncChangeBuilder }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\SYNC_VERSION.ahk" { SYNC_VERSION }

/**
 * @namespace Windows.Win32.System.WindowsSync
 */
export default struct ISyncFullEnumerationChangeBatch2 extends ISyncFullEnumerationChangeBatch {
    /**
     * The interface identifier for ISyncFullEnumerationChangeBatch2
     * @type {Guid}
     */
    static IID := Guid("{e06449f4-a205-4b65-9724-01b22101eec1}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISyncFullEnumerationChangeBatch2 interfaces
    */
    struct Vtbl extends ISyncFullEnumerationChangeBatch.Vtbl {
        AddMergeTombstoneMetadataToGroup : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISyncFullEnumerationChangeBatch2.Vtbl()
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

    Query(iid) {
        if (ISyncFullEnumerationChangeBatch2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AddMergeTombstoneMetadataToGroup := CallbackCreate(GetMethod(implObj, "AddMergeTombstoneMetadataToGroup"), flags, 8)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AddMergeTombstoneMetadataToGroup)
    }
}
