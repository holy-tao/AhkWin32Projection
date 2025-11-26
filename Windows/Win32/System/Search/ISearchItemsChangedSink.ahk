#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Provides notifications for changes to indexed items. Also provides notification of the hierarchical scope that is being monitored for changed items.
 * @see https://docs.microsoft.com/windows/win32/api//searchapi/nn-searchapi-isearchitemschangedsink
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class ISearchItemsChangedSink extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISearchItemsChangedSink
     * @type {Guid}
     */
    static IID => Guid("{ab310581-ac80-11d1-8df3-00c04fb6ef58}")

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
     * Permits an index-managed notification source to add itself to a list of &quot;monitored scopes&quot;.
     * @param {PWSTR} pszURL Type: <b>LPCWSTR</b>
     * 
     * A pointer to a null-terminated, Unicode string that is the start address for the scope of monitoring.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchitemschangedsink-startedmonitoringscope
     */
    StartedMonitoringScope(pszURL) {
        pszURL := pszURL is String ? StrPtr(pszURL) : pszURL

        result := ComCall(3, this, "ptr", pszURL, "HRESULT")
        return result
    }

    /**
     * Not implemented.
     * @param {PWSTR} pszURL Type: <b>LPCWSTR</b>
     * 
     * The pointer to a null-terminated, Unicode string containing the start address for the scope of monitoring.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchitemschangedsink-stoppedmonitoringscope
     */
    StoppedMonitoringScope(pszURL) {
        pszURL := pszURL is String ? StrPtr(pszURL) : pszURL

        result := ComCall(4, this, "ptr", pszURL, "HRESULT")
        return result
    }

    /**
     * Call this method to notify an indexer to re-index some changed items.
     * @param {Integer} dwNumberOfChanges Type: <b>DWORD</b>
     * 
     * The number of items that have changed.
     * @param {Pointer<SEARCH_ITEM_CHANGE>} rgDataChangeEntries Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/searchapi/ns-searchapi-search_item_change">SEARCH_ITEM_CHANGE</a>[]</b>
     * 
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/ns-searchapi-search_item_change">SEARCH_ITEM_CHANGE</a> structures, describing the type of changes to and the paths or URLs of each item.
     * @param {Pointer<Integer>} rgdwDocIds Type: <b>DWORD[]</b>
     * 
     * Receives a pointer to an array of document identifiers for the items that changed.
     * @param {Pointer<HRESULT>} rghrCompletionCodes Type: <b>HRESULT[]</b>
     * 
     * Receives a pointer to an array of completion codes for <i>rgdwDocIds</i> indicating whether each item was accepted for indexing.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchitemschangedsink-onitemschanged
     */
    OnItemsChanged(dwNumberOfChanges, rgDataChangeEntries, rgdwDocIds, rghrCompletionCodes) {
        rgdwDocIdsMarshal := rgdwDocIds is VarRef ? "uint*" : "ptr"
        rghrCompletionCodesMarshal := rghrCompletionCodes is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, "uint", dwNumberOfChanges, "ptr", rgDataChangeEntries, rgdwDocIdsMarshal, rgdwDocIds, rghrCompletionCodesMarshal, rghrCompletionCodes, "HRESULT")
        return result
    }
}
