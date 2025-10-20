#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IDirectorySearch interface is a pure COM interface that provides a low overhead method that non-Automation clients can use to perform queries in the underlying directory.
 * @see https://docs.microsoft.com/windows/win32/api//iads/nn-iads-idirectorysearch
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class IDirectorySearch extends IUnknown{
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
     * 
     * @param {Pointer<ADS_SEARCHPREF_INFO>} pSearchPrefs 
     * @param {Integer} dwNumPrefs 
     * @returns {HRESULT} 
     */
    SetSearchPreference(pSearchPrefs, dwNumPrefs) {
        result := ComCall(3, this, "ptr", pSearchPrefs, "uint", dwNumPrefs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszSearchFilter 
     * @param {Pointer<PWSTR>} pAttributeNames 
     * @param {Integer} dwNumberAttributes 
     * @param {Pointer<ADS_SEARCH_HANDLE>} phSearchResult 
     * @returns {HRESULT} 
     */
    ExecuteSearch(pszSearchFilter, pAttributeNames, dwNumberAttributes, phSearchResult) {
        pszSearchFilter := pszSearchFilter is String ? StrPtr(pszSearchFilter) : pszSearchFilter

        result := ComCall(4, this, "ptr", pszSearchFilter, "ptr", pAttributeNames, "uint", dwNumberAttributes, "ptr", phSearchResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {ADS_SEARCH_HANDLE} phSearchResult 
     * @returns {HRESULT} 
     */
    AbandonSearch(phSearchResult) {
        phSearchResult := phSearchResult is Win32Handle ? NumGet(phSearchResult, "ptr") : phSearchResult

        result := ComCall(5, this, "ptr", phSearchResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {ADS_SEARCH_HANDLE} hSearchResult 
     * @returns {HRESULT} 
     */
    GetFirstRow(hSearchResult) {
        hSearchResult := hSearchResult is Win32Handle ? NumGet(hSearchResult, "ptr") : hSearchResult

        result := ComCall(6, this, "ptr", hSearchResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {ADS_SEARCH_HANDLE} hSearchResult 
     * @returns {HRESULT} 
     */
    GetNextRow(hSearchResult) {
        hSearchResult := hSearchResult is Win32Handle ? NumGet(hSearchResult, "ptr") : hSearchResult

        result := ComCall(7, this, "ptr", hSearchResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {ADS_SEARCH_HANDLE} hSearchResult 
     * @returns {HRESULT} 
     */
    GetPreviousRow(hSearchResult) {
        hSearchResult := hSearchResult is Win32Handle ? NumGet(hSearchResult, "ptr") : hSearchResult

        result := ComCall(8, this, "ptr", hSearchResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {ADS_SEARCH_HANDLE} hSearchHandle 
     * @param {Pointer<PWSTR>} ppszColumnName 
     * @returns {HRESULT} 
     */
    GetNextColumnName(hSearchHandle, ppszColumnName) {
        hSearchHandle := hSearchHandle is Win32Handle ? NumGet(hSearchHandle, "ptr") : hSearchHandle

        result := ComCall(9, this, "ptr", hSearchHandle, "ptr", ppszColumnName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {ADS_SEARCH_HANDLE} hSearchResult 
     * @param {PWSTR} szColumnName 
     * @param {Pointer<ADS_SEARCH_COLUMN>} pSearchColumn 
     * @returns {HRESULT} 
     */
    GetColumn(hSearchResult, szColumnName, pSearchColumn) {
        hSearchResult := hSearchResult is Win32Handle ? NumGet(hSearchResult, "ptr") : hSearchResult
        szColumnName := szColumnName is String ? StrPtr(szColumnName) : szColumnName

        result := ComCall(10, this, "ptr", hSearchResult, "ptr", szColumnName, "ptr", pSearchColumn, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ADS_SEARCH_COLUMN>} pSearchColumn 
     * @returns {HRESULT} 
     */
    FreeColumn(pSearchColumn) {
        result := ComCall(11, this, "ptr", pSearchColumn, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {ADS_SEARCH_HANDLE} hSearchResult 
     * @returns {HRESULT} 
     */
    CloseSearchHandle(hSearchResult) {
        hSearchResult := hSearchResult is Win32Handle ? NumGet(hSearchResult, "ptr") : hSearchResult

        result := ComCall(12, this, "ptr", hSearchResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
