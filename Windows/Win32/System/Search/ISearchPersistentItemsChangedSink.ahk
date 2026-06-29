#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\SEARCH_ITEM_PERSISTENT_CHANGE.ahk" { SEARCH_ITEM_PERSISTENT_CHANGE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides methods for passing change notifications to alert the indexer that items need to be updated.
 * @see https://learn.microsoft.com/windows/win32/api/searchapi/nn-searchapi-isearchpersistentitemschangedsink
 * @namespace Windows.Win32.System.Search
 */
export default struct ISearchPersistentItemsChangedSink extends IUnknown {
    /**
     * The interface identifier for ISearchPersistentItemsChangedSink
     * @type {Guid}
     */
    static IID := Guid("{a2ffdf9b-4758-4f84-b729-df81a1a0612f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISearchPersistentItemsChangedSink interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        StartedMonitoringScope : IntPtr
        StoppedMonitoringScope : IntPtr
        OnItemsChanged         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISearchPersistentItemsChangedSink.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Called by a notifications provider to notify the indexer to monitor changes to items within a specified hierarchical scope.
     * @remarks
     * When notification loss occurs, a notification agent comes online and calls <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nf-searchapi-isearchitemschangedsink-startedmonitoringscope">StartedMonitoringScope</a>, which permits an index-managed notification source to add itself to a list of "monitored scopes". The indexer starts an incremental crawl of the corresponding document store. The indexer crawls these scopes incrementally until the extreme conditions that caused the loss of notifications are no longer present. This method ensures that any changes in the store that occur during a period of notification loss are detected.
     * 
     * Under normal circumstances, the list of monitored scopes is not used. Notification loss is rare, and usually occurs only when disk space is extremely low.
     * @param {PWSTR} pszURL Type: <b>LPCWSTR</b>
     * 
     * Pointer to a null-terminated Unicode string that is the start address for the scope to be monitored.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchpersistentitemschangedsink-startedmonitoringscope
     */
    StartedMonitoringScope(pszURL) {
        pszURL := pszURL is String ? StrPtr(pszURL) : pszURL

        result := ComCall(3, this, "ptr", pszURL, "HRESULT")
        return result
    }

    /**
     * Called by a notifications provider to notify the indexer to stop monitoring changes to items within a specified hierarchical scope.
     * @remarks
     * When the notifications provider responsible for monitoring changes in the document store goes offline, it calls <b>ISearchPersistentItemsChangedSink::StoppedMonitoringScope</b> to remove the scope from the list of notification sources.
     * @param {PWSTR} pszURL Type: <b>LPCWSTR</b>
     * 
     * Pointer to a null-terminated Unicode string that is the address for the scope to stop monitoring.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchpersistentitemschangedsink-stoppedmonitoringscope
     */
    StoppedMonitoringScope(pszURL) {
        pszURL := pszURL is String ? StrPtr(pszURL) : pszURL

        result := ComCall(4, this, "ptr", pszURL, "HRESULT")
        return result
    }

    /**
     * Notifies the indexer to index changed items.
     * @param {Integer} dwNumberOfChanges Type: <b>DWORD</b>
     * 
     * The number of changes being reported.
     * @param {Pointer<SEARCH_ITEM_PERSISTENT_CHANGE>} DataChangeEntries Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/searchapi/ns-searchapi-search_item_persistent_change">SEARCH_ITEM_PERSISTENT_CHANGE</a>[]</b>
     * 
     * An array of structures of type <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/ns-searchapi-search_item_persistent_change">SEARCH_ITEM_PERSISTENT_CHANGE</a> identifying the details for each change.
     * @returns {HRESULT} Type: <b>HRESULT[]</b>
     * 
     * Indicates whether each URL was accepted for indexing.
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchpersistentitemschangedsink-onitemschanged
     */
    OnItemsChanged(dwNumberOfChanges, DataChangeEntries) {
        result := ComCall(5, this, "uint", dwNumberOfChanges, SEARCH_ITEM_PERSISTENT_CHANGE.Ptr, DataChangeEntries, "int*", &hrCompletionCodes := 0, "HRESULT")
        return hrCompletionCodes
    }

    Query(iid) {
        if (ISearchPersistentItemsChangedSink.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.StartedMonitoringScope := CallbackCreate(GetMethod(implObj, "StartedMonitoringScope"), flags, 2)
        this.vtbl.StoppedMonitoringScope := CallbackCreate(GetMethod(implObj, "StoppedMonitoringScope"), flags, 2)
        this.vtbl.OnItemsChanged := CallbackCreate(GetMethod(implObj, "OnItemsChanged"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.StartedMonitoringScope)
        CallbackFree(this.vtbl.StoppedMonitoringScope)
        CallbackFree(this.vtbl.OnItemsChanged)
    }
}
