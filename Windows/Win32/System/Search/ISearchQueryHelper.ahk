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
     * @type {PWSTR} 
     */
    ConnectionString {
        get => this.get_ConnectionString()
    }

    /**
     * @type {Integer} 
     */
    QueryContentLocale {
        get => this.get_QueryContentLocale()
        set => this.put_QueryContentLocale(value)
    }

    /**
     * @type {Integer} 
     */
    QueryKeywordLocale {
        get => this.get_QueryKeywordLocale()
        set => this.put_QueryKeywordLocale(value)
    }

    /**
     * @type {Integer} 
     */
    QueryTermExpansion {
        get => this.get_QueryTermExpansion()
        set => this.put_QueryTermExpansion(value)
    }

    /**
     * @type {Integer} 
     */
    QuerySyntax {
        get => this.get_QuerySyntax()
        set => this.put_QuerySyntax(value)
    }

    /**
     * @type {PWSTR} 
     */
    QueryContentProperties {
        get => this.get_QueryContentProperties()
        set => this.put_QueryContentProperties(value)
    }

    /**
     * @type {PWSTR} 
     */
    QuerySelectColumns {
        get => this.get_QuerySelectColumns()
        set => this.put_QuerySelectColumns(value)
    }

    /**
     * @type {PWSTR} 
     */
    QueryWhereRestrictions {
        get => this.get_QueryWhereRestrictions()
        set => this.put_QueryWhereRestrictions(value)
    }

    /**
     * @type {PWSTR} 
     */
    QuerySorting {
        get => this.get_QuerySorting()
        set => this.put_QuerySorting(value)
    }

    /**
     * @type {Integer} 
     */
    QueryMaxResults {
        get => this.get_QueryMaxResults()
        set => this.put_QueryMaxResults(value)
    }

    /**
     * Returns the OLE DB connection string for the Window Search index.
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * Receives a pointer to a null-terminated Unicode string that is a valid OLE DB connection string. This connection string can be used to initialize a connection to the Windows Search index and submit the SQL query returned by  <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nf-searchapi-isearchqueryhelper-generatesqlfromuserquery">ISearchQueryHelper::GenerateSQLFromUserQuery</a>.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchqueryhelper-get_connectionstring
     */
    get_ConnectionString() {
        result := ComCall(3, this, "ptr*", &pszConnectionString := 0, "HRESULT")
        return pszConnectionString
    }

    /**
     * Sets the language code identifier (LCID) of the query.
     * @param {Integer} lcid Type: <b>LCID</b>
     * 
     * Sets the LCID of the query.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchqueryhelper-put_querycontentlocale
     */
    put_QueryContentLocale(lcid) {
        result := ComCall(4, this, "uint", lcid, "HRESULT")
        return result
    }

    /**
     * Gets the language code identifier (LCID) for the query.
     * @returns {Integer} Type: <b>LCID*</b>
     * 
     * Receives a pointer to the locale identifier used.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchqueryhelper-get_querycontentlocale
     */
    get_QueryContentLocale() {
        result := ComCall(5, this, "uint*", &plcid := 0, "HRESULT")
        return plcid
    }

    /**
     * Sets the language code identifier (LCID) for the locale to use when parsing Advanced Query Syntax (AQS) keywords.
     * @param {Integer} lcid Type: <b>LCID</b>
     * 
     * Sets the LCID for the locale to use when parsing Advanced Query Syntax (AQS) keywords.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchqueryhelper-put_querykeywordlocale
     */
    put_QueryKeywordLocale(lcid) {
        result := ComCall(6, this, "uint", lcid, "HRESULT")
        return result
    }

    /**
     * Gets the language code identifier (LCID) for the locale to use when parsing Advanced Query Syntax (AQS) keywords.
     * @returns {Integer} Type: <b>LCID*</b>
     * 
     * Receives a pointer to the LCID for the locale to use when parsing Advanced Query Syntax (AQS) keywords.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchqueryhelper-get_querykeywordlocale
     */
    get_QueryKeywordLocale() {
        result := ComCall(7, this, "uint*", &plcid := 0, "HRESULT")
        return plcid
    }

    /**
     * Sets a value that specifies how query terms are to be expanded.
     * @param {Integer} expandTerms Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/searchapi/ne-searchapi-search_term_expansion">SEARCH_TERM_EXPANSION</a></b>
     * 
     * Value from the <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/ne-searchapi-search_term_expansion">SEARCH_TERM_EXPANSION</a> enumeration that specifies the search term expansion. If not set, the default value is SEARCH_TERM_PREFIX_ALL.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchqueryhelper-put_querytermexpansion
     */
    put_QueryTermExpansion(expandTerms) {
        result := ComCall(8, this, "int", expandTerms, "HRESULT")
        return result
    }

    /**
     * Gets the value that specifies how query terms are to be expanded.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/searchapi/ne-searchapi-search_term_expansion">SEARCH_TERM_EXPANSION</a>*</b>
     * 
     * Receives a pointer to a value from the <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/ne-searchapi-search_term_expansion">SEARCH_TERM_EXPANSION</a> enumeration that specifies the query term expansion.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchqueryhelper-get_querytermexpansion
     */
    get_QueryTermExpansion() {
        result := ComCall(9, this, "int*", &pExpandTerms := 0, "HRESULT")
        return pExpandTerms
    }

    /**
     * Sets the syntax of the query.
     * @param {Integer} querySyntax Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/searchapi/ne-searchapi-search_query_syntax">SEARCH_QUERY_SYNTAX</a></b>
     * 
     * Flag that specifies the search query syntax. For a list of possible values, see the description of the <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/ne-searchapi-search_query_syntax">SEARCH_QUERY_SYNTAX</a> enumerated type.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchqueryhelper-put_querysyntax
     */
    put_QuerySyntax(querySyntax) {
        result := ComCall(10, this, "int", querySyntax, "HRESULT")
        return result
    }

    /**
     * Gets the syntax of the query.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/searchapi/ne-searchapi-search_query_syntax">SEARCH_QUERY_SYNTAX</a>*</b>
     * 
     * Receives a pointer to a value from the <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/ne-searchapi-search_query_syntax">SEARCH_QUERY_SYNTAX</a> enumeration.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchqueryhelper-get_querysyntax
     */
    get_QuerySyntax() {
        result := ComCall(11, this, "int*", &pQuerySyntax := 0, "HRESULT")
        return pQuerySyntax
    }

    /**
     * Sets the properties to include in the query if search terms do not explicitly specify properties.
     * @param {PWSTR} pszContentProperties Type: <b>LPCWSTR</b>
     * 
     * Pointer to a comma-delimited, null-terminated Unicode string of one or more properties. Separate column specifiers with commas: "Content,DocAuthor".
     *          
     * 
     * Set <i>ppszContentProperties</i> to <b>NULL</b> to use all properties.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchqueryhelper-put_querycontentproperties
     */
    put_QueryContentProperties(pszContentProperties) {
        pszContentProperties := pszContentProperties is String ? StrPtr(pszContentProperties) : pszContentProperties

        result := ComCall(12, this, "ptr", pszContentProperties, "HRESULT")
        return result
    }

    /**
     * Gets the list of properties included in the query when search terms do not explicitly specify a property.
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * Receives a pointer to a comma-delimited, null-terminated Unicode string of content properties to search. If <i>ppszContentProperties</i> is <b>NULL</b>,  all properties are searched.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchqueryhelper-get_querycontentproperties
     */
    get_QueryContentProperties() {
        result := ComCall(13, this, "ptr*", &ppszContentProperties := 0, "HRESULT")
        return ppszContentProperties
    }

    /**
     * Sets the columns (or properties) requested in the select statement.
     * @param {PWSTR} pszSelectColumns Type: <b>LPCWSTR</b>
     * 
     * Pointer to a comma-delimited, null-terminated Unicode string that specifies one or more columns in the property store. Separate multiple column specifiers with commas: "System.Document.Author,System.Document.Title".
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchqueryhelper-put_queryselectcolumns
     */
    put_QuerySelectColumns(pszSelectColumns) {
        pszSelectColumns := pszSelectColumns is String ? StrPtr(pszSelectColumns) : pszSelectColumns

        result := ComCall(14, this, "ptr", pszSelectColumns, "HRESULT")
        return result
    }

    /**
     * Gets the columns (or properties) requested in the SELECT statement of the query.
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * Receives a pointer to a comma-delimited, null-terminated Unicode string that specifies the columns (or properties) to be returned from a query.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchqueryhelper-get_queryselectcolumns
     */
    get_QuerySelectColumns() {
        result := ComCall(15, this, "ptr*", &ppszSelectColumns := 0, "HRESULT")
        return ppszSelectColumns
    }

    /**
     * Sets the restrictions appended to a query in WHERE clauses.
     * @param {PWSTR} pszRestrictions Type: <b>LPCWSTR</b>
     * 
     * Pointer to a comma-delimited null-terminated Unicode string that specifies one or more query restrictions appended to the query in generated WHERE clause.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchqueryhelper-put_querywhererestrictions
     */
    put_QueryWhereRestrictions(pszRestrictions) {
        pszRestrictions := pszRestrictions is String ? StrPtr(pszRestrictions) : pszRestrictions

        result := ComCall(16, this, "ptr", pszRestrictions, "HRESULT")
        return result
    }

    /**
     * Gets the restrictions appended to a query in WHERE clauses.
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * Receives a pointer to a comma-delimited null-terminated Unicode string that specifies one or more restrictions appended to a query by WHERE clauses.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchqueryhelper-get_querywhererestrictions
     */
    get_QueryWhereRestrictions() {
        result := ComCall(17, this, "ptr*", &ppszRestrictions := 0, "HRESULT")
        return ppszRestrictions
    }

    /**
     * Sets the sort order for the query result set.
     * @param {PWSTR} pszSorting Type: <b>LPCWSTR</b>
     * 
     * A comma-delimited, null-terminated Unicode string that specifies the sort order.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchqueryhelper-put_querysorting
     */
    put_QuerySorting(pszSorting) {
        pszSorting := pszSorting is String ? StrPtr(pszSorting) : pszSorting

        result := ComCall(18, this, "ptr", pszSorting, "HRESULT")
        return result
    }

    /**
     * Gets the sort order for the query result set.
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * Receives a pointer to a comma-delimited, null-terminated Unicode string representing the sort order.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchqueryhelper-get_querysorting
     */
    get_QuerySorting() {
        result := ComCall(19, this, "ptr*", &ppszSorting := 0, "HRESULT")
        return ppszSorting
    }

    /**
     * Generates a Structured Query Language (SQL) query based on a client-supplied query string expressed in either Advanced Query Syntax (AQS) or Natural Query Syntax (NQS).
     * @param {PWSTR} pszQuery Type: <b>LPCWSTR</b>
     * 
     * A pointer to a null-terminated Unicode string containing a query in AQS or NQS.
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * Receives the address of a pointer to a SQL query string based on the query in the <i>pszQuery</i> parameter.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchqueryhelper-generatesqlfromuserquery
     */
    GenerateSQLFromUserQuery(pszQuery) {
        pszQuery := pszQuery is String ? StrPtr(pszQuery) : pszQuery

        result := ComCall(20, this, "ptr", pszQuery, "ptr*", &ppszSQL := 0, "HRESULT")
        return ppszSQL
    }

    /**
     * Not implemented.
     * @param {Integer} itemID Type: <b>int</b>
     * 
     * The ItemID that is to be affected. The ItemID is used to store the items unique identifier, such as a DocID.
     * @param {Integer} dwNumberOfColumns Type: <b>DWORD</b>
     * 
     * The number of properties being written.
     * @param {Pointer<PROPERTYKEY>} pColumns Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a>*</b>
     * 
     *  Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a> structures that represent the properties.
     * @param {Pointer<SEARCH_COLUMN_PROPERTIES>} pValues Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/searchapi/ns-searchapi-search_column_properties">SEARCH_COLUMN_PROPERTIES</a>*</b>
     * 
     * Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/ns-searchapi-search_column_properties">SEARCH_COLUMN_PROPERTIES</a> structures that hold the property values.
     * @param {Pointer<FILETIME>} pftGatherModifiedTime Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a>*</b>
     * 
     * A pointer to the last modified time for the item being written. This time stamp is used later to see if an item has been changed and requires updating.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchqueryhelper-writeproperties
     */
    WriteProperties(itemID, dwNumberOfColumns, pColumns, pValues, pftGatherModifiedTime) {
        result := ComCall(21, this, "int", itemID, "uint", dwNumberOfColumns, "ptr", pColumns, "ptr", pValues, "ptr", pftGatherModifiedTime, "HRESULT")
        return result
    }

    /**
     * Sets the maximum number of results to be returned by a query.
     * @param {Integer} cMaxResults Type: <b>LONG</b>
     * 
     * The maximum number of results to be returned. Negative numbers return all results.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchqueryhelper-put_querymaxresults
     */
    put_QueryMaxResults(cMaxResults) {
        result := ComCall(22, this, "int", cMaxResults, "HRESULT")
        return result
    }

    /**
     * Gets the maximum number of results to be returned by the query.
     * @returns {Integer} Type: <b>LONG*</b>
     * 
     * Receives a pointer to the maximum number of results to be returned by the query. Negative numbers return all results.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchqueryhelper-get_querymaxresults
     */
    get_QueryMaxResults() {
        result := ComCall(23, this, "int*", &pcMaxResults := 0, "HRESULT")
        return pcMaxResults
    }
}
