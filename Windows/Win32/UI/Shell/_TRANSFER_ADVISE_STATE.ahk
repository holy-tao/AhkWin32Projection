#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class _TRANSFER_ADVISE_STATE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static TS_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static TS_PERFORMING => 1

    /**
     * @type {Integer (Int32)}
     */
    static TS_PREPARING => 2

    /**
     * @type {Integer (Int32)}
     */
    static TS_INDETERMINATE => 4
}
