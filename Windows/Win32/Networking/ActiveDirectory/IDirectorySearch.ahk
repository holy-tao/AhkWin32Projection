#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\ADS_SEARCH_COLUMN.ahk" { ADS_SEARCH_COLUMN }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ADS_SEARCHPREF_INFO.ahk" { ADS_SEARCHPREF_INFO }
#Import ".\ADS_SEARCH_HANDLE.ahk" { ADS_SEARCH_HANDLE }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IDirectorySearch interface is a pure COM interface that provides a low overhead method that non-Automation clients can use to perform queries in the underlying directory.
 * @see https://learn.microsoft.com/windows/win32/api/iads/nn-iads-idirectorysearch
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct IDirectorySearch extends IUnknown {
    /**
     * The interface identifier for IDirectorySearch
     * @type {Guid}
     */
    static IID := Guid("{109ba8ec-92f0-11d0-a790-00c04fd8d5a8}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDirectorySearch interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetSearchPreference : IntPtr
        ExecuteSearch       : IntPtr
        AbandonSearch       : IntPtr
        GetFirstRow         : IntPtr
        GetNextRow          : IntPtr
        GetPreviousRow      : IntPtr
        GetNextColumnName   : IntPtr
        GetColumn           : IntPtr
        FreeColumn          : IntPtr
        CloseSearchHandle   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDirectorySearch.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Specifies a search preference for obtaining data in a subsequent search.
     * @param {Pointer<ADS_SEARCHPREF_INFO>} pSearchPrefs Provides a caller-allocated array of  <a href="https://docs.microsoft.com/windows/desktop/api/iads/ns-iads-ads_searchpref_info">ADS_SEARCHPREF_INFO</a> structures that contain the search preferences to be set.
     * @param {Integer} dwNumPrefs Provides the size of the <i>pSearchPrefs</i> array.
     * @returns {HRESULT} This method supports the standard return values, as well as the following:
     * 
     * For more information and other return values, see  <a href="https://docs.microsoft.com/windows/desktop/ADSI/adsi-error-codes">ADSI Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-idirectorysearch-setsearchpreference
     */
    SetSearchPreference(pSearchPrefs, dwNumPrefs) {
        result := ComCall(3, this, ADS_SEARCHPREF_INFO.Ptr, pSearchPrefs, "uint", dwNumPrefs, "HRESULT")
        return result
    }

    /**
     * The IDirectorySearch::ExecuteSearch method executes a search and passes the results to the caller.
     * @remarks
     * When the search filter (<i>pszSearchFilter</i>) contains an attribute of <b>ADS_UTC_TIME</b> type, it value must be of the "yymmddhhmmssZ" format where "y", "m", "d", "h", "m" and "s" stand for year, month, day, hour, minute, and second, respectively. In this format, for example, "10:20:00 May 13<sup>th</sup>, 1999" becomes "990513102000Z". The final letter "Z" is the required syntax and indicated Zulu Time or Universal Coordinated Time.
     * 
     * The caller must call  <a href="https://docs.microsoft.com/windows/desktop/api/iads/nf-iads-idirectorysearch-closesearchhandle">IDirectorySearch::CloseSearchHandle</a> to release the memory allocated for the search handle and the result.
     * 
     * When using the special value of 0xFFFFFFFF for <i>dwNumberAttributes</i>, LDAP retrieval of ADsPath or distinguishedName has no extra resource or time cost.
     * @param {PWSTR} pszSearchFilter A search filter string in LDAP format, such as "(objectClass=user)".
     * @param {Pointer<PWSTR>} pAttributeNames An array of attribute names for which data is requested. If <b>NULL</b>, <i>dwNumberAttributes</i> must be 0 or 0xFFFFFFFF.
     * @param {Integer} dwNumberAttributes The size of the <i>pAttributeNames</i> array. The special value 0xFFFFFFFF indicates that <i>pAttributeNames</i> is ignored and can be <b>NULL</b>.  This special value means that all attributes that are set are requested.  If this value is 0 the <i>pAttributeNames</i> array can be <b>NULL</b>.  No attribute will be requested.
     * @returns {ADS_SEARCH_HANDLE} The address of a method-allocated handle to the search context. The caller passes this handle to other methods of  <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-idirectorysearch">IDirectorySearch</a> to examine the search result. If <b>NULL</b>, the search cannot be executed.
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-idirectorysearch-executesearch
     */
    ExecuteSearch(pszSearchFilter, pAttributeNames, dwNumberAttributes) {
        pszSearchFilter := pszSearchFilter is String ? StrPtr(pszSearchFilter) : pszSearchFilter

        pAttributeNamesMarshal := pAttributeNames is VarRef ? "ptr*" : "ptr"

        phSearchResult := ADS_SEARCH_HANDLE()
        result := ComCall(4, this, "ptr", pszSearchFilter, pAttributeNamesMarshal, pAttributeNames, "uint", dwNumberAttributes, ADS_SEARCH_HANDLE.Ptr, phSearchResult, "HRESULT")
        return phSearchResult
    }

    /**
     * The IDirectorySearch::AbandonSearch method abandons a search initiated by an earlier call to the ExecuteSearch method.
     * @remarks
     * <b>IDirectorySearch::AbandonSearch</b> may be used if the Page_Size or Asynchronous options can be specified through  <a href="https://docs.microsoft.com/windows/desktop/api/iads/nf-iads-idirectorysearch-setsearchpreference">IDirectorySearch::SetSearchPreference</a> before the search is executed.
     * @param {ADS_SEARCH_HANDLE} phSearchResult Provides a handle to the search context.
     * @returns {HRESULT} This method returns the standard return values, including S_OK if the first row is obtained successfully.
     * 
     * For other return values, see  <a href="https://docs.microsoft.com/windows/desktop/ADSI/adsi-error-codes">ADSI Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-idirectorysearch-abandonsearch
     */
    AbandonSearch(phSearchResult) {
        result := ComCall(5, this, ADS_SEARCH_HANDLE, phSearchResult, "HRESULT")
        return result
    }

    /**
     * The GetFirstRow method gets the first row of a search result. This method will issue or reissue a new search, even if this method has been called before.
     * @remarks
     * When the <b>ADS_SEARCHPREF_CACHE_RESULTS</b> flag is not set, that is, <b>FALSE</b>, only forward scrolling is permitted, because the client might not cache all the query results. Calling <b>GetFirstRow</b> more than once from the same row requires some back-scrolling and could result in erroneous outcomes for a paged or an asynchronous search initiated through OLE DB when the results are not guaranteed to remain in the cache.
     * @param {ADS_SEARCH_HANDLE} hSearchResult Contains the search handle obtained by calling <a href="https://docs.microsoft.com/windows/desktop/api/iads/nf-iads-idirectorysearch-executesearch">IDirectorySearch::ExecuteSearch</a>.
     * @returns {HRESULT} This method returns the standard return values, as well as the following:
     *       
     * 
     * For more information,  see  <a href="https://docs.microsoft.com/windows/desktop/ADSI/adsi-error-codes">ADSI Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-idirectorysearch-getfirstrow
     */
    GetFirstRow(hSearchResult) {
        result := ComCall(6, this, ADS_SEARCH_HANDLE, hSearchResult, Int32)
        return result
    }

    /**
     * Gets the next row of the search result.
     * @remarks
     * When the <b>ADS_SEARCHPREF_CACHE_RESULTS</b> flag is not set, only forward scrolling is permitted, because the client might not cache all the query results.
     * 
     * The directory provider may limit the maximum number of rows available in a search. For example, on a Windows domain, the maximum number of rows that will be provided in an Active Directory search is 1000 rows. If the search results in more than the row limit, a paged search must be performed to obtain all rows in the search. For more information about paged searches, see <a href="https://docs.microsoft.com/windows/desktop/ADSI/paging-with-idirectorysearch">Paging with IDirectorySearch</a>.
     * @param {ADS_SEARCH_HANDLE} hSearchResult Contains the search handle obtained by calling <a href="https://docs.microsoft.com/windows/desktop/api/iads/nf-iads-idirectorysearch-executesearch">IDirectorySearch::ExecuteSearch</a>.
     * @returns {HRESULT} This method returns the standard return values, as well as the following:
     * 
     * For more information, see  <a href="https://docs.microsoft.com/windows/desktop/ADSI/adsi-error-codes">ADSI Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-idirectorysearch-getnextrow
     */
    GetNextRow(hSearchResult) {
        result := ComCall(7, this, ADS_SEARCH_HANDLE, hSearchResult, Int32)
        return result
    }

    /**
     * The IDirectorySearch::GetPreviousRow method gets the previous row of the search result. If the provider does not provide cursor support, it should return E_NOTIMPL.
     * @remarks
     * When the <b>ADS_SEARCHPREF_CACHE_RESULTS</b> flag is not set, only forward scrolling is permitted, because the client might not cache all the query results.
     * @param {ADS_SEARCH_HANDLE} hSearchResult Provides a handle to the search context.
     * @returns {HRESULT} This method returns the standard return values, as well as the following:
     * 
     * For other return values, see  <a href="https://docs.microsoft.com/windows/desktop/ADSI/adsi-error-codes">ADSI Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-idirectorysearch-getpreviousrow
     */
    GetPreviousRow(hSearchResult) {
        result := ComCall(8, this, ADS_SEARCH_HANDLE, hSearchResult, Int32)
        return result
    }

    /**
     * The IDirectorySearch::GetNextColumnName method gets the name of the next column in the search result that contains data.
     * @remarks
     * This method allocates sufficient memory for the column name, but the caller must call the  <a href="https://docs.microsoft.com/windows/desktop/api/adshlp/nf-adshlp-freeadsmem">FreeADsMem</a> helper function to free this memory when it is no longer needed.
     * @param {ADS_SEARCH_HANDLE} hSearchHandle Provides a handle to the search context.
     * @returns {PWSTR} Provides the address of a pointer to a method-allocated string containing the requested column name. If <b>NULL</b>, no subsequent rows contain data.
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-idirectorysearch-getnextcolumnname
     */
    GetNextColumnName(hSearchHandle) {
        result := ComCall(9, this, ADS_SEARCH_HANDLE, hSearchHandle, PWSTR.Ptr, &ppszColumnName := 0, Int32)
        return ppszColumnName
    }

    /**
     * The IDirectorySearch::GetColumn method gets data from a named column of the search result.
     * @remarks
     * The method allocates the memory for the  <a href="https://docs.microsoft.com/windows/desktop/api/iads/ns-iads-ads_search_column">ADS_SEARCH_COLUMN</a> structure to hold the data of the column. But the caller must free the memory by calling  <a href="https://docs.microsoft.com/windows/desktop/api/iads/nf-iads-idirectorysearch-freecolumn">IDirectorySearch::FreeColumn</a>.
     * 
     * The <b>IDirectorySearch::GetColumn</b> method tries to read the schema definition of the requested attribute so it can return the attribute values in the appropriate format in the <a href="https://docs.microsoft.com/windows/desktop/api/iads/ns-iads-adsvalue">ADSVALUE</a> structures, contained in the <a href="https://docs.microsoft.com/windows/desktop/api/iads/ns-iads-ads_search_column">ADS_SEARCH_COLUMN</a> structure. However, <b>GetColumn</b> can succeed even when the schema definition is not available, in which case the <b>dwADsType</b> member of the <b>ADS_SEARCH_COLUMN</b> structure returns ADSTYPE_PROV_SPECIFIC and the value is returned in an <a href="https://docs.microsoft.com/windows/win32/api/iads/ns-iads-ads_prov_specific">ADS_PROV_SPECIFIC</a> structure. When you process the results of a <b>GetColumn</b> call, you must verify <b>dwADsType</b> to ensure that the data was returned in the expected format.
     * @param {ADS_SEARCH_HANDLE} hSearchResult Provides a handle to the search context.
     * @param {PWSTR} szColumnName Provides the name of the column for which data is requested.
     * @returns {ADS_SEARCH_COLUMN} Provides the address of a method-allocated  <a href="https://docs.microsoft.com/windows/desktop/api/iads/ns-iads-ads_search_column">ADS_SEARCH_COLUMN</a> structure that contains the column from the current row of the search result.
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-idirectorysearch-getcolumn
     */
    GetColumn(hSearchResult, szColumnName) {
        szColumnName := szColumnName is String ? StrPtr(szColumnName) : szColumnName

        pSearchColumn := ADS_SEARCH_COLUMN()
        result := ComCall(10, this, ADS_SEARCH_HANDLE, hSearchResult, "ptr", szColumnName, ADS_SEARCH_COLUMN.Ptr, pSearchColumn, "HRESULT")
        return pSearchColumn
    }

    /**
     * The IDirectorySearch::FreeColumn method releases memory that the IDirectorySearch::GetColumn method allocated for data for the column.
     * @param {Pointer<ADS_SEARCH_COLUMN>} pSearchColumn Provides a pointer to the column to be freed.
     * @returns {HRESULT} This method returns the standard return values, as well as the following:
     * 
     * For other return values, see <a href="https://docs.microsoft.com/windows/desktop/ADSI/adsi-error-codes">ADSI Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-idirectorysearch-freecolumn
     */
    FreeColumn(pSearchColumn) {
        result := ComCall(11, this, ADS_SEARCH_COLUMN.Ptr, pSearchColumn, "HRESULT")
        return result
    }

    /**
     * The IDirectorySearch::CloseSearchHandle method closes the handle to a search result and frees the associated memory.
     * @remarks
     * The process that implements the <b>IDirectorySearch::CloseSearchHandle</b> method must also be responsible for freeing all memory allocated by the  <a href="https://docs.microsoft.com/windows/desktop/api/iads/nf-iads-idirectorysearch-executesearch">IDirectorySearch::ExecuteSearch</a> method, including the search result and the search result handle.
     * 
     * The caller may call this method only once for each opened search handle and must use the <a href="https://docs.microsoft.com/windows/desktop/api/iads/nf-iads-idirectorysearch-executesearch">IDirectorySearch::ExecuteSearch</a> method to obtain a new search handle after issuing <b>IDirectorySearch::CloseSearchHandle</b>.
     * @param {ADS_SEARCH_HANDLE} hSearchResult Provides a handle to the search result to be closed.
     * @returns {HRESULT} This method returns the standard return values, as well as the following:
     * 
     * For other return values, see  <a href="https://docs.microsoft.com/windows/desktop/ADSI/adsi-error-codes">ADSI Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-idirectorysearch-closesearchhandle
     */
    CloseSearchHandle(hSearchResult) {
        result := ComCall(12, this, ADS_SEARCH_HANDLE, hSearchResult, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDirectorySearch.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetSearchPreference := CallbackCreate(GetMethod(implObj, "SetSearchPreference"), flags, 3)
        this.vtbl.ExecuteSearch := CallbackCreate(GetMethod(implObj, "ExecuteSearch"), flags, 5)
        this.vtbl.AbandonSearch := CallbackCreate(GetMethod(implObj, "AbandonSearch"), flags, 2)
        this.vtbl.GetFirstRow := CallbackCreate(GetMethod(implObj, "GetFirstRow"), flags, 2)
        this.vtbl.GetNextRow := CallbackCreate(GetMethod(implObj, "GetNextRow"), flags, 2)
        this.vtbl.GetPreviousRow := CallbackCreate(GetMethod(implObj, "GetPreviousRow"), flags, 2)
        this.vtbl.GetNextColumnName := CallbackCreate(GetMethod(implObj, "GetNextColumnName"), flags, 3)
        this.vtbl.GetColumn := CallbackCreate(GetMethod(implObj, "GetColumn"), flags, 4)
        this.vtbl.FreeColumn := CallbackCreate(GetMethod(implObj, "FreeColumn"), flags, 2)
        this.vtbl.CloseSearchHandle := CallbackCreate(GetMethod(implObj, "CloseSearchHandle"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetSearchPreference)
        CallbackFree(this.vtbl.ExecuteSearch)
        CallbackFree(this.vtbl.AbandonSearch)
        CallbackFree(this.vtbl.GetFirstRow)
        CallbackFree(this.vtbl.GetNextRow)
        CallbackFree(this.vtbl.GetPreviousRow)
        CallbackFree(this.vtbl.GetNextColumnName)
        CallbackFree(this.vtbl.GetColumn)
        CallbackFree(this.vtbl.FreeColumn)
        CallbackFree(this.vtbl.CloseSearchHandle)
    }
}
