#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\CONSTRAINT_CONFLICT_REASON.ahk" { CONSTRAINT_CONFLICT_REASON }
#Import ".\ISyncChangeUnit.ahk" { ISyncChangeUnit }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ISyncChange.ahk" { ISyncChange }
#Import ".\SYNC_CONSTRAINT_RESOLVE_ACTION.ahk" { SYNC_CONSTRAINT_RESOLVE_ACTION }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.WindowsSync
 */
export default struct IConstraintConflict extends IUnknown {
    /**
     * The interface identifier for IConstraintConflict
     * @type {Guid}
     */
    static IID := Guid("{00d2302e-1cf8-4835-b85f-b7ca4f799e0a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IConstraintConflict interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetDestinationProviderConflictingChange : IntPtr
        GetSourceProviderConflictingChange      : IntPtr
        GetDestinationProviderOriginalChange    : IntPtr
        GetDestinationProviderConflictingData   : IntPtr
        GetSourceProviderConflictingData        : IntPtr
        GetDestinationProviderOriginalData      : IntPtr
        GetConstraintResolveActionForChange     : IntPtr
        SetConstraintResolveActionForChange     : IntPtr
        GetConstraintResolveActionForChangeUnit : IntPtr
        SetConstraintResolveActionForChangeUnit : IntPtr
        GetConstraintConflictReason             : IntPtr
        IsTemporary                             : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IConstraintConflict.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {ISyncChange} 
     */
    GetDestinationProviderConflictingChange() {
        result := ComCall(3, this, "ptr*", &ppConflictingChange := 0, "HRESULT")
        return ISyncChange(ppConflictingChange)
    }

    /**
     * 
     * @returns {ISyncChange} 
     */
    GetSourceProviderConflictingChange() {
        result := ComCall(4, this, "ptr*", &ppConflictingChange := 0, "HRESULT")
        return ISyncChange(ppConflictingChange)
    }

    /**
     * 
     * @returns {ISyncChange} 
     */
    GetDestinationProviderOriginalChange() {
        result := ComCall(5, this, "ptr*", &ppOriginalChange := 0, "HRESULT")
        return ISyncChange(ppOriginalChange)
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    GetDestinationProviderConflictingData() {
        result := ComCall(6, this, "ptr*", &ppConflictingData := 0, "HRESULT")
        return IUnknown(ppConflictingData)
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    GetSourceProviderConflictingData() {
        result := ComCall(7, this, "ptr*", &ppConflictingData := 0, "HRESULT")
        return IUnknown(ppConflictingData)
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    GetDestinationProviderOriginalData() {
        result := ComCall(8, this, "ptr*", &ppOriginalData := 0, "HRESULT")
        return IUnknown(ppOriginalData)
    }

    /**
     * 
     * @param {Pointer<SYNC_CONSTRAINT_RESOLVE_ACTION>} pConstraintResolveAction 
     * @returns {HRESULT} 
     */
    GetConstraintResolveActionForChange(pConstraintResolveAction) {
        pConstraintResolveActionMarshal := pConstraintResolveAction is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, pConstraintResolveActionMarshal, pConstraintResolveAction, "HRESULT")
        return result
    }

    /**
     * 
     * @param {SYNC_CONSTRAINT_RESOLVE_ACTION} constraintResolveAction 
     * @returns {HRESULT} 
     */
    SetConstraintResolveActionForChange(constraintResolveAction) {
        result := ComCall(10, this, SYNC_CONSTRAINT_RESOLVE_ACTION, constraintResolveAction, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISyncChangeUnit} pChangeUnit 
     * @param {Pointer<SYNC_CONSTRAINT_RESOLVE_ACTION>} pConstraintResolveAction 
     * @returns {HRESULT} 
     */
    GetConstraintResolveActionForChangeUnit(pChangeUnit, pConstraintResolveAction) {
        pConstraintResolveActionMarshal := pConstraintResolveAction is VarRef ? "int*" : "ptr"

        result := ComCall(11, this, "ptr", pChangeUnit, pConstraintResolveActionMarshal, pConstraintResolveAction, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISyncChangeUnit} pChangeUnit 
     * @param {SYNC_CONSTRAINT_RESOLVE_ACTION} constraintResolveAction 
     * @returns {HRESULT} 
     */
    SetConstraintResolveActionForChangeUnit(pChangeUnit, constraintResolveAction) {
        result := ComCall(12, this, "ptr", pChangeUnit, SYNC_CONSTRAINT_RESOLVE_ACTION, constraintResolveAction, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<CONSTRAINT_CONFLICT_REASON>} pConstraintConflictReason 
     * @returns {HRESULT} 
     */
    GetConstraintConflictReason(pConstraintConflictReason) {
        pConstraintConflictReasonMarshal := pConstraintConflictReason is VarRef ? "int*" : "ptr"

        result := ComCall(13, this, pConstraintConflictReasonMarshal, pConstraintConflictReason, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    IsTemporary() {
        result := ComCall(14, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IConstraintConflict.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetDestinationProviderConflictingChange := CallbackCreate(GetMethod(implObj, "GetDestinationProviderConflictingChange"), flags, 2)
        this.vtbl.GetSourceProviderConflictingChange := CallbackCreate(GetMethod(implObj, "GetSourceProviderConflictingChange"), flags, 2)
        this.vtbl.GetDestinationProviderOriginalChange := CallbackCreate(GetMethod(implObj, "GetDestinationProviderOriginalChange"), flags, 2)
        this.vtbl.GetDestinationProviderConflictingData := CallbackCreate(GetMethod(implObj, "GetDestinationProviderConflictingData"), flags, 2)
        this.vtbl.GetSourceProviderConflictingData := CallbackCreate(GetMethod(implObj, "GetSourceProviderConflictingData"), flags, 2)
        this.vtbl.GetDestinationProviderOriginalData := CallbackCreate(GetMethod(implObj, "GetDestinationProviderOriginalData"), flags, 2)
        this.vtbl.GetConstraintResolveActionForChange := CallbackCreate(GetMethod(implObj, "GetConstraintResolveActionForChange"), flags, 2)
        this.vtbl.SetConstraintResolveActionForChange := CallbackCreate(GetMethod(implObj, "SetConstraintResolveActionForChange"), flags, 2)
        this.vtbl.GetConstraintResolveActionForChangeUnit := CallbackCreate(GetMethod(implObj, "GetConstraintResolveActionForChangeUnit"), flags, 3)
        this.vtbl.SetConstraintResolveActionForChangeUnit := CallbackCreate(GetMethod(implObj, "SetConstraintResolveActionForChangeUnit"), flags, 3)
        this.vtbl.GetConstraintConflictReason := CallbackCreate(GetMethod(implObj, "GetConstraintConflictReason"), flags, 2)
        this.vtbl.IsTemporary := CallbackCreate(GetMethod(implObj, "IsTemporary"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetDestinationProviderConflictingChange)
        CallbackFree(this.vtbl.GetSourceProviderConflictingChange)
        CallbackFree(this.vtbl.GetDestinationProviderOriginalChange)
        CallbackFree(this.vtbl.GetDestinationProviderConflictingData)
        CallbackFree(this.vtbl.GetSourceProviderConflictingData)
        CallbackFree(this.vtbl.GetDestinationProviderOriginalData)
        CallbackFree(this.vtbl.GetConstraintResolveActionForChange)
        CallbackFree(this.vtbl.SetConstraintResolveActionForChange)
        CallbackFree(this.vtbl.GetConstraintResolveActionForChangeUnit)
        CallbackFree(this.vtbl.SetConstraintResolveActionForChangeUnit)
        CallbackFree(this.vtbl.GetConstraintConflictReason)
        CallbackFree(this.vtbl.IsTemporary)
    }
}
