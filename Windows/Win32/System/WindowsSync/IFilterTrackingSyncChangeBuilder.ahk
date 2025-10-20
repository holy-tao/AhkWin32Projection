#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class IFilterTrackingSyncChangeBuilder extends IUnknown{
    /**
     * The interface identifier for IFilterTrackingSyncChangeBuilder
     * @type {Guid}
     */
    static IID => Guid("{295024a0-70da-4c58-883c-ce2afb308d0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} dwFilterKey 
     * @param {Pointer<SYNC_FILTER_CHANGE>} pFilterChange 
     * @returns {HRESULT} 
     */
    AddFilterChange(dwFilterKey, pFilterChange) {
        result := ComCall(3, this, "uint", dwFilterKey, "ptr", pFilterChange, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    SetAllChangeUnitsPresentFlag() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
