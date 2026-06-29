#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ISearchCatalogManager.ahk" { ISearchCatalogManager }
#Import ".\PRIORITIZE_FLAGS.ahk" { PRIORITIZE_FLAGS }

/**
 * Extends the ISearchCatalogManager interface to manage a search catalog, for purposes such as re-indexing or setting timeouts.
 * @see https://learn.microsoft.com/windows/win32/api/searchapi/nn-searchapi-isearchcatalogmanager2
 * @namespace Windows.Win32.System.Search
 */
export default struct ISearchCatalogManager2 extends ISearchCatalogManager {
    /**
     * The interface identifier for ISearchCatalogManager2
     * @type {Guid}
     */
    static IID := Guid("{7ac3286d-4d1d-4817-84fc-c1c85e3af0d9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISearchCatalogManager2 interfaces
    */
    struct Vtbl extends ISearchCatalogManager.Vtbl {
        PrioritizeMatchingURLs : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISearchCatalogManager2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Instructs the indexer to give a higher priority to indexing items that have URLs that match a specified pattern. These items will then have a higher priority than other indexing tasks.
     * @remarks
     * The <i>pszPattern</i> string must specify a pattern than matches the entire item URL. You can use the asterisk wildcard character to create your pattern string.
     *             
     * 
     * The <i>PRIORITIZE_FLAG_IGNOREFAILURECOUNT</i> flag is valid only in combination with the <i>PRIORITIZE_FLAG_RETRYFAILEDITEMS</i> flag.
     * @param {PWSTR} pszPattern Type: <b>LPCWSTR</b>
     * 
     * A string specifying the URL pattern that defines items that failed indexing and need re-indexing.
     * @param {PRIORITIZE_FLAGS} dwPrioritizeFlags Type: <b><a href="https://docs.microsoft.com/windows/win32/api/searchapi/ne-searchapi-tagprioritize_flags">PRIORITIZE_FLAGS</a></b>
     * 
     * A value from the <a href="https://docs.microsoft.com/windows/win32/api/searchapi/ne-searchapi-tagprioritize_flags">PRIORITIZE_FLAGS</a> enumeration that specifies how to process items that the indexer has failed to index.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful, or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchcatalogmanager2-prioritizematchingurls
     */
    PrioritizeMatchingURLs(pszPattern, dwPrioritizeFlags) {
        pszPattern := pszPattern is String ? StrPtr(pszPattern) : pszPattern

        result := ComCall(29, this, "ptr", pszPattern, PRIORITIZE_FLAGS, dwPrioritizeFlags, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISearchCatalogManager2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.PrioritizeMatchingURLs := CallbackCreate(GetMethod(implObj, "PrioritizeMatchingURLs"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.PrioritizeMatchingURLs)
    }
}
