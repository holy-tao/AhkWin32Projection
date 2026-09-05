#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 */
class URL_PART extends Win32Enum {

    /**
     * Native name: URL_PART_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Native name: URL_PART_SCHEME
     * @type {Integer (Int32)}
     */
    static SCHEME => 1

    /**
     * Native name: URL_PART_HOSTNAME
     * @type {Integer (Int32)}
     */
    static HOSTNAME => 2

    /**
     * Native name: URL_PART_USERNAME
     * @type {Integer (Int32)}
     */
    static USERNAME => 3

    /**
     * Native name: URL_PART_PASSWORD
     * @type {Integer (Int32)}
     */
    static PASSWORD => 4

    /**
     * Native name: URL_PART_PORT
     * @type {Integer (Int32)}
     */
    static PORT => 5

    /**
     * Native name: URL_PART_QUERY
     * @type {Integer (Int32)}
     */
    static QUERY => 6
}
