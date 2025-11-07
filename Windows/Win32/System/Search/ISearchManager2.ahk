#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISearchCatalogManager.ahk
#Include .\ISearchManager.ahk

/**
 * Enabled applications to create and delete custom catalogs in the Windows Search indexer.
 * @remarks
 * 
 * ISearchManager interface ref: [../searchapi/nn-searchapi-isearchmanager.md](../searchapi/nn-searchapi-isearchmanager.md)
 * Managing the Index ref: [/windows/win32/search/-search-3x-wds-mngidx-overview](/windows/win32/search/-search-3x-wds-mngidx-overview)
 * 
 * The new functionality is exposed through the new ISearchManager2 interface. Apps can call QueryInterface on the existing ISearchManager interface to get the new interface. On older versions of Windows where this functionality does not exist the QueryInterface call will fail, and not return the new interface. The existing ISearchManager interface can be used unchanged.
 * 
 * Errors are returned through HRESULTs returned on each method in the standard way COM. ISupportErrorInfo / IErrorInfo are not supported. No exceptions are thrown.
 * 
 * These methods can be called in any COM apartment, and the behavior will not be impacted by the type of apartment. These APIs is safe to call on a UI thread but this is not recommended practice as the APIs involve cross-process IO and other potentially long-running operations.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//searchapi/nn-searchapi-isearchmanager2
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class ISearchManager2 extends ISearchManager{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISearchManager2
     * @type {Guid}
     */
    static IID => Guid("{dbab3f73-db19-4a79-bfc0-a61a93886ddf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 16

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateCatalog", "DeleteCatalog"]

    /**
     * 
     * @param {PWSTR} pszCatalog 
     * @returns {ISearchCatalogManager} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchmanager2-createcatalog
     */
    CreateCatalog(pszCatalog) {
        pszCatalog := pszCatalog is String ? StrPtr(pszCatalog) : pszCatalog

        result := ComCall(16, this, "ptr", pszCatalog, "ptr*", &ppCatalogManager := 0, "HRESULT")
        return ISearchCatalogManager(ppCatalogManager)
    }

    /**
     * 
     * @param {PWSTR} pszCatalog 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchmanager2-deletecatalog
     */
    DeleteCatalog(pszCatalog) {
        pszCatalog := pszCatalog is String ? StrPtr(pszCatalog) : pszCatalog

        result := ComCall(17, this, "ptr", pszCatalog, "HRESULT")
        return result
    }
}
