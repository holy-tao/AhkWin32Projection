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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ConnectionString", "put_QueryContentLocale", "get_QueryContentLocale", "put_QueryKeywordLocale", "get_QueryKeywordLocale", "put_QueryTermExpansion", "get_QueryTermExpansion", "put_QuerySyntax", "get_QuerySyntax", "put_QueryContentProperties", "get_QueryContentProperties", "put_QuerySelectColumns", "get_QuerySelectColumns", "put_QueryWhereRestrictions", "get_QueryWhereRestrictions", "put_QuerySorting", "get_QuerySorting", "GenerateSQLFromUserQuery", "WriteProperties", "put_QueryMaxResults", "get_QueryMaxResults"]

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchqueryhelper-get_connectionstring
     */
    get_ConnectionString() {
        result := ComCall(3, this, "ptr*", &pszConnectionString := 0, "HRESULT")
        return pszConnectionString
    }

    /**
     * 
     * @param {Integer} lcid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchqueryhelper-put_querycontentlocale
     */
    put_QueryContentLocale(lcid) {
        result := ComCall(4, this, "uint", lcid, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchqueryhelper-get_querycontentlocale
     */
    get_QueryContentLocale() {
        result := ComCall(5, this, "uint*", &plcid := 0, "HRESULT")
        return plcid
    }

    /**
     * 
     * @param {Integer} lcid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchqueryhelper-put_querykeywordlocale
     */
    put_QueryKeywordLocale(lcid) {
        result := ComCall(6, this, "uint", lcid, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchqueryhelper-get_querykeywordlocale
     */
    get_QueryKeywordLocale() {
        result := ComCall(7, this, "uint*", &plcid := 0, "HRESULT")
        return plcid
    }

    /**
     * 
     * @param {Integer} expandTerms 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchqueryhelper-put_querytermexpansion
     */
    put_QueryTermExpansion(expandTerms) {
        result := ComCall(8, this, "int", expandTerms, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchqueryhelper-get_querytermexpansion
     */
    get_QueryTermExpansion() {
        result := ComCall(9, this, "int*", &pExpandTerms := 0, "HRESULT")
        return pExpandTerms
    }

    /**
     * 
     * @param {Integer} querySyntax 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchqueryhelper-put_querysyntax
     */
    put_QuerySyntax(querySyntax) {
        result := ComCall(10, this, "int", querySyntax, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchqueryhelper-get_querysyntax
     */
    get_QuerySyntax() {
        result := ComCall(11, this, "int*", &pQuerySyntax := 0, "HRESULT")
        return pQuerySyntax
    }

    /**
     * 
     * @param {PWSTR} pszContentProperties 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchqueryhelper-put_querycontentproperties
     */
    put_QueryContentProperties(pszContentProperties) {
        pszContentProperties := pszContentProperties is String ? StrPtr(pszContentProperties) : pszContentProperties

        result := ComCall(12, this, "ptr", pszContentProperties, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchqueryhelper-get_querycontentproperties
     */
    get_QueryContentProperties() {
        result := ComCall(13, this, "ptr*", &ppszContentProperties := 0, "HRESULT")
        return ppszContentProperties
    }

    /**
     * 
     * @param {PWSTR} pszSelectColumns 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchqueryhelper-put_queryselectcolumns
     */
    put_QuerySelectColumns(pszSelectColumns) {
        pszSelectColumns := pszSelectColumns is String ? StrPtr(pszSelectColumns) : pszSelectColumns

        result := ComCall(14, this, "ptr", pszSelectColumns, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchqueryhelper-get_queryselectcolumns
     */
    get_QuerySelectColumns() {
        result := ComCall(15, this, "ptr*", &ppszSelectColumns := 0, "HRESULT")
        return ppszSelectColumns
    }

    /**
     * 
     * @param {PWSTR} pszRestrictions 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchqueryhelper-put_querywhererestrictions
     */
    put_QueryWhereRestrictions(pszRestrictions) {
        pszRestrictions := pszRestrictions is String ? StrPtr(pszRestrictions) : pszRestrictions

        result := ComCall(16, this, "ptr", pszRestrictions, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchqueryhelper-get_querywhererestrictions
     */
    get_QueryWhereRestrictions() {
        result := ComCall(17, this, "ptr*", &ppszRestrictions := 0, "HRESULT")
        return ppszRestrictions
    }

    /**
     * 
     * @param {PWSTR} pszSorting 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchqueryhelper-put_querysorting
     */
    put_QuerySorting(pszSorting) {
        pszSorting := pszSorting is String ? StrPtr(pszSorting) : pszSorting

        result := ComCall(18, this, "ptr", pszSorting, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchqueryhelper-get_querysorting
     */
    get_QuerySorting() {
        result := ComCall(19, this, "ptr*", &ppszSorting := 0, "HRESULT")
        return ppszSorting
    }

    /**
     * 
     * @param {PWSTR} pszQuery 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchqueryhelper-generatesqlfromuserquery
     */
    GenerateSQLFromUserQuery(pszQuery) {
        pszQuery := pszQuery is String ? StrPtr(pszQuery) : pszQuery

        result := ComCall(20, this, "ptr", pszQuery, "ptr*", &ppszSQL := 0, "HRESULT")
        return ppszSQL
    }

    /**
     * 
     * @param {Integer} itemID 
     * @param {Integer} dwNumberOfColumns 
     * @param {Pointer<PROPERTYKEY>} pColumns 
     * @param {Pointer<SEARCH_COLUMN_PROPERTIES>} pValues 
     * @param {Pointer<FILETIME>} pftGatherModifiedTime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchqueryhelper-writeproperties
     */
    WriteProperties(itemID, dwNumberOfColumns, pColumns, pValues, pftGatherModifiedTime) {
        result := ComCall(21, this, "int", itemID, "uint", dwNumberOfColumns, "ptr", pColumns, "ptr", pValues, "ptr", pftGatherModifiedTime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cMaxResults 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchqueryhelper-put_querymaxresults
     */
    put_QueryMaxResults(cMaxResults) {
        result := ComCall(22, this, "int", cMaxResults, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchqueryhelper-get_querymaxresults
     */
    get_QueryMaxResults() {
        result := ComCall(23, this, "int*", &pcMaxResults := 0, "HRESULT")
        return pcMaxResults
    }
}
