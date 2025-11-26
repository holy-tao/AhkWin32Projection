#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ADS_SEARCH_HANDLE.ahk
#Include .\ADS_SEARCH_COLUMN.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IDirectorySearch interface is a pure COM interface that provides a low overhead method that non-Automation clients can use to perform queries in the underlying directory.
 * @see https://docs.microsoft.com/windows/win32/api//iads/nn-iads-idirectorysearch
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class IDirectorySearch extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDirectorySearch
     * @type {Guid}
     */
    static IID => Guid("{109ba8ec-92f0-11d0-a790-00c04fd8d5a8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetSearchPreference", "ExecuteSearch", "AbandonSearch", "GetFirstRow", "GetNextRow", "GetPreviousRow", "GetNextColumnName", "GetColumn", "FreeColumn", "CloseSearchHandle"]

    /**
     * Specifies a search preference for obtaining data in a subsequent search.
     * @param {Pointer<ADS_SEARCHPREF_INFO>} pSearchPrefs Provides a caller-allocated array of  <a href="https://docs.microsoft.com/windows/desktop/api/iads/ns-iads-ads_searchpref_info">ADS_SEARCHPREF_INFO</a> structures that contain the search preferences to be set.
     * @param {Integer} dwNumPrefs Provides the size of the <i>pSearchPrefs</i> array.
     * @returns {HRESULT} This method supports the standard return values, as well as the following:
     * 
     * For more information and other return values, see  <a href="/windows/desktop/ADSI/adsi-error-codes">ADSI Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//iads/nf-iads-idirectorysearch-setsearchpreference
     */
    SetSearchPreference(pSearchPrefs, dwNumPrefs) {
        result := ComCall(3, this, "ptr", pSearchPrefs, "uint", dwNumPrefs, "HRESULT")
        return result
    }

    /**
     * The IDirectorySearch::ExecuteSearch method executes a search and passes the results to the caller.
     * @param {PWSTR} pszSearchFilter A search filter string in LDAP format, such as "(objectClass=user)".
     * @param {Pointer<PWSTR>} pAttributeNames An array of attribute names for which data is requested. If <b>NULL</b>, <i>dwNumberAttributes</i> must be 0 or 0xFFFFFFFF.
     * @param {Integer} dwNumberAttributes The size of the <i>pAttributeNames</i> array. The special value 0xFFFFFFFF indicates that <i>pAttributeNames</i> is ignored and can be <b>NULL</b>.  This special value means that all attributes that are set are requested.  If this value is 0 the <i>pAttributeNames</i> array can be <b>NULL</b>.  No attribute will be requested.
     * @returns {ADS_SEARCH_HANDLE} The address of a method-allocated handle to the search context. The caller passes this handle to other methods of  <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-idirectorysearch">IDirectorySearch</a> to examine the search result. If <b>NULL</b>, the search cannot be executed.
     * @see https://docs.microsoft.com/windows/win32/api//iads/nf-iads-idirectorysearch-executesearch
     */
    ExecuteSearch(pszSearchFilter, pAttributeNames, dwNumberAttributes) {
        pszSearchFilter := pszSearchFilter is String ? StrPtr(pszSearchFilter) : pszSearchFilter

        pAttributeNamesMarshal := pAttributeNames is VarRef ? "ptr*" : "ptr"

        phSearchResult := ADS_SEARCH_HANDLE()
        result := ComCall(4, this, "ptr", pszSearchFilter, pAttributeNamesMarshal, pAttributeNames, "uint", dwNumberAttributes, "ptr", phSearchResult, "HRESULT")
        return phSearchResult
    }

    /**
     * The IDirectorySearch::AbandonSearch method abandons a search initiated by an earlier call to the ExecuteSearch method.
     * @param {ADS_SEARCH_HANDLE} phSearchResult Provides a handle to the search context.
     * @returns {HRESULT} This method returns the standard return values, including S_OK if the first row is obtained successfully.
     * 
     * For other return values, see  <a href="/windows/desktop/ADSI/adsi-error-codes">ADSI Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//iads/nf-iads-idirectorysearch-abandonsearch
     */
    AbandonSearch(phSearchResult) {
        phSearchResult := phSearchResult is Win32Handle ? NumGet(phSearchResult, "ptr") : phSearchResult

        result := ComCall(5, this, "ptr", phSearchResult, "HRESULT")
        return result
    }

    /**
     * The GetFirstRow method gets the first row of a search result. This method will issue or reissue a new search, even if this method has been called before.
     * @param {ADS_SEARCH_HANDLE} hSearchResult Contains the search handle obtained by calling <a href="https://docs.microsoft.com/windows/desktop/api/iads/nf-iads-idirectorysearch-executesearch">IDirectorySearch::ExecuteSearch</a>.
     * @returns {HRESULT} This method returns the standard return values, as well as the following:
     *       
     * 
     * For more information,  see  <a href="/windows/desktop/ADSI/adsi-error-codes">ADSI Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//iads/nf-iads-idirectorysearch-getfirstrow
     */
    GetFirstRow(hSearchResult) {
        hSearchResult := hSearchResult is Win32Handle ? NumGet(hSearchResult, "ptr") : hSearchResult

        result := ComCall(6, this, "ptr", hSearchResult, "int")
        return result
    }

    /**
     * Gets the next row of the search result.
     * @param {ADS_SEARCH_HANDLE} hSearchResult Contains the search handle obtained by calling <a href="https://docs.microsoft.com/windows/desktop/api/iads/nf-iads-idirectorysearch-executesearch">IDirectorySearch::ExecuteSearch</a>.
     * @returns {HRESULT} This method returns the standard return values, as well as the following:
     * 
     * For more information, see  <a href="/windows/desktop/ADSI/adsi-error-codes">ADSI Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//iads/nf-iads-idirectorysearch-getnextrow
     */
    GetNextRow(hSearchResult) {
        hSearchResult := hSearchResult is Win32Handle ? NumGet(hSearchResult, "ptr") : hSearchResult

        result := ComCall(7, this, "ptr", hSearchResult, "int")
        return result
    }

    /**
     * The IDirectorySearch::GetPreviousRow method gets the previous row of the search result. If the provider does not provide cursor support, it should return E_NOTIMPL.
     * @param {ADS_SEARCH_HANDLE} hSearchResult Provides a handle to the search context.
     * @returns {HRESULT} This method returns the standard return values, as well as the following:
     * 
     * For other return values, see  <a href="/windows/desktop/ADSI/adsi-error-codes">ADSI Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//iads/nf-iads-idirectorysearch-getpreviousrow
     */
    GetPreviousRow(hSearchResult) {
        hSearchResult := hSearchResult is Win32Handle ? NumGet(hSearchResult, "ptr") : hSearchResult

        result := ComCall(8, this, "ptr", hSearchResult, "int")
        return result
    }

    /**
     * The IDirectorySearch::GetNextColumnName method gets the name of the next column in the search result that contains data.
     * @param {ADS_SEARCH_HANDLE} hSearchHandle Provides a handle to the search context.
     * @returns {PWSTR} Provides the address of a pointer to a method-allocated string containing the requested column name. If <b>NULL</b>, no subsequent rows contain data.
     * @see https://docs.microsoft.com/windows/win32/api//iads/nf-iads-idirectorysearch-getnextcolumnname
     */
    GetNextColumnName(hSearchHandle) {
        hSearchHandle := hSearchHandle is Win32Handle ? NumGet(hSearchHandle, "ptr") : hSearchHandle

        result := ComCall(9, this, "ptr", hSearchHandle, "ptr*", &ppszColumnName := 0, "int")
        return ppszColumnName
    }

    /**
     * The IDirectorySearch::GetColumn method gets data from a named column of the search result.
     * @param {ADS_SEARCH_HANDLE} hSearchResult Provides a handle to the search context.
     * @param {PWSTR} szColumnName Provides the name of the column for which data is requested.
     * @returns {ADS_SEARCH_COLUMN} Provides the address of a method-allocated  <a href="https://docs.microsoft.com/windows/desktop/api/iads/ns-iads-ads_search_column">ADS_SEARCH_COLUMN</a> structure that contains the column from the current row of the search result.
     * @see https://docs.microsoft.com/windows/win32/api//iads/nf-iads-idirectorysearch-getcolumn
     */
    GetColumn(hSearchResult, szColumnName) {
        hSearchResult := hSearchResult is Win32Handle ? NumGet(hSearchResult, "ptr") : hSearchResult
        szColumnName := szColumnName is String ? StrPtr(szColumnName) : szColumnName

        pSearchColumn := ADS_SEARCH_COLUMN()
        result := ComCall(10, this, "ptr", hSearchResult, "ptr", szColumnName, "ptr", pSearchColumn, "HRESULT")
        return pSearchColumn
    }

    /**
     * The IDirectorySearch::FreeColumn method releases memory that the IDirectorySearch::GetColumn method allocated for data for the column.
     * @param {Pointer<ADS_SEARCH_COLUMN>} pSearchColumn Provides a pointer to the column to be freed.
     * @returns {HRESULT} This method returns the standard return values, as well as the following:
     * 
     * For other return values, see <a href="/windows/desktop/ADSI/adsi-error-codes">ADSI Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//iads/nf-iads-idirectorysearch-freecolumn
     */
    FreeColumn(pSearchColumn) {
        result := ComCall(11, this, "ptr", pSearchColumn, "HRESULT")
        return result
    }

    /**
     * The IDirectorySearch::CloseSearchHandle method closes the handle to a search result and frees the associated memory.
     * @param {ADS_SEARCH_HANDLE} hSearchResult Provides a handle to the search result to be closed.
     * @returns {HRESULT} This method returns the standard return values, as well as the following:
     * 
     * For other return values, see  <a href="/windows/desktop/ADSI/adsi-error-codes">ADSI Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//iads/nf-iads-idirectorysearch-closesearchhandle
     */
    CloseSearchHandle(hSearchResult) {
        hSearchResult := hSearchResult is Win32Handle ? NumGet(hSearchResult, "ptr") : hSearchResult

        result := ComCall(12, this, "ptr", hSearchResult, "HRESULT")
        return result
    }
}
