#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ole
 */
class PROPBAG2_TYPE extends Win32Enum {

    /**
     * Native name: PROPBAG2_TYPE_UNDEFINED
     * @type {Integer (Int32)}
     */
    static UNDEFINED => 0

    /**
     * Native name: PROPBAG2_TYPE_DATA
     * @type {Integer (Int32)}
     */
    static DATA => 1

    /**
     * Native name: PROPBAG2_TYPE_URL
     * @type {Integer (Int32)}
     */
    static URL => 2

    /**
     * Native name: PROPBAG2_TYPE_OBJECT
     * @type {Integer (Int32)}
     */
    static OBJECT => 3

    /**
     * Native name: PROPBAG2_TYPE_STREAM
     * @type {Integer (Int32)}
     */
    static STREAM => 4

    /**
     * Native name: PROPBAG2_TYPE_STORAGE
     * @type {Integer (Int32)}
     */
    static STORAGE => 5

    /**
     * Native name: PROPBAG2_TYPE_MONIKER
     * @type {Integer (Int32)}
     */
    static MONIKER => 6
}
