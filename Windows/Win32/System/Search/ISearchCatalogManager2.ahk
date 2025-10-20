#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISearchCatalogManager.ahk

/**
 * Extends the ISearchCatalogManager interface to manage a search catalog, for purposes such as re-indexing or setting timeouts.
 * @see https://docs.microsoft.com/windows/win32/api//searchapi/nn-searchapi-isearchcatalogmanager2
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class ISearchCatalogManager2 extends ISearchCatalogManager{
    /**
     * The interface identifier for ISearchCatalogManager2
     * @type {Guid}
     */
    static IID => Guid("{7ac3286d-4d1d-4817-84fc-c1c85e3af0d9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 29

    /**
     * 
     * @param {PWSTR} pszPattern 
     * @param {Integer} dwPrioritizeFlags 
     * @returns {HRESULT} 
     */
    PrioritizeMatchingURLs(pszPattern, dwPrioritizeFlags) {
        pszPattern := pszPattern is String ? StrPtr(pszPattern) : pszPattern

        result := ComCall(29, this, "ptr", pszPattern, "int", dwPrioritizeFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
