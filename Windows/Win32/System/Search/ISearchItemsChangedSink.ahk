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
     * 
     * @param {PWSTR} pszURL 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchitemschangedsink-startedmonitoringscope
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
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchitemschangedsink-stoppedmonitoringscope
     */
    StoppedMonitoringScope(pszURL) {
        pszURL := pszURL is String ? StrPtr(pszURL) : pszURL

        result := ComCall(4, this, "ptr", pszURL, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwNumberOfChanges 
     * @param {Pointer<SEARCH_ITEM_CHANGE>} rgDataChangeEntries 
     * @param {Pointer<Integer>} rgdwDocIds 
     * @param {Pointer<HRESULT>} rghrCompletionCodes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchitemschangedsink-onitemschanged
     */
    OnItemsChanged(dwNumberOfChanges, rgDataChangeEntries, rgdwDocIds, rghrCompletionCodes) {
        result := ComCall(5, this, "uint", dwNumberOfChanges, "ptr", rgDataChangeEntries, "uint*", rgdwDocIds, "ptr", rghrCompletionCodes, "HRESULT")
        return result
    }
}
