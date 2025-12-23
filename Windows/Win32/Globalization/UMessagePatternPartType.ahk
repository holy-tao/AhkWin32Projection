#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class UMessagePatternPartType extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static UMSGPAT_PART_TYPE_MSG_START => 0

    /**
     * @type {Integer (Int32)}
     */
    static UMSGPAT_PART_TYPE_MSG_LIMIT => 1

    /**
     * @type {Integer (Int32)}
     */
    static UMSGPAT_PART_TYPE_SKIP_SYNTAX => 2

    /**
     * @type {Integer (Int32)}
     */
    static UMSGPAT_PART_TYPE_INSERT_CHAR => 3

    /**
     * @type {Integer (Int32)}
     */
    static UMSGPAT_PART_TYPE_REPLACE_NUMBER => 4

    /**
     * @type {Integer (Int32)}
     */
    static UMSGPAT_PART_TYPE_ARG_START => 5

    /**
     * @type {Integer (Int32)}
     */
    static UMSGPAT_PART_TYPE_ARG_LIMIT => 6

    /**
     * @type {Integer (Int32)}
     */
    static UMSGPAT_PART_TYPE_ARG_NUMBER => 7

    /**
     * @type {Integer (Int32)}
     */
    static UMSGPAT_PART_TYPE_ARG_NAME => 8

    /**
     * @type {Integer (Int32)}
     */
    static UMSGPAT_PART_TYPE_ARG_TYPE => 9

    /**
     * @type {Integer (Int32)}
     */
    static UMSGPAT_PART_TYPE_ARG_STYLE => 10

    /**
     * @type {Integer (Int32)}
     */
    static UMSGPAT_PART_TYPE_ARG_SELECTOR => 11

    /**
     * @type {Integer (Int32)}
     */
    static UMSGPAT_PART_TYPE_ARG_INT => 12

    /**
     * @type {Integer (Int32)}
     */
    static UMSGPAT_PART_TYPE_ARG_DOUBLE => 13
}
