#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Enumerates a list of change units.
 * @see https://docs.microsoft.com/windows/win32/api//winsync/nn-winsync-ienumsyncchangeunits
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class IEnumSyncChangeUnits extends IUnknown{
    /**
     * The interface identifier for IEnumSyncChangeUnits
     * @type {Guid}
     */
    static IID => Guid("{346b35f1-8703-4c6d-ab1a-4dbca2cff97f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} cChanges 
     * @param {Pointer<ISyncChangeUnit>} ppChangeUnit 
     * @param {Pointer<UInt32>} pcFetched 
     * @returns {HRESULT} 
     */
    Next(cChanges, ppChangeUnit, pcFetched) {
        result := ComCall(3, this, "uint", cChanges, "ptr", ppChangeUnit, "uint*", pcFetched, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cChanges 
     * @returns {HRESULT} 
     */
    Skip(cChanges) {
        result := ComCall(4, this, "uint", cChanges, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Reset() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumSyncChangeUnits>} ppEnum 
     * @returns {HRESULT} 
     */
    Clone(ppEnum) {
        result := ComCall(6, this, "ptr", ppEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
