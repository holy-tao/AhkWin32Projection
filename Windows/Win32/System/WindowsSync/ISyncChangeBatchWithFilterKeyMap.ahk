#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IEnumItemIds.ahk" { IEnumItemIds }
#Import ".\ISyncKnowledge.ahk" { ISyncKnowledge }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\IFilterKeyMap.ahk" { IFilterKeyMap }

/**
 * @namespace Windows.Win32.System.WindowsSync
 */
export default struct ISyncChangeBatchWithFilterKeyMap extends IUnknown {
    /**
     * The interface identifier for ISyncChangeBatchWithFilterKeyMap
     * @type {Guid}
     */
    static IID := Guid("{de247002-566d-459a-a6ed-a5aab3459fb7}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISyncChangeBatchWithFilterKeyMap interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetFilterKeyMap                                                  : IntPtr
        SetFilterKeyMap                                                  : IntPtr
        SetFilterForgottenKnowledge                                      : IntPtr
        GetFilteredReplicaLearnedKnowledge                               : IntPtr
        GetLearnedFilterForgottenKnowledge                               : IntPtr
        GetFilteredReplicaLearnedForgottenKnowledge                      : IntPtr
        GetFilteredReplicaLearnedForgottenKnowledgeAfterRecoveryComplete : IntPtr
        GetLearnedFilterForgottenKnowledgeAfterRecoveryComplete          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISyncChangeBatchWithFilterKeyMap.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {IFilterKeyMap} 
     */
    GetFilterKeyMap() {
        result := ComCall(3, this, "ptr*", &ppIFilterKeyMap := 0, "HRESULT")
        return IFilterKeyMap(ppIFilterKeyMap)
    }

    /**
     * 
     * @param {IFilterKeyMap} pIFilterKeyMap 
     * @returns {HRESULT} 
     */
    SetFilterKeyMap(pIFilterKeyMap) {
        result := ComCall(4, this, "ptr", pIFilterKeyMap, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFilterKey 
     * @param {ISyncKnowledge} pFilterForgottenKnowledge 
     * @returns {HRESULT} 
     */
    SetFilterForgottenKnowledge(dwFilterKey, pFilterForgottenKnowledge) {
        result := ComCall(5, this, "uint", dwFilterKey, "ptr", pFilterForgottenKnowledge, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISyncKnowledge} pDestinationKnowledge 
     * @param {IEnumItemIds} pNewMoveins 
     * @returns {ISyncKnowledge} 
     */
    GetFilteredReplicaLearnedKnowledge(pDestinationKnowledge, pNewMoveins) {
        result := ComCall(6, this, "ptr", pDestinationKnowledge, "ptr", pNewMoveins, "ptr*", &ppLearnedForgottenKnowledge := 0, "HRESULT")
        return ISyncKnowledge(ppLearnedForgottenKnowledge)
    }

    /**
     * 
     * @param {ISyncKnowledge} pDestinationKnowledge 
     * @param {IEnumItemIds} pNewMoveins 
     * @param {Integer} dwFilterKey 
     * @returns {ISyncKnowledge} 
     */
    GetLearnedFilterForgottenKnowledge(pDestinationKnowledge, pNewMoveins, dwFilterKey) {
        result := ComCall(7, this, "ptr", pDestinationKnowledge, "ptr", pNewMoveins, "uint", dwFilterKey, "ptr*", &ppLearnedFilterForgottenKnowledge := 0, "HRESULT")
        return ISyncKnowledge(ppLearnedFilterForgottenKnowledge)
    }

    /**
     * 
     * @param {ISyncKnowledge} pDestinationKnowledge 
     * @param {IEnumItemIds} pNewMoveins 
     * @returns {ISyncKnowledge} 
     */
    GetFilteredReplicaLearnedForgottenKnowledge(pDestinationKnowledge, pNewMoveins) {
        result := ComCall(8, this, "ptr", pDestinationKnowledge, "ptr", pNewMoveins, "ptr*", &ppLearnedForgottenKnowledge := 0, "HRESULT")
        return ISyncKnowledge(ppLearnedForgottenKnowledge)
    }

    /**
     * 
     * @param {ISyncKnowledge} pDestinationKnowledge 
     * @param {IEnumItemIds} pNewMoveins 
     * @returns {ISyncKnowledge} 
     */
    GetFilteredReplicaLearnedForgottenKnowledgeAfterRecoveryComplete(pDestinationKnowledge, pNewMoveins) {
        result := ComCall(9, this, "ptr", pDestinationKnowledge, "ptr", pNewMoveins, "ptr*", &ppLearnedForgottenKnowledge := 0, "HRESULT")
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
        result := ComCall(10, this, "ptr", pDestinationKnowledge, "ptr", pNewMoveins, "uint", dwFilterKey, "ptr*", &ppLearnedFilterForgottenKnowledge := 0, "HRESULT")
        return ISyncKnowledge(ppLearnedFilterForgottenKnowledge)
    }

    Query(iid) {
        if (ISyncChangeBatchWithFilterKeyMap.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetFilterKeyMap := CallbackCreate(GetMethod(implObj, "GetFilterKeyMap"), flags, 2)
        this.vtbl.SetFilterKeyMap := CallbackCreate(GetMethod(implObj, "SetFilterKeyMap"), flags, 2)
        this.vtbl.SetFilterForgottenKnowledge := CallbackCreate(GetMethod(implObj, "SetFilterForgottenKnowledge"), flags, 3)
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
        CallbackFree(this.vtbl.GetFilterKeyMap)
        CallbackFree(this.vtbl.SetFilterKeyMap)
        CallbackFree(this.vtbl.SetFilterForgottenKnowledge)
        CallbackFree(this.vtbl.GetFilteredReplicaLearnedKnowledge)
        CallbackFree(this.vtbl.GetLearnedFilterForgottenKnowledge)
        CallbackFree(this.vtbl.GetFilteredReplicaLearnedForgottenKnowledge)
        CallbackFree(this.vtbl.GetFilteredReplicaLearnedForgottenKnowledgeAfterRecoveryComplete)
        CallbackFree(this.vtbl.GetLearnedFilterForgottenKnowledgeAfterRecoveryComplete)
    }
}
