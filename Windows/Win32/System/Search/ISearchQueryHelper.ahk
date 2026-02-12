#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Provides methods for building a query from user input, converting a query to Windows Search SQL, and obtaining a connection string to initialize a connection to the Window Search index.
 * @remarks
 * This interface is obtained by calling <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nf-searchapi-isearchcatalogmanager-getqueryhelper">ISearchCatalogManager::GetQueryHelper</a>. Implement this interface as a helper class to <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nn-searchapi-isearchcatalogmanager">ISearchCatalogManager</a>.
 * 
 * This interface facilitates the generation of SQL queries using Advanced Query Syntax (AQS) or Natural Query Syntax (NQS). Clients can submit the SQL query to the Window Search engine by using OLE DB or Microsoft ActiveX Data Objects (ADO).
 * 
 * 
 * <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nf-searchapi-isearchqueryhelper-generatesqlfromuserquery">ISearchQueryHelper::GenerateSQLFromUserQuery</a> uses regional locale settings. However, <b>ISearchQueryHelper</b> does not use the regional locale settings. As a result, there are inconsistencies in the SQL returned from <b>ISearchQueryHelper::GenerateSQLFromUserQuery</b> and <b>ISearchQueryHelper</b> for region specific settings such as date formats, for example.
 * 
 * For a sample that demonstrates how to create a class for a static console application to query Windows Search using the Microsoft.Search.Interop assembly for <b>ISearchQueryHelper</b>, see the [DSearch](https://github.com/microsoft/Windows-classic-samples/tree/master/Samples/Win7Samples/winui/WindowsSearch/DSearch) sample.
 * @see https://learn.microsoft.com/windows/win32/api//content/searchapi/nn-searchapi-isearchqueryhelper
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
     * @remarks
     * A connection string is a string version of the initialization properties needed to connect to a data store. The string can include such things as a data source, data source name, or user ID and password.
     * 
     * Checkout the <a href="https://docs.microsoft.com/windows/win32/search/-search-sample-dsearch">DSearch code sample</a> to see how to create a class for a static console application to query Windows Search using the Microsoft.Search.Interop assembly for <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nn-searchapi-isearchqueryhelper">ISearchQueryHelper</a>.
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * Receives a pointer to a null-terminated Unicode string that is a valid OLE DB connection string. This connection string can be used to initialize a connection to the Windows Search index and submit the SQL query returned by  <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nf-searchapi-isearchqueryhelper-generatesqlfromuserquery">ISearchQueryHelper::GenerateSQLFromUserQuery</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/searchapi/nf-searchapi-isearchqueryhelper-get_connectionstring
     */
    get_ConnectionString() {
        result := ComCall(3, this, "ptr*", &pszConnectionString := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pszConnectionString
    }

    /**
     * Sets the language code identifier (LCID) of the query.
     * @remarks
     * The locale identifier has the components necessary to uniquely identify one of the installed system-defined locales. The LCID controls a number of settings including numeric format, date format, currency format, uppercase and lowercase mapping, dictionary sort ordering, tokenization, and others. Although these settings help Windows operating system and Windows Search API provide excellent localized support, unexpected results can occur when documents from one locale are searched by a system set for another locale.
     * 
     * When the <a href="https://docs.microsoft.com/windows/desktop/api/filter/nn-filter-ifilter">IFilter</a> object processes a document's text properties and content, it reports the language of that document to the content indexer. Using this information, the Search API can apply the appropriate word breaker and noise-words list.
     * 
     * The locale is used for word breaking, normalizing, and stemming the string values that are extracted from the query string. If this method is not used (so the content locale is not set), <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nf-searchapi-isearchqueryhelper-get_querycontentlocale">ISearchQueryHelper::get_QueryContentLocale</a> returns the active input locale.
     * 
     * Checkout the <a href="https://docs.microsoft.com/windows/win32/search/-search-sample-dsearch">DSearch code sample</a> to see how to create a class for a static console application to query Windows Search using the Microsoft.Search.Interop assembly for <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nn-searchapi-isearchqueryhelper">ISearchQueryHelper</a>.
     * @param {Integer} lcid Type: <b>LCID</b>
     * 
     * Sets the LCID of the query.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/searchapi/nf-searchapi-isearchqueryhelper-put_querycontentlocale
     */
    put_QueryContentLocale(lcid) {
        result := ComCall(4, this, "uint", lcid, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets the language code identifier (LCID) for the query.
     * @remarks
     * The locale identifier has the components necessary to uniquely identify one of the installed system-defined locales. The locale retrieved is used for word breaking, normalizing, and stemming the string values extracted from the query string. If the locale identifier was not set with <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nf-searchapi-isearchqueryhelper-put_querycontentlocale">ISearchQueryHelper::put_QueryContentLocale</a>, the active input locale is retrieved.
     * 
     * Checkout the <a href="https://docs.microsoft.com/windows/win32/search/-search-sample-dsearch">DSearch code sample</a> to see how to create a class for a static console application to query Windows Search using the Microsoft.Search.Interop assembly for <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nn-searchapi-isearchqueryhelper">ISearchQueryHelper</a>.
     * @returns {Integer} Type: <b>LCID*</b>
     * 
     * Receives a pointer to the locale identifier used.
     * @see https://learn.microsoft.com/windows/win32/api//content/searchapi/nf-searchapi-isearchqueryhelper-get_querycontentlocale
     */
    get_QueryContentLocale() {
        result := ComCall(5, this, "uint*", &plcid := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return plcid
    }

    /**
     * Sets the language code identifier (LCID) for the locale to use when parsing Advanced Query Syntax (AQS) keywords.
     * @remarks
     * Checkout the <a href="https://docs.microsoft.com/windows/win32/search/-search-sample-dsearch">DSearch code sample</a> to see how to create a class for a static console application to query Windows Search using the Microsoft.Search.Interop assembly for <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nn-searchapi-isearchqueryhelper">ISearchQueryHelper</a>.
     * @param {Integer} lcid Type: <b>LCID</b>
     * 
     * Sets the LCID for the locale to use when parsing Advanced Query Syntax (AQS) keywords.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/searchapi/nf-searchapi-isearchqueryhelper-put_querykeywordlocale
     */
    put_QueryKeywordLocale(lcid) {
        result := ComCall(6, this, "uint", lcid, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets the language code identifier (LCID) for the locale to use when parsing Advanced Query Syntax (AQS) keywords.
     * @remarks
     * Checkout the <a href="https://docs.microsoft.com/windows/win32/search/-search-sample-dsearch">DSearch code sample</a> to see how to create a class for a static console application to query Windows Search using the Microsoft.Search.Interop assembly for <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nn-searchapi-isearchqueryhelper">ISearchQueryHelper</a>.
     * @returns {Integer} Type: <b>LCID*</b>
     * 
     * Receives a pointer to the LCID for the locale to use when parsing Advanced Query Syntax (AQS) keywords.
     * @see https://learn.microsoft.com/windows/win32/api//content/searchapi/nf-searchapi-isearchqueryhelper-get_querykeywordlocale
     */
    get_QueryKeywordLocale() {
        result := ComCall(7, this, "uint*", &plcid := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return plcid
    }

    /**
     * Sets a value that specifies how query terms are to be expanded.
     * @remarks
     * The <b>ISearchQueryHelper::put_QueryTermExpansion</b> method allows for expansion of some query terms with wildcard characters, similar to regular expression expansion. 
     * 
     * While the <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/ne-searchapi-search_term_expansion">SEARCH_TERM_EXPANSION</a> enumerated type lets you specify stem expansion, Windows Search does not currently support its use with the <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nn-searchapi-isearchqueryhelper">ISearchQueryHelper</a> interface.
     * 
     * Checkout the <a href="https://docs.microsoft.com/windows/win32/search/-search-sample-dsearch">DSearch code sample</a> to see how to create a class for a static console application to query Windows Search using the Microsoft.Search.Interop assembly for <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nn-searchapi-isearchqueryhelper">ISearchQueryHelper</a>.
     * @param {Integer} expandTerms Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/searchapi/ne-searchapi-search_term_expansion">SEARCH_TERM_EXPANSION</a></b>
     * 
     * Value from the <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/ne-searchapi-search_term_expansion">SEARCH_TERM_EXPANSION</a> enumeration that specifies the search term expansion. If not set, the default value is SEARCH_TERM_PREFIX_ALL.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/searchapi/nf-searchapi-isearchqueryhelper-put_querytermexpansion
     */
    put_QueryTermExpansion(expandTerms) {
        result := ComCall(8, this, "int", expandTerms, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets the value that specifies how query terms are to be expanded.
     * @remarks
     * While the <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/ne-searchapi-search_term_expansion">SEARCH_TERM_EXPANSION</a> enumerated type lets you specify stem expansion, Windows Search does not currently support its use with the <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nn-searchapi-isearchqueryhelper">ISearchQueryHelper</a> interface.
     * 
     * Checkout the <a href="https://docs.microsoft.com/windows/win32/search/-search-sample-dsearch">DSearch code sample</a> to see how to create a class for a static console application to query Windows Search using the Microsoft.Search.Interop assembly for <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nn-searchapi-isearchqueryhelper">ISearchQueryHelper</a>.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/searchapi/ne-searchapi-search_term_expansion">SEARCH_TERM_EXPANSION</a>*</b>
     * 
     * Receives a pointer to a value from the <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/ne-searchapi-search_term_expansion">SEARCH_TERM_EXPANSION</a> enumeration that specifies the query term expansion.
     * @see https://learn.microsoft.com/windows/win32/api//content/searchapi/nf-searchapi-isearchqueryhelper-get_querytermexpansion
     */
    get_QueryTermExpansion() {
        result := ComCall(9, this, "int*", &pExpandTerms := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pExpandTerms
    }

    /**
     * Sets the syntax of the query.
     * @remarks
     * The allowed syntaxes are Simple, Natural Query Syntax (NQS), and Advanced Query Syntax (AQS). If not set, the default query syntax is SEARCH_ADVANCED_QUERY_SYNTAX.
     * 
     * Checkout the <a href="https://docs.microsoft.com/windows/win32/search/-search-sample-dsearch">DSearch code sample</a> to see how to create a class for a static console application to query Windows Search using the Microsoft.Search.Interop assembly for <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nn-searchapi-isearchqueryhelper">ISearchQueryHelper</a>.
     * @param {Integer} querySyntax Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/searchapi/ne-searchapi-search_query_syntax">SEARCH_QUERY_SYNTAX</a></b>
     * 
     * Flag that specifies the search query syntax. For a list of possible values, see the description of the <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/ne-searchapi-search_query_syntax">SEARCH_QUERY_SYNTAX</a> enumerated type.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/searchapi/nf-searchapi-isearchqueryhelper-put_querysyntax
     */
    put_QuerySyntax(querySyntax) {
        result := ComCall(10, this, "int", querySyntax, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets the syntax of the query.
     * @remarks
     * The allowed syntaxes are Simple, Natural Query Syntax (NQS), and Advanced Query Syntax (AQS). If not set, the default query syntax is SEARCH_ADVANCED_QUERY_SYNTAX.
     * 
     * Checkout the <a href="https://docs.microsoft.com/windows/win32/search/-search-sample-dsearch">DSearch code sample</a> to see how to create a class for a static console application to query Windows Search using the Microsoft.Search.Interop assembly for <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nn-searchapi-isearchqueryhelper">ISearchQueryHelper</a>.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/searchapi/ne-searchapi-search_query_syntax">SEARCH_QUERY_SYNTAX</a>*</b>
     * 
     * Receives a pointer to a value from the <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/ne-searchapi-search_query_syntax">SEARCH_QUERY_SYNTAX</a> enumeration.
     * @see https://learn.microsoft.com/windows/win32/api//content/searchapi/nf-searchapi-isearchqueryhelper-get_querysyntax
     */
    get_QuerySyntax() {
        result := ComCall(11, this, "int*", &pQuerySyntax := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pQuerySyntax
    }

    /**
     * Sets the properties to include in the query if search terms do not explicitly specify properties.
     * @remarks
     * Search terms may or may not be explicitly prefixed by a property ("author:Irina" or just "Irina"). If <i>SEARCH_ADVANCED_QUERY_SYNTAX</i> or <i>NO_QUERY_SYNTAX</i> is set in <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nf-searchapi-isearchqueryhelper-put_querysyntax">ISearchQueryHelper::put_QuerySyntax</a>, all search terms not prefixed by a property keyword are matched against the list of properties in <i>ppszContentProperties</i>.
     * 
     * Checkout the <a href="https://docs.microsoft.com/windows/win32/search/-search-sample-dsearch">DSearch code sample</a> to see how to create a class for a static console application to query Windows Search using the Microsoft.Search.Interop assembly for <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nn-searchapi-isearchqueryhelper">ISearchQueryHelper</a>.
     * @param {PWSTR} pszContentProperties Type: <b>LPCWSTR</b>
     * 
     * Pointer to a comma-delimited, null-terminated Unicode string of one or more properties. Separate column specifiers with commas: "Content,DocAuthor".
     *          
     * 
     * Set <i>ppszContentProperties</i> to <b>NULL</b> to use all properties.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/searchapi/nf-searchapi-isearchqueryhelper-put_querycontentproperties
     */
    put_QueryContentProperties(pszContentProperties) {
        pszContentProperties := pszContentProperties is String ? StrPtr(pszContentProperties) : pszContentProperties

        result := ComCall(12, this, "ptr", pszContentProperties, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets the list of properties included in the query when search terms do not explicitly specify a property.
     * @remarks
     * Search terms may or may not be explicitly prefixed by a property ("author:Irina" or just "Irina"). If <i>SEARCH_ADVANCED_QUERY_SYNTAX</i> or <i>NO_QUERY_SYNTAX</i> is set in <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nf-searchapi-isearchqueryhelper-put_querysyntax">ISearchQueryHelper::put_QuerySyntax</a>, all search terms not prefixed by a property keyword are matched against the list of properties in <i>ppszContentProperties</i>.
     * 
     * Checkout the <a href="https://docs.microsoft.com/windows/win32/search/-search-sample-dsearch">DSearch code sample</a> to see how to create a class for a static console application to query Windows Search using the Microsoft.Search.Interop assembly for <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nn-searchapi-isearchqueryhelper">ISearchQueryHelper</a>.
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * Receives a pointer to a comma-delimited, null-terminated Unicode string of content properties to search. If <i>ppszContentProperties</i> is <b>NULL</b>,  all properties are searched.
     * @see https://learn.microsoft.com/windows/win32/api//content/searchapi/nf-searchapi-isearchqueryhelper-get_querycontentproperties
     */
    get_QueryContentProperties() {
        result := ComCall(13, this, "ptr*", &ppszContentProperties := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppszContentProperties
    }

    /**
     * Sets the columns (or properties) requested in the select statement.
     * @remarks
     * No defined and fixed set of properties applies to all documents. For this reason, the SQL asterisk is not permitted in the &lt;columns&gt; setting. For a list of valis Shell system properties, refer to <a href="https://msdn.microsoft.com/library/bb763010(VS.85).aspx">System Properties</a>.
     * 
     * Checkout the <a href="https://docs.microsoft.com/windows/win32/search/-search-sample-dsearch">DSearch code sample</a> to see how to create a class for a static console application to query Windows Search using the Microsoft.Search.Interop assembly for <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nn-searchapi-isearchqueryhelper">ISearchQueryHelper</a>.
     * @param {PWSTR} pszSelectColumns Type: <b>LPCWSTR</b>
     * 
     * Pointer to a comma-delimited, null-terminated Unicode string that specifies one or more columns in the property store. Separate multiple column specifiers with commas: "System.Document.Author,System.Document.Title".
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/searchapi/nf-searchapi-isearchqueryhelper-put_queryselectcolumns
     */
    put_QuerySelectColumns(pszSelectColumns) {
        pszSelectColumns := pszSelectColumns is String ? StrPtr(pszSelectColumns) : pszSelectColumns

        result := ComCall(14, this, "ptr", pszSelectColumns, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets the columns (or properties) requested in the SELECT statement of the query.
     * @remarks
     * Items are represented in the property store as a row. Each row contains a number of columns that represent properties for that row or object. Not all items will have a value for a particular property. Properties must be in the property store to be subject to a select operation.
     * 
     * Checkout the <a href="https://docs.microsoft.com/windows/win32/search/-search-sample-dsearch">DSearch code sample</a> to see how to create a class for a static console application to query Windows Search using the Microsoft.Search.Interop assembly for <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nn-searchapi-isearchqueryhelper">ISearchQueryHelper</a>.
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * Receives a pointer to a comma-delimited, null-terminated Unicode string that specifies the columns (or properties) to be returned from a query.
     * @see https://learn.microsoft.com/windows/win32/api//content/searchapi/nf-searchapi-isearchqueryhelper-get_queryselectcolumns
     */
    get_QuerySelectColumns() {
        result := ComCall(15, this, "ptr*", &ppszSelectColumns := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppszSelectColumns
    }

    /**
     * Sets the restrictions appended to a query in WHERE clauses.
     * @remarks
     * <i>pszRestrictions</i> must be a valid WHERE clause for Windows Search SQL (without the WHERE keyword).
     * 
     * When you create <i>pszRestrictions</i> with multiple restrictions, additional "WHERE" clauses concatenated to the first must start with "AND" or "OR". For example: "and contains(*, 'qqq')"
     * 
     * Checkout the <a href="https://docs.microsoft.com/windows/win32/search/-search-sample-dsearch">DSearch code sample</a> to see how to create a class for a static console application to query Windows Search using the Microsoft.Search.Interop assembly for <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nn-searchapi-isearchqueryhelper">ISearchQueryHelper</a>.
     * @param {PWSTR} pszRestrictions Type: <b>LPCWSTR</b>
     * 
     * Pointer to a comma-delimited null-terminated Unicode string that specifies one or more query restrictions appended to the query in generated WHERE clause.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/searchapi/nf-searchapi-isearchqueryhelper-put_querywhererestrictions
     */
    put_QueryWhereRestrictions(pszRestrictions) {
        pszRestrictions := pszRestrictions is String ? StrPtr(pszRestrictions) : pszRestrictions

        result := ComCall(16, this, "ptr", pszRestrictions, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets the restrictions appended to a query in WHERE clauses.
     * @remarks
     * Checkout the <a href="https://docs.microsoft.com/windows/win32/search/-search-sample-dsearch">DSearch code sample</a> to see how to create a class for a static console application to query Windows Search using the Microsoft.Search.Interop assembly for <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nn-searchapi-isearchqueryhelper">ISearchQueryHelper</a>.
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * Receives a pointer to a comma-delimited null-terminated Unicode string that specifies one or more restrictions appended to a query by WHERE clauses.
     * @see https://learn.microsoft.com/windows/win32/api//content/searchapi/nf-searchapi-isearchqueryhelper-get_querywhererestrictions
     */
    get_QueryWhereRestrictions() {
        result := ComCall(17, this, "ptr*", &ppszRestrictions := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppszRestrictions
    }

    /**
     * Sets the sort order for the query result set.
     * @remarks
     * <i>ppszSorting</i> must be a valid ORDER BY clause (without the ORDER BY keyword). <a href="https://docs.microsoft.com/windows/desktop/search/-search-sql-ovwofsearchquery">Windows Search SQL</a> supports sorting on multiple properties, in either ascending (ASC) or descending (DESC) order on each property. For example, <i>ppszSorting</i> might contain the following:
     * 
     * <c>System.ItemAuthors ASC, System.ItemDate DESC</c>
     * 
     * Checkout the <a href="https://docs.microsoft.com/windows/win32/search/-search-sample-dsearch">DSearch code sample</a> to see how to create a class for a static console application to query Windows Search using the Microsoft.Search.Interop assembly for <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nn-searchapi-isearchqueryhelper">ISearchQueryHelper</a>.
     * @param {PWSTR} pszSorting Type: <b>LPCWSTR</b>
     * 
     * A comma-delimited, null-terminated Unicode string that specifies the sort order.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/searchapi/nf-searchapi-isearchqueryhelper-put_querysorting
     */
    put_QuerySorting(pszSorting) {
        pszSorting := pszSorting is String ? StrPtr(pszSorting) : pszSorting

        result := ComCall(18, this, "ptr", pszSorting, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets the sort order for the query result set.
     * @remarks
     * <a href="https://docs.microsoft.com/windows/desktop/search/-search-sql-ovwofsearchquery">Windows Search SQL</a> supports sorting on multiple properties, in either ascending (ASC) or descending (DESC) order on each property. For example, the value pointed to by <i>ppszSorting</i> might contain the following:
     * 
     * <c>System.ItemAuthors ASC, System.ItemDate DESC</c>
     * 
     * Checkout the <a href="https://docs.microsoft.com/windows/win32/search/-search-sample-dsearch">DSearch code sample</a> to see how to create a class for a static console application to query Windows Search using the Microsoft.Search.Interop assembly for <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nn-searchapi-isearchqueryhelper">ISearchQueryHelper</a>.
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * Receives a pointer to a comma-delimited, null-terminated Unicode string representing the sort order.
     * @see https://learn.microsoft.com/windows/win32/api//content/searchapi/nf-searchapi-isearchqueryhelper-get_querysorting
     */
    get_QuerySorting() {
        result := ComCall(19, this, "ptr*", &ppszSorting := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppszSorting
    }

    /**
     * Generates a Structured Query Language (SQL) query based on a client-supplied query string expressed in either Advanced Query Syntax (AQS) or Natural Query Syntax (NQS).
     * @remarks
     * This method generates SQL in the following form:
     * 
     * 
     * ``` syntax
     * SELECT &lt;QuerySelectColumns&gt; FROM &lt;CatalogName that created query helper&gt;
     *     WHERE &lt;Result of interpreting the User query passed into this function according to QuerySyntax&gt;
     *           [ AND|OR &lt;QueryWhereRestrictions&gt;]
     * ```
     * 
     * The SQL generation uses the settings specified in <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nf-searchapi-isearchqueryhelper-put_querytermexpansion">ISearchQueryHelper::put_QueryTermExpansion</a>, <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nf-searchapi-isearchqueryhelper-put_querycontentproperties">ISearchQueryHelper::put_QueryContentProperties</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nf-searchapi-isearchqueryhelper-put_querycontentlocale">ISearchQueryHelper::put_QueryContentLocale</a>.
     * 
     * <b>ISearchQueryHelper::GenerateSQLFromUserQuery</b> uses regional locale settings. However, <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nn-searchapi-isearchqueryhelper">ISearchQueryHelper</a> does not use the regional locale settings. As a result, there are inconsistencies in the SQL returned from <b>ISearchQueryHelper::GenerateSQLFromUserQuery</b> and <b>ISearchQueryHelper</b> for region specific settings such as  date formats. For example, if you set the locale for date/time to something other than the system locale, such as en-CA if the system locale is en-US, and enter <c>Toybox -m -i "date:3/7/2008" -Y -s</c>, the SQL returned will differ. The SQL from <b>ISearchQueryHelper::GenerateSQLFromUserQuery</b> will have parsed 3/7/2008 according to en-CA (seeking items dated 3rd of July, 2008) while the SQL from <b>ISearchQueryHelper</b> will have parsed 3/7/2008 according to en-US (seeking items dated 7th of March, 2008).
     * 
     * Checkout the <a href="https://docs.microsoft.com/windows/win32/search/-search-sample-dsearch">DSearch code sample</a> to see how to create a class for a static console application to query Windows Search using the Microsoft.Search.Interop assembly for <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nn-searchapi-isearchqueryhelper">ISearchQueryHelper</a>.
     * @param {PWSTR} pszQuery Type: <b>LPCWSTR</b>
     * 
     * A pointer to a null-terminated Unicode string containing a query in AQS or NQS.
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * Receives the address of a pointer to a SQL query string based on the query in the <i>pszQuery</i> parameter.
     * @see https://learn.microsoft.com/windows/win32/api//content/searchapi/nf-searchapi-isearchqueryhelper-generatesqlfromuserquery
     */
    GenerateSQLFromUserQuery(pszQuery) {
        pszQuery := pszQuery is String ? StrPtr(pszQuery) : pszQuery

        result := ComCall(20, this, "ptr", pszQuery, "ptr*", &ppszSQL := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppszSQL
    }

    /**
     * Not implemented. (ISearchQueryHelper.WriteProperties)
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
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/searchapi/nf-searchapi-isearchqueryhelper-writeproperties
     */
    WriteProperties(itemID, dwNumberOfColumns, pColumns, pValues, pftGatherModifiedTime) {
        result := ComCall(21, this, "int", itemID, "uint", dwNumberOfColumns, "ptr", pColumns, "ptr", pValues, "ptr", pftGatherModifiedTime, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets the maximum number of results to be returned by a query.
     * @remarks
     * Checkout the <a href="https://docs.microsoft.com/windows/win32/search/-search-sample-dsearch">DSearch code sample</a> to see how to create a class for a static console application to query Windows Search using the Microsoft.Search.Interop assembly for <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nn-searchapi-isearchqueryhelper">ISearchQueryHelper</a>.
     * @param {Integer} cMaxResults Type: <b>LONG</b>
     * 
     * The maximum number of results to be returned. Negative numbers return all results.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/searchapi/nf-searchapi-isearchqueryhelper-put_querymaxresults
     */
    put_QueryMaxResults(cMaxResults) {
        result := ComCall(22, this, "int", cMaxResults, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets the maximum number of results to be returned by the query.
     * @remarks
     * Checkout the <a href="https://docs.microsoft.com/windows/win32/search/-search-sample-dsearch">DSearch code sample</a> to see how to create a class for a static console application to query Windows Search using the Microsoft.Search.Interop assembly for <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nn-searchapi-isearchqueryhelper">ISearchQueryHelper</a>.
     * @returns {Integer} Type: <b>LONG*</b>
     * 
     * Receives a pointer to the maximum number of results to be returned by the query. Negative numbers return all results.
     * @see https://learn.microsoft.com/windows/win32/api//content/searchapi/nf-searchapi-isearchqueryhelper-get_querymaxresults
     */
    get_QueryMaxResults() {
        result := ComCall(23, this, "int*", &pcMaxResults := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pcMaxResults
    }
}
