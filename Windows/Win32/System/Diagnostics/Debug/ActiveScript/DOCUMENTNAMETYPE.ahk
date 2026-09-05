#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
class DOCUMENTNAMETYPE extends Win32Enum {

    /**
     * Native name: DOCUMENTNAMETYPE_APPNODE
     * @type {Integer (Int32)}
     */
    static APPNODE => 0

    /**
     * Native name: DOCUMENTNAMETYPE_TITLE
     * @type {Integer (Int32)}
     */
    static TITLE => 1

    /**
     * Native name: DOCUMENTNAMETYPE_FILE_TAIL
     * @type {Integer (Int32)}
     */
    static FILE_TAIL => 2

    /**
     * Native name: DOCUMENTNAMETYPE_URL
     * @type {Integer (Int32)}
     */
    static URL => 3

    /**
     * Native name: DOCUMENTNAMETYPE_UNIQUE_TITLE
     * @type {Integer (Int32)}
     */
    static UNIQUE_TITLE => 4

    /**
     * Native name: DOCUMENTNAMETYPE_SOURCE_MAP_URL
     * @type {Integer (Int32)}
     */
    static SOURCE_MAP_URL => 5
}
