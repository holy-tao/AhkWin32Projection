#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IEnumItemIds.ahk" { IEnumItemIds }
#Import ".\ISyncKnowledge.ahk" { ISyncKnowledge }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\SYNC_FILTER_CHANGE.ahk" { SYNC_FILTER_CHANGE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.WindowsSync
 */
export default struct ISyncChangeWithFilterKeyMap extends IUnknown {
    /**
     * The interface identifier for ISyncChangeWithFilterKeyMap
     * @type {Guid}
     */
    static IID := Guid("{bfe1ef00-e87d-42fd-a4e9-242d70414aef}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISyncChangeWithFilterKeyMap interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetFilterCount                                                   : IntPtr
        GetFilterChange                                                  : IntPtr
        GetAllChangeUnitsPresentFlag                                     : IntPtr
        GetFilterForgottenKnowledge                                      : IntPtr
        GetFilteredReplicaLearnedKnowledge                               : IntPtr
        GetLearnedFilterForgottenKnowledge                               : IntPtr
        GetFilteredReplicaLearnedForgottenKnowledge                      : IntPtr
        GetFilteredReplicaLearnedForgottenKnowledgeAfterRecoveryComplete : IntPtr
        GetLearnedFilterForgottenKnowledgeAfterRecoveryComplete          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISyncChangeWithFilterKeyMap.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwFilterCount 
     * @returns {HRESULT} 
     */
    GetFilterCount(pdwFilterCount) {
        pdwFilterCountMarshal := pdwFilterCount is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pdwFilterCountMarshal, pdwFilterCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFilterKey 
     * @param {Pointer<SYNC_FILTER_CHANGE>} pFilterChange 
     * @returns {HRESULT} 
     */
    GetFilterChange(dwFilterKey, pFilterChange) {
        result := ComCall(4, this, "uint", dwFilterKey, SYNC_FILTER_CHANGE.Ptr, pFilterChange, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfAllChangeUnitsPresent 
     * @returns {HRESULT} 
     */
    GetAllChangeUnitsPresentFlag(pfAllChangeUnitsPresent) {
        pfAllChangeUnitsPresentMarshal := pfAllChangeUnitsPresent is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, pfAllChangeUnitsPresentMarshal, pfAllChangeUnitsPresent, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFilterKey 
     * @returns {ISyncKnowledge} 
     */
    GetFilterForgottenKnowledge(dwFilterKey) {
        result := ComCall(6, this, "uint", dwFilterKey, "ptr*", &ppIFilterForgottenKnowledge := 0, "HRESULT")
        return ISyncKnowledge(ppIFilterForgottenKnowledge)
    }

    /**
     * 
     * @param {ISyncKnowledge} pDestinationKnowledge 
     * @param {IEnumItemIds} pNewMoveins 
     * @returns {ISyncKnowledge} 
     */
    GetFilteredReplicaLearnedKnowledge(pDestinationKnowledge, pNewMoveins) {
        result := ComCall(7, this, "ptr", pDestinationKnowledge, "ptr", pNewMoveins, "ptr*", &ppLearnedKnowledge := 0, "HRESULT")
        return ISyncKnowledge(ppLearnedKnowledge)
    }

    /**
     * 
     * @param {ISyncKnowledge} pDestinationKnowledge 
     * @param {IEnumItemIds} pNewMoveins 
     * @param {Integer} dwFilterKey 
     * @returns {ISyncKnowledge} 
     */
    GetLearnedFilterForgottenKnowledge(pDestinationKnowledge, pNewMoveins, dwFilterKey) {
        result := ComCall(8, this, "ptr", pDestinationKnowledge, "ptr", pNewMoveins, "uint", dwFilterKey, "ptr*", &ppLearnedFilterForgottenKnowledge := 0, "HRESULT")
        return ISyncKnowledge(ppLearnedFilterForgottenKnowledge)
    }

    /**
     * 
     * @param {ISyncKnowledge} pDestinationKnowledge 
     * @param {IEnumItemIds} pNewMoveins 
     * @returns {ISyncKnowledge} 
     */
    GetFilteredReplicaLearnedForgottenKnowledge(pDestinationKnowledge, pNewMoveins) {
        result := ComCall(9, this, "ptr", pDestinationKnowledge, "ptr", pNewMoveins, "ptr*", &ppLearnedForgottenKnowledge := 0, "HRESULT")
        return ISyncKnowledge(ppLearnedForgottenKnowledge)
    }

    /**
     * 
     * @param {ISyncKnowledge} pDestinationKnowledge 
     * @param {IEnumItemIds} pNewMoveins 
     * @returns {ISyncKnowledge} 
     */
    GetFilteredReplicaLearnedForgottenKnowledgeAfterRecoveryComplete(pDestinationKnowledge, pNewMoveins) {
        result := ComCall(10, this, "ptr", pDestinationKnowledge, "ptr", pNewMoveins, "ptr*", &ppLearnedForgottenKnowledge := 0, "HRESULT")
        return ISyncKnowledge(ppLearnedForgottenKnowledge)
    }

    /**
     * 
     * @param {ISyncKnowledge} pDestinationKnowledge 
     * @param {IEnumItemIds} pNewMoveins 
     * @param {Integer} dwFilterKey 
     * @returns {ISyncKnowledge} 
     */
    GetLearnedFilterForgottenKnowledgeAfterRecoveryComplete(pDestinationKnowledge, pNewMoveins, dwFilterKey) {
        result := ComCall(11, this, "ptr", pDestinationKnowledge, "ptr", pNewMoveins, "uint", dwFilterKey, "ptr*", &ppLearnedFilterForgottenKnowledge := 0, "HRESULT")
        return ISyncKnowledge(ppLearnedFilterForgottenKnowledge)
    }

    Query(iid) {
        if (ISyncChangeWithFilterKeyMap.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetFilterCount := CallbackCreate(GetMethod(implObj, "GetFilterCount"), flags, 2)
        this.vtbl.GetFilterChange := CallbackCreate(GetMethod(implObj, "GetFilterChange"), flags, 3)
        this.vtbl.GetAllChangeUnitsPresentFlag := CallbackCreate(GetMethod(implObj, "GetAllChangeUnitsPresentFlag"), flags, 2)
        this.vtbl.GetFilterForgottenKnowledge := CallbackCreate(GetMethod(implObj, "GetFilterForgottenKnowledge"), flags, 3)
        this.vtbl.GetFilteredReplicaLearnedKnowledge := CallbackCreate(GetMethod(implObj, "GetFilteredReplicaLearnedKnowledge"), flags, 4)
        this.vtbl.GetLearnedFilterForgottenKnowledge := CallbackCreate(GetMethod(implObj, "GetLearnedFilterForgottenKnowledge"), flags, 5)
        this.vtbl.GetFilteredReplicaLearnedForgottenKnowledge := CallbackCreate(GetMethod(implObj, "GetFilteredReplicaLearnedForgottenKnowledge"), flags, 4)
        this.vtbl.GetFilteredReplicaLearnedForgottenKnowledgeAfterRecoveryComplete := CallbackCreate(GetMethod(implObj, "GetFilteredReplicaLearnedForgottenKnowledgeAfterRecoveryComplete"), flags, 4)
        this.vtbl.GetLearnedFilterForgottenKnowledgeAfterRecoveryComplete := CallbackCreate(GetMethod(implObj, "GetLearnedFilterForgottenKnowledgeAfterRecoveryComplete"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetFilterCount)
        CallbackFree(this.vtbl.GetFilterChange)
        CallbackFree(this.vtbl.GetAllChangeUnitsPresentFlag)
        CallbackFree(this.vtbl.GetFilterForgottenKnowledge)
        CallbackFree(this.vtbl.GetFilteredReplicaLearnedKnowledge)
        CallbackFree(this.vtbl.GetLearnedFilterForgottenKnowledge)
        CallbackFree(this.vtbl.GetFilteredReplicaLearnedForgottenKnowledge)
        CallbackFree(this.vtbl.GetFilteredReplicaLearnedForgottenKnowledgeAfterRecoveryComplete)
        CallbackFree(this.vtbl.GetLearnedFilterForgottenKnowledgeAfterRecoveryComplete)
    }
}
