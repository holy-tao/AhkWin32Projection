#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Used by IQueryParserManager::SetOption to set parsing options. This can be used to specify schemas and localization options.
 * @see https://docs.microsoft.com/windows/win32/api//structuredquery/ne-structuredquery-query_parser_manager_option
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class QUERY_PARSER_MANAGER_OPTION extends Win32Enum{

    /**
     * A <b>VT_LPWSTR</b> containing the name of the file that contains the schema binary. The default value is <b>StructuredQuerySchema.bin</b> for the SystemIndex catalog and <b>StructuredQuerySchemaTrivial.bin</b> for the trivial catalog.
     * @type {Integer (Int32)}
     */
    static QPMO_SCHEMA_BINARY_NAME => 0

    /**
     * Either a <b>VT_BOOL</b> or a <b>VT_LPWSTR</b>. If the value is a <b>VT_BOOL</b> and is <b>FALSE</b>, a pre-localized schema will not be used. If the value is a <b>VT_BOOL</b> and is <b>TRUE</b>, <a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/nn-structuredquery-iqueryparsermanager">IQueryParserManager</a> will use the pre-localized schema binary in "<c>%ALLUSERSPROFILE%\Microsoft\Windows</c>". If the value is a <b>VT_LPWSTR</b>, the value should contain the full path of the folder in which the pre-localized schema binary can be found. The default value is <b>VT_BOOL</b> with <b>TRUE</b>.
     * @type {Integer (Int32)}
     */
    static QPMO_PRELOCALIZED_SCHEMA_BINARY_PATH => 1

    /**
     * A <b>VT_LPWSTR</b> containing the full path to the folder that contains the unlocalized schema binary. The default value is "<c>%SYSTEMROOT%\System32</c>".
     * @type {Integer (Int32)}
     */
    static QPMO_UNLOCALIZED_SCHEMA_BINARY_PATH => 2

    /**
     * A <b>VT_LPWSTR</b> containing the full path to the folder that contains the localized schema binary that can be read and written to as needed. The default value is "<c>%LOCALAPPDATA%\Microsoft\Windows</c>".
     * @type {Integer (Int32)}
     */
    static QPMO_LOCALIZED_SCHEMA_BINARY_PATH => 3

    /**
     * A <b>VT_BOOL</b>.  If <b>TRUE</b>, then the paths for pre-localized and localized binaries have "<c>\(LCID)</c>" appended to them, where LCID is the decimal locale ID for the localized language. The default is <b>TRUE</b>.
     * @type {Integer (Int32)}
     */
    static QPMO_APPEND_LCID_TO_LOCALIZED_PATH => 4

    /**
     * A <b>VT_UNKNOWN</b> with an object supporting <a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/nn-structuredquery-ischemalocalizersupport">ISchemaLocalizerSupport</a>. This object will be used instead of the default localizer support object.
     * @type {Integer (Int32)}
     */
    static QPMO_LOCALIZER_SUPPORT => 5
}
