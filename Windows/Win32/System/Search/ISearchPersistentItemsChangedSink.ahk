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
     * 
     * @param {PWSTR} pszURL 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchpersistentitemschangedsink-startedmonitoringscope
     */
    StartedMonitoringScope(pszURL) {
        pszURL := pszURL is String ? StrPtr(pszURL) : pszURL

        result := ComCall(3, this, "ptr", pszURL, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszURL 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchpersistentitemschangedsink-stoppedmonitoringscope
     */
    StoppedMonitoringScope(pszURL) {
        pszURL := pszURL is String ? StrPtr(pszURL) : pszURL

        result := ComCall(4, this, "ptr", pszURL, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwNumberOfChanges 
     * @param {Pointer<SEARCH_ITEM_PERSISTENT_CHANGE>} DataChangeEntries 
     * @param {Pointer<HRESULT>} hrCompletionCodes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchpersistentitemschangedsink-onitemschanged
     */
    OnItemsChanged(dwNumberOfChanges, DataChangeEntries, hrCompletionCodes) {
        result := ComCall(5, this, "uint", dwNumberOfChanges, "ptr", DataChangeEntries, "ptr", hrCompletionCodes, "HRESULT")
        return result
    }
}
