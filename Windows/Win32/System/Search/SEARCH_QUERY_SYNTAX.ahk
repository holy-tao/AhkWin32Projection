#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the type of query syntax.
 * @remarks
 * 
 * This enumerated type is used by the <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nf-searchapi-isearchqueryhelper-get_querysyntax">ISearchQueryHelper::get_QuerySyntax</a> and <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nf-searchapi-isearchqueryhelper-put_querysyntax">ISearchQueryHelper::put_QuerySyntax</a> methods.
 * 
 * <div class="alert"><b>Note</b>   In Windows 7, the names are prefixed with SQS_ instead of SEARCH_.</div>
 * <div> </div>
 * 
 * @see https://docs.microsoft.com/windows/win32/api//searchapi/ne-searchapi-search_query_syntax
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class SEARCH_QUERY_SYNTAX extends Win32Enum{

    /**
     * No syntax.
     * @type {Integer (Int32)}
     */
    static SEARCH_NO_QUERY_SYNTAX => 0

    /**
     * Specifies the Advanced Query Syntax. For example, "kind:email to:david to:bill".
     * @type {Integer (Int32)}
     */
    static SEARCH_ADVANCED_QUERY_SYNTAX => 1

    /**
     * Specifies the Natural Query Syntax. This syntax removes the requirement for a colon between properties and values, for example, "email from david to bill".
     * @type {Integer (Int32)}
     */
    static SEARCH_NATURAL_QUERY_SYNTAX => 2
}
