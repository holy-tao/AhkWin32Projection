#Requires AutoHotkey v2.0.0 64-bit

/**
 * A set of flags to be used with IQuerySolution::GetErrors to identify parsing error(s). Each parsing error indicates that one or more tokens were ignored when parsing a query string.
 * @see https://learn.microsoft.com/windows/win32/api/structuredquery/ne-structuredquery-structured_query_parse_error
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class STRUCTURED_QUERY_PARSE_ERROR{

    /**
     * No error.
     * @type {Integer (Int32)}
     */
    static SQPE_NONE => 0

    /**
     * An extraneous <b>(</b>.
     * @type {Integer (Int32)}
     */
    static SQPE_EXTRA_OPENING_PARENTHESIS => 1

    /**
     * An extraneous <b>)</b>.
     * @type {Integer (Int32)}
     */
    static SQPE_EXTRA_CLOSING_PARENTHESIS => 2

    /**
     * An extraneous <b>NOT</b>, <b>&lt;</b>, <b>&gt;</b>, <b>=</b>, and so forth.
     * @type {Integer (Int32)}
     */
    static SQPE_IGNORED_MODIFIER => 3

    /**
     * An extraneous <b>AND</b> or <b>OR</b>.
     * @type {Integer (Int32)}
     */
    static SQPE_IGNORED_CONNECTOR => 4

    /**
     * A property or other keyword used in the wrong context.
     * @type {Integer (Int32)}
     */
    static SQPE_IGNORED_KEYWORD => 5

    /**
     * Any other parse error.
     * @type {Integer (Int32)}
     */
    static SQPE_UNHANDLED => 6
}
