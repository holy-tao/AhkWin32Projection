#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Represents a conflict between two items.
 * @see https://docs.microsoft.com/windows/win32/api//winsync/nn-winsync-ichangeconflict
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class IChangeConflict extends IUnknown{
    /**
     * The interface identifier for IChangeConflict
     * @type {Guid}
     */
    static IID => Guid("{014ebf97-9f20-4f7a-bdd4-25979c77c002}")

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
     * @param {Pointer<IUnknown>} ppConflictingData 
     * @returns {HRESULT} 
     */
    GetDestinationProviderConflictingData(ppConflictingData) {
        result := ComCall(5, this, "ptr", ppConflictingData, "int")
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
        result := ComCall(6, this, "ptr", ppConflictingData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pResolveAction 
     * @returns {HRESULT} 
     */
    GetResolveActionForChange(pResolveAction) {
        result := ComCall(7, this, "int*", pResolveAction, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} resolveAction 
     * @returns {HRESULT} 
     */
    SetResolveActionForChange(resolveAction) {
        result := ComCall(8, this, "int", resolveAction, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISyncChangeUnit>} pChangeUnit 
     * @param {Pointer<Int32>} pResolveAction 
     * @returns {HRESULT} 
     */
    GetResolveActionForChangeUnit(pChangeUnit, pResolveAction) {
        result := ComCall(9, this, "ptr", pChangeUnit, "int*", pResolveAction, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISyncChangeUnit>} pChangeUnit 
     * @param {Integer} resolveAction 
     * @returns {HRESULT} 
     */
    SetResolveActionForChangeUnit(pChangeUnit, resolveAction) {
        result := ComCall(10, this, "ptr", pChangeUnit, "int", resolveAction, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
