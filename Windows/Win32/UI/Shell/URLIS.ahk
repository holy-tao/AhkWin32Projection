#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 */
class URLIS extends Win32Enum {

    /**
     * Native name: URLIS_URL
     * @type {Integer (Int32)}
     */
    static URL => 0

    /**
     * Native name: URLIS_OPAQUE
     * @type {Integer (Int32)}
     */
    static OPAQUE => 1

    /**
     * Native name: URLIS_NOHISTORY
     * @type {Integer (Int32)}
     */
    static NOHISTORY => 2

    /**
     * Native name: URLIS_FILEURL
     * @type {Integer (Int32)}
     */
    static FILEURL => 3

    /**
     * Native name: URLIS_APPLIABLE
     * @type {Integer (Int32)}
     */
    static APPLIABLE => 4

    /**
     * Native name: URLIS_DIRECTORY
     * @type {Integer (Int32)}
     */
    static DIRECTORY => 5

    /**
     * Native name: URLIS_HASQUERY
     * @type {Integer (Int32)}
     */
    static HASQUERY => 6
}
