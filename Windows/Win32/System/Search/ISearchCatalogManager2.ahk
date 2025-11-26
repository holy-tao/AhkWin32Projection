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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["PrioritizeMatchingURLs"]

    /**
     * Instructs the indexer to give a higher priority to indexing items that have URLs that match a specified pattern. These items will then have a higher priority than other indexing tasks.
     * @param {PWSTR} pszPattern Type: <b>LPCWSTR</b>
     * 
     * A string specifying the URL pattern that defines items that failed indexing and need re-indexing.
     * @param {Integer} dwPrioritizeFlags Type: <b><a href="https://docs.microsoft.com/windows/win32/api/searchapi/ne-searchapi-tagprioritize_flags">PRIORITIZE_FLAGS</a></b>
     * 
     * A value from the <a href="https://docs.microsoft.com/windows/win32/api/searchapi/ne-searchapi-tagprioritize_flags">PRIORITIZE_FLAGS</a> enumeration that specifies how to process items that the indexer has failed to index.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful, or an error value otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchcatalogmanager2-prioritizematchingurls
     */
    PrioritizeMatchingURLs(pszPattern, dwPrioritizeFlags) {
        pszPattern := pszPattern is String ? StrPtr(pszPattern) : pszPattern

        result := ComCall(29, this, "ptr", pszPattern, "int", dwPrioritizeFlags, "HRESULT")
        return result
    }
}
