#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class URL_PART extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static URL_PART_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static URL_PART_SCHEME => 1

    /**
     * @type {Integer (Int32)}
     */
    static URL_PART_HOSTNAME => 2

    /**
     * @type {Integer (Int32)}
     */
    static URL_PART_USERNAME => 3

    /**
     * @type {Integer (Int32)}
     */
    static URL_PART_PASSWORD => 4

    /**
     * @type {Integer (Int32)}
     */
    static URL_PART_PORT => 5

    /**
     * @type {Integer (Int32)}
     */
    static URL_PART_QUERY => 6
}
