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
     * 
     * @param {PWSTR} pszURL 
     * @returns {HRESULT} 
     */
    StartedMonitoringScope(pszURL) {
        pszURL := pszURL is String ? StrPtr(pszURL) : pszURL

        result := ComCall(3, this, "ptr", pszURL, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszURL 
     * @returns {HRESULT} 
     */
    StoppedMonitoringScope(pszURL) {
        pszURL := pszURL is String ? StrPtr(pszURL) : pszURL

        result := ComCall(4, this, "ptr", pszURL, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwNumberOfChanges 
     * @param {Pointer<SEARCH_ITEM_CHANGE>} rgDataChangeEntries 
     * @param {Pointer<UInt32>} rgdwDocIds 
     * @param {Pointer<HRESULT>} rghrCompletionCodes 
     * @returns {HRESULT} 
     */
    OnItemsChanged(dwNumberOfChanges, rgDataChangeEntries, rgdwDocIds, rghrCompletionCodes) {
        result := ComCall(5, this, "uint", dwNumberOfChanges, "ptr", rgDataChangeEntries, "uint*", rgdwDocIds, "ptr", rghrCompletionCodes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
