#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class IConstraintConflict extends IUnknown{
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
     * 
     * @param {Pointer<ISyncChange>} ppConflictingChange 
     * @returns {HRESULT} 
     */
    GetDestinationProviderConflictingChange(ppConflictingChange) {
        result := ComCall(3, this, "ptr", ppConflictingChange, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISyncChange>} ppConflictingChange 
     * @returns {HRESULT} 
     */
    GetSourceProviderConflictingChange(ppConflictingChange) {
        result := ComCall(4, this, "ptr", ppConflictingChange, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISyncChange>} ppOriginalChange 
     * @returns {HRESULT} 
     */
    GetDestinationProviderOriginalChange(ppOriginalChange) {
        result := ComCall(5, this, "ptr", ppOriginalChange, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} ppConflictingData 
     * @returns {HRESULT} 
     */
    GetDestinationProviderConflictingData(ppConflictingData) {
        result := ComCall(6, this, "ptr", ppConflictingData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} ppConflictingData 
     * @returns {HRESULT} 
     */
    GetSourceProviderConflictingData(ppConflictingData) {
        result := ComCall(7, this, "ptr", ppConflictingData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} ppOriginalData 
     * @returns {HRESULT} 
     */
    GetDestinationProviderOriginalData(ppOriginalData) {
        result := ComCall(8, this, "ptr", ppOriginalData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pConstraintResolveAction 
     * @returns {HRESULT} 
     */
    GetConstraintResolveActionForChange(pConstraintResolveAction) {
        result := ComCall(9, this, "int*", pConstraintResolveAction, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} constraintResolveAction 
     * @returns {HRESULT} 
     */
    SetConstraintResolveActionForChange(constraintResolveAction) {
        result := ComCall(10, this, "int", constraintResolveAction, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISyncChangeUnit>} pChangeUnit 
     * @param {Pointer<Int32>} pConstraintResolveAction 
     * @returns {HRESULT} 
     */
    GetConstraintResolveActionForChangeUnit(pChangeUnit, pConstraintResolveAction) {
        result := ComCall(11, this, "ptr", pChangeUnit, "int*", pConstraintResolveAction, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISyncChangeUnit>} pChangeUnit 
     * @param {Integer} constraintResolveAction 
     * @returns {HRESULT} 
     */
    SetConstraintResolveActionForChangeUnit(pChangeUnit, constraintResolveAction) {
        result := ComCall(12, this, "ptr", pChangeUnit, "int", constraintResolveAction, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pConstraintConflictReason 
     * @returns {HRESULT} 
     */
    GetConstraintConflictReason(pConstraintConflictReason) {
        result := ComCall(13, this, "int*", pConstraintConflictReason, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    IsTemporary() {
        result := ComCall(14, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
