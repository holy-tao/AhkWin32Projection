#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUIAutomationProxyFactoryEntry.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes properties and methods for a table of proxy factories. Each table entry is represented by an IUIAutomationProxyFactoryEntry interface. The entries are in the order in which the system will attempt to use the proxies.
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nn-uiautomationclient-iuiautomationproxyfactorymapping
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IUIAutomationProxyFactoryMapping extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Count", "GetTable", "GetEntry", "SetTable", "InsertEntries", "InsertEntry", "RemoveEntry", "ClearTable", "RestoreDefaultTable"]

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationproxyfactorymapping-get_count
     */
    get_Count() {
        result := ComCall(3, this, "uint*", &count := 0, "HRESULT")
        return count
    }

    /**
     * 
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationproxyfactorymapping-gettable
     */
    GetTable() {
        result := ComCall(4, this, "ptr*", &table := 0, "HRESULT")
        return table
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {IUIAutomationProxyFactoryEntry} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationproxyfactorymapping-getentry
     */
    GetEntry(index) {
        result := ComCall(5, this, "uint", index, "ptr*", &entry := 0, "HRESULT")
        return IUIAutomationProxyFactoryEntry(entry)
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} factoryList 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationproxyfactorymapping-settable
     */
    SetTable(factoryList) {
        result := ComCall(6, this, "ptr", factoryList, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} before 
     * @param {Pointer<SAFEARRAY>} factoryList 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationproxyfactorymapping-insertentries
     */
    InsertEntries(before, factoryList) {
        result := ComCall(7, this, "uint", before, "ptr", factoryList, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} before 
     * @param {IUIAutomationProxyFactoryEntry} factory 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationproxyfactorymapping-insertentry
     */
    InsertEntry(before, factory) {
        result := ComCall(8, this, "uint", before, "ptr", factory, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationproxyfactorymapping-removeentry
     */
    RemoveEntry(index) {
        result := ComCall(9, this, "uint", index, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationproxyfactorymapping-cleartable
     */
    ClearTable() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationproxyfactorymapping-restoredefaulttable
     */
    RestoreDefaultTable() {
        result := ComCall(11, this, "HRESULT")
        return result
    }
}
