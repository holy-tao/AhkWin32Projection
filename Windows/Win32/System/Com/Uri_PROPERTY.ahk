#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class Uri_PROPERTY extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static Uri_PROPERTY_ABSOLUTE_URI => 0

    /**
     * @type {Integer (Int32)}
     */
    static Uri_PROPERTY_STRING_START => 0

    /**
     * @type {Integer (Int32)}
     */
    static Uri_PROPERTY_AUTHORITY => 1

    /**
     * @type {Integer (Int32)}
     */
    static Uri_PROPERTY_DISPLAY_URI => 2

    /**
     * @type {Integer (Int32)}
     */
    static Uri_PROPERTY_DOMAIN => 3

    /**
     * @type {Integer (Int32)}
     */
    static Uri_PROPERTY_EXTENSION => 4

    /**
     * @type {Integer (Int32)}
     */
    static Uri_PROPERTY_FRAGMENT => 5

    /**
     * @type {Integer (Int32)}
     */
    static Uri_PROPERTY_HOST => 6

    /**
     * @type {Integer (Int32)}
     */
    static Uri_PROPERTY_PASSWORD => 7

    /**
     * @type {Integer (Int32)}
     */
    static Uri_PROPERTY_PATH => 8

    /**
     * @type {Integer (Int32)}
     */
    static Uri_PROPERTY_PATH_AND_QUERY => 9

    /**
     * @type {Integer (Int32)}
     */
    static Uri_PROPERTY_QUERY => 10

    /**
     * @type {Integer (Int32)}
     */
    static Uri_PROPERTY_RAW_URI => 11

    /**
     * @type {Integer (Int32)}
     */
    static Uri_PROPERTY_SCHEME_NAME => 12

    /**
     * @type {Integer (Int32)}
     */
    static Uri_PROPERTY_USER_INFO => 13

    /**
     * @type {Integer (Int32)}
     */
    static Uri_PROPERTY_USER_NAME => 14

    /**
     * @type {Integer (Int32)}
     */
    static Uri_PROPERTY_STRING_LAST => 14

    /**
     * @type {Integer (Int32)}
     */
    static Uri_PROPERTY_HOST_TYPE => 15

    /**
     * @type {Integer (Int32)}
     */
    static Uri_PROPERTY_DWORD_START => 15

    /**
     * @type {Integer (Int32)}
     */
    static Uri_PROPERTY_PORT => 16

    /**
     * @type {Integer (Int32)}
     */
    static Uri_PROPERTY_SCHEME => 17

    /**
     * @type {Integer (Int32)}
     */
    static Uri_PROPERTY_ZONE => 18

    /**
     * @type {Integer (Int32)}
     */
    static Uri_PROPERTY_DWORD_LAST => 18
}
