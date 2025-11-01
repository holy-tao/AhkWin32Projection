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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDestinationProviderConflictingChange", "GetSourceProviderConflictingChange", "GetDestinationProviderConflictingData", "GetSourceProviderConflictingData", "GetResolveActionForChange", "SetResolveActionForChange", "GetResolveActionForChangeUnit", "SetResolveActionForChangeUnit"]

    /**
     * 
     * @param {Pointer<ISyncChange>} ppConflictingChange 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-ichangeconflict-getdestinationproviderconflictingchange
     */
    GetDestinationProviderConflictingChange(ppConflictingChange) {
        result := ComCall(3, this, "ptr*", ppConflictingChange, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISyncChange>} ppConflictingChange 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-ichangeconflict-getsourceproviderconflictingchange
     */
    GetSourceProviderConflictingChange(ppConflictingChange) {
        result := ComCall(4, this, "ptr*", ppConflictingChange, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} ppConflictingData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-ichangeconflict-getdestinationproviderconflictingdata
     */
    GetDestinationProviderConflictingData(ppConflictingData) {
        result := ComCall(5, this, "ptr*", ppConflictingData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} ppConflictingData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-ichangeconflict-getsourceproviderconflictingdata
     */
    GetSourceProviderConflictingData(ppConflictingData) {
        result := ComCall(6, this, "ptr*", ppConflictingData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pResolveAction 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-ichangeconflict-getresolveactionforchange
     */
    GetResolveActionForChange(pResolveAction) {
        pResolveActionMarshal := pResolveAction is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, pResolveActionMarshal, pResolveAction, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} resolveAction 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-ichangeconflict-setresolveactionforchange
     */
    SetResolveActionForChange(resolveAction) {
        result := ComCall(8, this, "int", resolveAction, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISyncChangeUnit} pChangeUnit 
     * @param {Pointer<Integer>} pResolveAction 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-ichangeconflict-getresolveactionforchangeunit
     */
    GetResolveActionForChangeUnit(pChangeUnit, pResolveAction) {
        pResolveActionMarshal := pResolveAction is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, "ptr", pChangeUnit, pResolveActionMarshal, pResolveAction, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISyncChangeUnit} pChangeUnit 
     * @param {Integer} resolveAction 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-ichangeconflict-setresolveactionforchangeunit
     */
    SetResolveActionForChangeUnit(pChangeUnit, resolveAction) {
        result := ComCall(10, this, "ptr", pChangeUnit, "int", resolveAction, "HRESULT")
        return result
    }
}
