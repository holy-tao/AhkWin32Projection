#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class IConstraintConflict extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IConstraintConflict
     * @type {Guid}
     */
    static IID => Guid("{00d2302e-1cf8-4835-b85f-b7ca4f799e0a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDestinationProviderConflictingChange", "GetSourceProviderConflictingChange", "GetDestinationProviderOriginalChange", "GetDestinationProviderConflictingData", "GetSourceProviderConflictingData", "GetDestinationProviderOriginalData", "GetConstraintResolveActionForChange", "SetConstraintResolveActionForChange", "GetConstraintResolveActionForChangeUnit", "SetConstraintResolveActionForChangeUnit", "GetConstraintConflictReason", "IsTemporary"]

    /**
     * 
     * @param {Pointer<ISyncChange>} ppConflictingChange 
     * @returns {HRESULT} 
     */
    GetDestinationProviderConflictingChange(ppConflictingChange) {
        result := ComCall(3, this, "ptr*", ppConflictingChange, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISyncChange>} ppConflictingChange 
     * @returns {HRESULT} 
     */
    GetSourceProviderConflictingChange(ppConflictingChange) {
        result := ComCall(4, this, "ptr*", ppConflictingChange, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISyncChange>} ppOriginalChange 
     * @returns {HRESULT} 
     */
    GetDestinationProviderOriginalChange(ppOriginalChange) {
        result := ComCall(5, this, "ptr*", ppOriginalChange, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} ppConflictingData 
     * @returns {HRESULT} 
     */
    GetDestinationProviderConflictingData(ppConflictingData) {
        result := ComCall(6, this, "ptr*", ppConflictingData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} ppConflictingData 
     * @returns {HRESULT} 
     */
    GetSourceProviderConflictingData(ppConflictingData) {
        result := ComCall(7, this, "ptr*", ppConflictingData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} ppOriginalData 
     * @returns {HRESULT} 
     */
    GetDestinationProviderOriginalData(ppOriginalData) {
        result := ComCall(8, this, "ptr*", ppOriginalData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pConstraintResolveAction 
     * @returns {HRESULT} 
     */
    GetConstraintResolveActionForChange(pConstraintResolveAction) {
        pConstraintResolveActionMarshal := pConstraintResolveAction is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, pConstraintResolveActionMarshal, pConstraintResolveAction, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} constraintResolveAction 
     * @returns {HRESULT} 
     */
    SetConstraintResolveActionForChange(constraintResolveAction) {
        result := ComCall(10, this, "int", constraintResolveAction, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISyncChangeUnit} pChangeUnit 
     * @param {Pointer<Integer>} pConstraintResolveAction 
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
     * @param {Integer} constraintResolveAction 
     * @returns {HRESULT} 
     */
    SetConstraintResolveActionForChangeUnit(pChangeUnit, constraintResolveAction) {
        result := ComCall(12, this, "ptr", pChangeUnit, "int", constraintResolveAction, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pConstraintConflictReason 
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
}
