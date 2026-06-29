#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IUIAutomationProxyFactoryEntry.ahk" { IUIAutomationProxyFactoryEntry }
#Import "..\..\System\Com\SAFEARRAY.ahk" { SAFEARRAY }

/**
 * Exposes properties and methods for a table of proxy factories. Each table entry is represented by an IUIAutomationProxyFactoryEntry interface. The entries are in the order in which the system will attempt to use the proxies.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nn-uiautomationclient-iuiautomationproxyfactorymapping
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct IUIAutomationProxyFactoryMapping extends IUnknown {
    /**
     * The interface identifier for IUIAutomationProxyFactoryMapping
     * @type {Guid}
     */
    static IID := Guid("{09e31e18-872d-4873-93d1-1e541ec133fd}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUIAutomationProxyFactoryMapping interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        get_Count           : IntPtr
        GetTable            : IntPtr
        GetEntry            : IntPtr
        SetTable            : IntPtr
        InsertEntries       : IntPtr
        InsertEntry         : IntPtr
        RemoveEntry         : IntPtr
        ClearTable          : IntPtr
        RestoreDefaultTable : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUIAutomationProxyFactoryMapping.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
    }

    /**
     * Retrieves the number of entries in the proxy factory table.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationproxyfactorymapping-get_count
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
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationproxyfactorymapping-gettable
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
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationproxyfactorymapping-getentry
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
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationproxyfactorymapping-settable
     */
    SetTable(factoryList) {
        result := ComCall(6, this, SAFEARRAY.Ptr, factoryList, "HRESULT")
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
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationproxyfactorymapping-insertentries
     */
    InsertEntries(before, factoryList) {
        result := ComCall(7, this, "uint", before, SAFEARRAY.Ptr, factoryList, "HRESULT")
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
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationproxyfactorymapping-insertentry
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
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationproxyfactorymapping-removeentry
     */
    RemoveEntry(index) {
        result := ComCall(9, this, "uint", index, "HRESULT")
        return result
    }

    /**
     * Removes all entries from the proxy factory table.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationproxyfactorymapping-cleartable
     */
    ClearTable() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * Restores the default table of proxy factories.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationproxyfactorymapping-restoredefaulttable
     */
    RestoreDefaultTable() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IUIAutomationProxyFactoryMapping.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Count := CallbackCreate(GetMethod(implObj, "get_Count"), flags, 2)
        this.vtbl.GetTable := CallbackCreate(GetMethod(implObj, "GetTable"), flags, 2)
        this.vtbl.GetEntry := CallbackCreate(GetMethod(implObj, "GetEntry"), flags, 3)
        this.vtbl.SetTable := CallbackCreate(GetMethod(implObj, "SetTable"), flags, 2)
        this.vtbl.InsertEntries := CallbackCreate(GetMethod(implObj, "InsertEntries"), flags, 3)
        this.vtbl.InsertEntry := CallbackCreate(GetMethod(implObj, "InsertEntry"), flags, 3)
        this.vtbl.RemoveEntry := CallbackCreate(GetMethod(implObj, "RemoveEntry"), flags, 2)
        this.vtbl.ClearTable := CallbackCreate(GetMethod(implObj, "ClearTable"), flags, 1)
        this.vtbl.RestoreDefaultTable := CallbackCreate(GetMethod(implObj, "RestoreDefaultTable"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Count)
        CallbackFree(this.vtbl.GetTable)
        CallbackFree(this.vtbl.GetEntry)
        CallbackFree(this.vtbl.SetTable)
        CallbackFree(this.vtbl.InsertEntries)
        CallbackFree(this.vtbl.InsertEntry)
        CallbackFree(this.vtbl.RemoveEntry)
        CallbackFree(this.vtbl.ClearTable)
        CallbackFree(this.vtbl.RestoreDefaultTable)
    }
}
