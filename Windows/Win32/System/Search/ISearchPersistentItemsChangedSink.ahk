#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Provides methods for passing change notifications to alert the indexer that items need to be updated.
 * @see https://docs.microsoft.com/windows/win32/api//searchapi/nn-searchapi-isearchpersistentitemschangedsink
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class ISearchPersistentItemsChangedSink extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISearchPersistentItemsChangedSink
     * @type {Guid}
     */
    static IID => Guid("{a2ffdf9b-4758-4f84-b729-df81a1a0612f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["StartedMonitoringScope", "StoppedMonitoringScope", "OnItemsChanged"]

    /**
     * Called by a notifications provider to notify the indexer to monitor changes to items within a specified hierarchical scope.
     * @param {PWSTR} pszURL Type: <b>LPCWSTR</b>
     * 
     * Pointer to a null-terminated Unicode string that is the start address for the scope to be monitored.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchpersistentitemschangedsink-startedmonitoringscope
     */
    StartedMonitoringScope(pszURL) {
        pszURL := pszURL is String ? StrPtr(pszURL) : pszURL

        result := ComCall(3, this, "ptr", pszURL, "HRESULT")
        return result
    }

    /**
     * Called by a notifications provider to notify the indexer to stop monitoring changes to items within a specified hierarchical scope.
     * @param {PWSTR} pszURL Type: <b>LPCWSTR</b>
     * 
     * Pointer to a null-terminated Unicode string that is the address for the scope to stop monitoring.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchpersistentitemschangedsink-stoppedmonitoringscope
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
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchpersistentitemschangedsink-onitemschanged
     */
    OnItemsChanged(dwNumberOfChanges, DataChangeEntries) {
        result := ComCall(5, this, "uint", dwNumberOfChanges, "ptr", DataChangeEntries, "int*", &hrCompletionCodes := 0, "HRESULT")
        return hrCompletionCodes
    }
}
