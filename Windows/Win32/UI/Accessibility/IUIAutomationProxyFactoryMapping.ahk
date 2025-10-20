#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes properties and methods for a table of proxy factories. Each table entry is represented by an IUIAutomationProxyFactoryEntry interface. The entries are in the order in which the system will attempt to use the proxies.
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nn-uiautomationclient-iuiautomationproxyfactorymapping
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IUIAutomationProxyFactoryMapping extends IUnknown{
    /**
     * The interface identifier for IUIAutomationProxyFactoryMapping
     * @type {Guid}
     */
    static IID => Guid("{09e31e18-872d-4873-93d1-1e541ec133fd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<UInt32>} count 
     * @returns {HRESULT} 
     */
    get_Count(count) {
        result := ComCall(3, this, "uint*", count, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} table 
     * @returns {HRESULT} 
     */
    GetTable(table) {
        result := ComCall(4, this, "ptr", table, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<IUIAutomationProxyFactoryEntry>} entry 
     * @returns {HRESULT} 
     */
    GetEntry(index, entry) {
        result := ComCall(5, this, "uint", index, "ptr", entry, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} factoryList 
     * @returns {HRESULT} 
     */
    SetTable(factoryList) {
        result := ComCall(6, this, "ptr", factoryList, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} before 
     * @param {Pointer<SAFEARRAY>} factoryList 
     * @returns {HRESULT} 
     */
    InsertEntries(before, factoryList) {
        result := ComCall(7, this, "uint", before, "ptr", factoryList, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} before 
     * @param {Pointer<IUIAutomationProxyFactoryEntry>} factory 
     * @returns {HRESULT} 
     */
    InsertEntry(before, factory) {
        result := ComCall(8, this, "uint", before, "ptr", factory, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {HRESULT} 
     */
    RemoveEntry(index) {
        result := ComCall(9, this, "uint", index, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ClearTable() {
        result := ComCall(10, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RestoreDefaultTable() {
        result := ComCall(11, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
