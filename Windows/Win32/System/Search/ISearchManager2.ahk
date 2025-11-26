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
     * Creates a new custom catalog in the Windows Search indexer and returns a reference to it.
     * @param {PWSTR} pszCatalog Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCWSTR</a></b>
     * 
     * Name of catalog to create. Can be any name selected by the caller, must contain only standard alphanumeric characters and underscore.
     * @returns {ISearchCatalogManager} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nn-searchapi-isearchcatalogmanager">ISearchCatalogManager</a>**</b>
     * 
     * On success a reference to the created catalog is returned as an <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nn-searchapi-isearchcatalogmanager">ISearchCatalogManager</a> interface pointer. The Release() must be called on this interface after the calling application has finished using it.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchmanager2-createcatalog
     */
    CreateCatalog(pszCatalog) {
        pszCatalog := pszCatalog is String ? StrPtr(pszCatalog) : pszCatalog

        result := ComCall(16, this, "ptr", pszCatalog, "ptr*", &ppCatalogManager := 0, "HRESULT")
        return ISearchCatalogManager(ppCatalogManager)
    }

    /**
     * Deletes an existing catalog and all associated indexed data from the Windows Search indexer.
     * @param {PWSTR} pszCatalog Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCWSTR</a></b>
     * 
     * Name of catalog to delete. The catalog must at some prior time have been created with a call to CreateCatalog().
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * HRESULT indicating status of operation:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Catalog previously existed and has now been successfully deleted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Catalog did not previously existed, no change.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * FAILED HRESULT: Failure deleting catalog or invalid arguments passed.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchmanager2-deletecatalog
     */
    DeleteCatalog(pszCatalog) {
        pszCatalog := pszCatalog is String ? StrPtr(pszCatalog) : pszCatalog

        result := ComCall(17, this, "ptr", pszCatalog, "HRESULT")
        return result
    }
}
