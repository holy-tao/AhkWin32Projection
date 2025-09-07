#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the type of query syntax. (STRUCTURED_QUERY_SYNTAX)
 * @remarks
 * Use this enumeration to set the desired SQSO_SYNTAX flag in <a href="https://docs.microsoft.com/windows/win32/api/structuredquery/ne-structuredquery-structured_query_single_option">STRUCTURED_QUERY_SINGLE_OPTION</a>, which is used with the methods <a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/nf-structuredquery-iqueryparser-setoption">IQueryParser::SetOption</a> and <a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/nf-structuredquery-iqueryparser-getoption">IQueryParser::GetOption</a>.
 * @see https://learn.microsoft.com/windows/win32/api/structuredquery/ne-structuredquery-structured_query_syntax
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class STRUCTURED_QUERY_SYNTAX{

    /**
     * No syntax.
     * @type {Integer (Int32)}
     */
    static SQS_NO_SYNTAX => 0

    /**
     * Specifies the Advanced Query Syntax. For example, "kind:email to:david to:bill".
     * @type {Integer (Int32)}
     */
    static SQS_ADVANCED_QUERY_SYNTAX => 1

    /**
     * Specifies the Natural Query Syntax. This syntax removes the requirement for a colon between properties and values, for example, "email from david to bill".
     * @type {Integer (Int32)}
     */
    static SQS_NATURAL_QUERY_SYNTAX => 2
}
