#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Provides methods for building a query from user input, converting a query to Windows Search SQL, and obtaining a connection string to initialize a connection to the Window Search index.
 * @remarks
 * 
  * This interface is obtained by calling <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nf-searchapi-isearchcatalogmanager-getqueryhelper">ISearchCatalogManager::GetQueryHelper</a>. Implement this interface as a helper class to <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nn-searchapi-isearchcatalogmanager">ISearchCatalogManager</a>.
  * 
  * This interface facilitates the generation of SQL queries using Advanced Query Syntax (AQS) or Natural Query Syntax (NQS). Clients can submit the SQL query to the Window Search engine by using OLE DB or Microsoft ActiveX Data Objects (ADO).
  * 
  * 
  * <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nf-searchapi-isearchqueryhelper-generatesqlfromuserquery">ISearchQueryHelper::GenerateSQLFromUserQuery</a> uses regional locale settings. However, <b>ISearchQueryHelper</b> does not use the regional locale settings. As a result, there are inconsistencies in the SQL returned from <b>ISearchQueryHelper::GenerateSQLFromUserQuery</b> and <b>ISearchQueryHelper</b> for region specific settings such as date formats, for example.
  * 
  * For a sample that demonstrates how to create a class for a static console application to query Windows Search using the Microsoft.Search.Interop assembly for <b>ISearchQueryHelper</b>, see the [DSearch](https://github.com/microsoft/Windows-classic-samples/tree/master/Samples/Win7Samples/winui/WindowsSearch/DSearch) sample.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//searchapi/nn-searchapi-isearchqueryhelper
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class ISearchQueryHelper extends IUnknown{
    /**
     * The interface identifier for ISearchQueryHelper
     * @type {Guid}
     */
    static IID => Guid("{ab310581-ac80-11d1-8df3-00c04fb6ef63}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<PWSTR>} pszConnectionString 
     * @returns {HRESULT} 
     */
    get_ConnectionString(pszConnectionString) {
        result := ComCall(3, this, "ptr", pszConnectionString, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lcid 
     * @returns {HRESULT} 
     */
    put_QueryContentLocale(lcid) {
        result := ComCall(4, this, "uint", lcid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} plcid 
     * @returns {HRESULT} 
     */
    get_QueryContentLocale(plcid) {
        result := ComCall(5, this, "uint*", plcid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lcid 
     * @returns {HRESULT} 
     */
    put_QueryKeywordLocale(lcid) {
        result := ComCall(6, this, "uint", lcid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} plcid 
     * @returns {HRESULT} 
     */
    get_QueryKeywordLocale(plcid) {
        result := ComCall(7, this, "uint*", plcid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} expandTerms 
     * @returns {HRESULT} 
     */
    put_QueryTermExpansion(expandTerms) {
        result := ComCall(8, this, "int", expandTerms, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pExpandTerms 
     * @returns {HRESULT} 
     */
    get_QueryTermExpansion(pExpandTerms) {
        result := ComCall(9, this, "int*", pExpandTerms, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} querySyntax 
     * @returns {HRESULT} 
     */
    put_QuerySyntax(querySyntax) {
        result := ComCall(10, this, "int", querySyntax, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pQuerySyntax 
     * @returns {HRESULT} 
     */
    get_QuerySyntax(pQuerySyntax) {
        result := ComCall(11, this, "int*", pQuerySyntax, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszContentProperties 
     * @returns {HRESULT} 
     */
    put_QueryContentProperties(pszContentProperties) {
        pszContentProperties := pszContentProperties is String ? StrPtr(pszContentProperties) : pszContentProperties

        result := ComCall(12, this, "ptr", pszContentProperties, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszContentProperties 
     * @returns {HRESULT} 
     */
    get_QueryContentProperties(ppszContentProperties) {
        result := ComCall(13, this, "ptr", ppszContentProperties, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszSelectColumns 
     * @returns {HRESULT} 
     */
    put_QuerySelectColumns(pszSelectColumns) {
        pszSelectColumns := pszSelectColumns is String ? StrPtr(pszSelectColumns) : pszSelectColumns

        result := ComCall(14, this, "ptr", pszSelectColumns, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszSelectColumns 
     * @returns {HRESULT} 
     */
    get_QuerySelectColumns(ppszSelectColumns) {
        result := ComCall(15, this, "ptr", ppszSelectColumns, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszRestrictions 
     * @returns {HRESULT} 
     */
    put_QueryWhereRestrictions(pszRestrictions) {
        pszRestrictions := pszRestrictions is String ? StrPtr(pszRestrictions) : pszRestrictions

        result := ComCall(16, this, "ptr", pszRestrictions, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszRestrictions 
     * @returns {HRESULT} 
     */
    get_QueryWhereRestrictions(ppszRestrictions) {
        result := ComCall(17, this, "ptr", ppszRestrictions, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszSorting 
     * @returns {HRESULT} 
     */
    put_QuerySorting(pszSorting) {
        pszSorting := pszSorting is String ? StrPtr(pszSorting) : pszSorting

        result := ComCall(18, this, "ptr", pszSorting, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszSorting 
     * @returns {HRESULT} 
     */
    get_QuerySorting(ppszSorting) {
        result := ComCall(19, this, "ptr", ppszSorting, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszQuery 
     * @param {Pointer<PWSTR>} ppszSQL 
     * @returns {HRESULT} 
     */
    GenerateSQLFromUserQuery(pszQuery, ppszSQL) {
        pszQuery := pszQuery is String ? StrPtr(pszQuery) : pszQuery

        result := ComCall(20, this, "ptr", pszQuery, "ptr", ppszSQL, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} itemID 
     * @param {Integer} dwNumberOfColumns 
     * @param {Pointer<PROPERTYKEY>} pColumns 
     * @param {Pointer<SEARCH_COLUMN_PROPERTIES>} pValues 
     * @param {Pointer<FILETIME>} pftGatherModifiedTime 
     * @returns {HRESULT} 
     */
    WriteProperties(itemID, dwNumberOfColumns, pColumns, pValues, pftGatherModifiedTime) {
        result := ComCall(21, this, "int", itemID, "uint", dwNumberOfColumns, "ptr", pColumns, "ptr", pValues, "ptr", pftGatherModifiedTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cMaxResults 
     * @returns {HRESULT} 
     */
    put_QueryMaxResults(cMaxResults) {
        result := ComCall(22, this, "int", cMaxResults, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pcMaxResults 
     * @returns {HRESULT} 
     */
    get_QueryMaxResults(pcMaxResults) {
        result := ComCall(23, this, "int*", pcMaxResults, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
