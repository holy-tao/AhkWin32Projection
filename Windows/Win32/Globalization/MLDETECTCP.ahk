#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 */
class MLDETECTCP extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static MLDETECTCP_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static MLDETECTCP_7BIT => 1

    /**
     * @type {Integer (Int32)}
     */
    static MLDETECTCP_8BIT => 2

    /**
     * @type {Integer (Int32)}
     */
    static MLDETECTCP_DBCS => 4

    /**
     * @type {Integer (Int32)}
     */
    static MLDETECTCP_HTML => 8

    /**
     * @type {Integer (Int32)}
     */
    static MLDETECTCP_NUMBER => 16
}
