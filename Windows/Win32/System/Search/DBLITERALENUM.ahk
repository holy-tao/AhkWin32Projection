#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class DBLITERALENUM extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DBLITERAL_INVALID => 0

    /**
     * @type {Integer (Int32)}
     */
    static DBLITERAL_BINARY_LITERAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static DBLITERAL_CATALOG_NAME => 2

    /**
     * @type {Integer (Int32)}
     */
    static DBLITERAL_CATALOG_SEPARATOR => 3

    /**
     * @type {Integer (Int32)}
     */
    static DBLITERAL_CHAR_LITERAL => 4

    /**
     * @type {Integer (Int32)}
     */
    static DBLITERAL_COLUMN_ALIAS => 5

    /**
     * @type {Integer (Int32)}
     */
    static DBLITERAL_COLUMN_NAME => 6

    /**
     * @type {Integer (Int32)}
     */
    static DBLITERAL_CORRELATION_NAME => 7

    /**
     * @type {Integer (Int32)}
     */
    static DBLITERAL_CURSOR_NAME => 8

    /**
     * @type {Integer (Int32)}
     */
    static DBLITERAL_ESCAPE_PERCENT => 9

    /**
     * @type {Integer (Int32)}
     */
    static DBLITERAL_ESCAPE_UNDERSCORE => 10

    /**
     * @type {Integer (Int32)}
     */
    static DBLITERAL_INDEX_NAME => 11

    /**
     * @type {Integer (Int32)}
     */
    static DBLITERAL_LIKE_PERCENT => 12

    /**
     * @type {Integer (Int32)}
     */
    static DBLITERAL_LIKE_UNDERSCORE => 13

    /**
     * @type {Integer (Int32)}
     */
    static DBLITERAL_PROCEDURE_NAME => 14

    /**
     * @type {Integer (Int32)}
     */
    static DBLITERAL_QUOTE => 15

    /**
     * @type {Integer (Int32)}
     */
    static DBLITERAL_SCHEMA_NAME => 16

    /**
     * @type {Integer (Int32)}
     */
    static DBLITERAL_TABLE_NAME => 17

    /**
     * @type {Integer (Int32)}
     */
    static DBLITERAL_TEXT_COMMAND => 18

    /**
     * @type {Integer (Int32)}
     */
    static DBLITERAL_USER_NAME => 19

    /**
     * @type {Integer (Int32)}
     */
    static DBLITERAL_VIEW_NAME => 20
}
