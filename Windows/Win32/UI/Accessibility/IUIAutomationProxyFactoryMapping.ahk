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
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
    }

    /**
     * Retrieves the number of entries in the proxy factory table.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationproxyfactorymapping-get_count
     */
    get_Count() {
        result := ComCall(3, this, "uint*", &count := 0, "HRESULT")
        return count
    }

    /**
     * Retrieves all entries in the proxy factory table.
     * @returns {Pointer<SAFEARRAY>} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a>**</b>
     * 
     * Receives a pointer to an array of table entries.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationproxyfactorymapping-gettable
     */
    GetTable() {
        result := ComCall(4, this, "ptr*", &table := 0, "HRESULT")
        return table
    }

    /**
     * Retrieves an entry from the proxy factory table.
     * @param {Integer} index Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The zero-based index of the item to retrieve.
     * @returns {IUIAutomationProxyFactoryEntry} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationproxyfactoryentry">IUIAutomationProxyFactoryEntry</a>**</b>
     * 
     * Receives a pointer to the entry.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationproxyfactorymapping-getentry
     */
    GetEntry(index) {
        result := ComCall(5, this, "uint", index, "ptr*", &entry := 0, "HRESULT")
        return IUIAutomationProxyFactoryEntry(entry)
    }

    /**
     * Sets the table of proxy factories.
     * @param {Pointer<SAFEARRAY>} factoryList Type: <b><a href="https://docs.microsoft.com/windows/win32/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a>*</b>
     * 
     * A pointer to the proxy factories to include in the table.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationproxyfactorymapping-settable
     */
    SetTable(factoryList) {
        result := ComCall(6, this, "ptr", factoryList, "HRESULT")
        return result
    }

    /**
     * Inserts entries into the table of proxy factories.
     * @param {Integer} before Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The zero-based index at which to insert the entries.
     * @param {Pointer<SAFEARRAY>} factoryList Type: <b><a href="https://docs.microsoft.com/windows/win32/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a>*</b>
     * 
     * A pointer to the entries to insert into the table.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationproxyfactorymapping-insertentries
     */
    InsertEntries(before, factoryList) {
        result := ComCall(7, this, "uint", before, "ptr", factoryList, "HRESULT")
        return result
    }

    /**
     * Insert an entry into the table of proxy factories.
     * @param {Integer} before Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The zero-based index at which to insert the entry.
     * @param {IUIAutomationProxyFactoryEntry} factory Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationproxyfactoryentry">IUIAutomationProxyFactoryEntry</a>*</b>
     * 
     * The address of the entry to insert.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationproxyfactorymapping-insertentry
     */
    InsertEntry(before, factory) {
        result := ComCall(8, this, "uint", before, "ptr", factory, "HRESULT")
        return result
    }

    /**
     * Removes an entry from the table of proxy factories.
     * @param {Integer} index Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The zero-based index of the entry to remove.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationproxyfactorymapping-removeentry
     */
    RemoveEntry(index) {
        result := ComCall(9, this, "uint", index, "HRESULT")
        return result
    }

    /**
     * Removes all entries from the proxy factory table.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationproxyfactorymapping-cleartable
     */
    ClearTable() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * Restores the default table of proxy factories.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationproxyfactorymapping-restoredefaulttable
     */
    RestoreDefaultTable() {
        result := ComCall(11, this, "HRESULT")
        return result
    }
}
