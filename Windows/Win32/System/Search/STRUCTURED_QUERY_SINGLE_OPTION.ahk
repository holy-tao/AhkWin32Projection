#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * A set of flags to be used with IQueryParser::SetOption and IQueryParser::GetOption to indicate individual options.
 * @remarks
 * Windows 7 adds new constants that help refine query condition trees parsed by the <a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/nn-structuredquery-iqueryparser">IQueryParser</a> interface.
 * @see https://learn.microsoft.com/windows/win32/api/structuredquery/ne-structuredquery-structured_query_single_option
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class STRUCTURED_QUERY_SINGLE_OPTION extends Win32Enum{

    /**
     * The option value should be a <b>VT_LPWSTR</b> that is the path to a file containing a schema binary. It is set automatically when obtaining a query parser through <a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/nf-structuredquery-iqueryparsermanager-createloadedparser">IQueryParserManager::CreateLoadedParser</a>.
     * @type {Integer (Int32)}
     */
    static SQSO_SCHEMA => 0

    /**
     * The option value must be <b>VT_EMPTY</b> to use the default word breaker (current keyboard locale) or a <b>VT_UI4</b> that is a valid LCID. The LCID indicates the expected locale of content words in queries to be parsed and is used to choose a suitable word breaker for the query. <a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/nf-structuredquery-iqueryparser-parse">IQueryParser::Parse</a> will return an error unless you set either this option or <a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/ne-structuredquery-structured_query_single_option">SQSO_WORD_BREAKER</a>  before calling it.
     * @type {Integer (Int32)}
     */
    static SQSO_LOCALE_WORD_BREAKING => 1

    /**
     * When setting this option, the value should be a <b>VT_EMPTY</b> for using the default word breaker for the chosen locale, or a <b>VT_UNKNOWN</b> with an object supporting the <a href="https://docs.microsoft.com/windows/desktop/api/indexsrv/nn-indexsrv-iwordbreaker">IWordBreaker</a> interface. Retrieving the option always returns a <b>VT_UNKNOWN</b> with an object supporting the <b>IWordBreaker</b> interface, unless there is no suitable word breaker for the chosen locale, in which case <b>VT_EMPTY</b> is returned.
     * @type {Integer (Int32)}
     */
    static SQSO_WORD_BREAKER => 2

    /**
     * The option value should be a <b>VT_EMPTY</b> or a <b>VT_BOOL</b> with <b>VARIANT_TRUE</b> to allow both natural query syntax and advanced query syntax (the default) or a <b>VT_BOOL</b> with <b>VARIANT_FALSE</b> to allow only advanced query syntax. Retrieving the option always returns a <b>VT_BOOL</b>.
     * @type {Integer (Int32)}
     */
    static SQSO_NATURAL_SYNTAX => 3

    /**
     * The option value should be a <b>VT_BOOL</b> with <b>VARIANT_TRUE</b> to generate query expressions as if each word in the query had the wildcard character * appended to it (unless followed by punctuation other than a parenthesis), a <b>VT_BOOL</b> with <b>VARIANT_FALSE</b> to use the words as they are (the default), or a <b>VT_EMPTY</b>. In most cases, a word-wheeling application should set this option to <b>VARIANT_TRUE</b>. Retrieving the option always returns a <b>VT_BOOL</b>.
     * @type {Integer (Int32)}
     */
    static SQSO_AUTOMATIC_WILDCARD => 4

    /**
     * Reserved. The value should be <b>VT_EMPTY</b> (the default) or a <b>VT_I4</b>. Retrieving the option always returns a <b>VT_I4</b>.
     * @type {Integer (Int32)}
     */
    static SQSO_TRACE_LEVEL => 5

    /**
     * The option value must be a <b>VT_I4</b> that is a valid LANGID. The LANGID indicates the expected language of Structured Query keywords in queries to be parsed. It is set automatically when obtaining a query parser through <a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/nf-structuredquery-iqueryparsermanager-createloadedparser">IQueryParserManager::CreateLoadedParser</a>.
     * @type {Integer (Int32)}
     */
    static SQSO_LANGUAGE_KEYWORDS => 6

    /**
     * <b>Windows 7 and later.</b> The option value must be a <b>VT_UI4</b> that is a <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/ne-searchapi-search_query_syntax">SEARCH_QUERY_SYNTAX</a> value. The default is SQS_NATURAL_QUERY_SYNTAX.
     * @type {Integer (Int32)}
     */
    static SQSO_SYNTAX => 7

    /**
     * <b>Windows 7 and later.</b> The value must be a <b>VT_BLOB</b> that is a copy of a TIME_ZONE_INFORMATION structure. The default is the current time zone.
     * @type {Integer (Int32)}
     */
    static SQSO_TIME_ZONE => 8

    /**
     * <b>Windows 7 and later.</b> This setting decides what connector should be assumed between conditions when none is specified. The value must be a <b>VT_UI4</b> that is a CONDITION_TYPE. Only CT_AND_CONDITION and CT_OR_CONDITION are valid. It defaults to CT_AND_CONDITION.
     * @type {Integer (Int32)}
     */
    static SQSO_IMPLICIT_CONNECTOR => 9

    /**
     * <b>Windows 7 and later.</b> This setting decides whether there are special requirements on the case of connector keywords (such as AND or OR). The value must be a <b>VT_UI4</b> that is a CASE_REQUIREMENT value. It defaults to CASE_REQUIREMENT_UPPER_IF_AQS.
     * @type {Integer (Int32)}
     */
    static SQSO_CONNECTOR_CASE => 10
}
