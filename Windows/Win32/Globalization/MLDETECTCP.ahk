#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 */
class MLDETECTCP extends Win32Enum {

    /**
     * Native name: MLDETECTCP_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Native name: MLDETECTCP_7BIT
     * @type {Integer (Int32)}
     */
    static 7BIT => 1

    /**
     * Native name: MLDETECTCP_8BIT
     * @type {Integer (Int32)}
     */
    static 8BIT => 2

    /**
     * Native name: MLDETECTCP_DBCS
     * @type {Integer (Int32)}
     */
    static DBCS => 4

    /**
     * Native name: MLDETECTCP_HTML
     * @type {Integer (Int32)}
     */
    static HTML => 8

    /**
     * Native name: MLDETECTCP_NUMBER
     * @type {Integer (Int32)}
     */
    static NUMBER => 16
}
