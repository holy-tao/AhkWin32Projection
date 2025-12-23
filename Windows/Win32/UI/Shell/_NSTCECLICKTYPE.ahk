#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class _NSTCECLICKTYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static NSTCECT_LBUTTON => 1

    /**
     * @type {Integer (Int32)}
     */
    static NSTCECT_MBUTTON => 2

    /**
     * @type {Integer (Int32)}
     */
    static NSTCECT_RBUTTON => 3

    /**
     * @type {Integer (Int32)}
     */
    static NSTCECT_BUTTON => 3

    /**
     * @type {Integer (Int32)}
     */
    static NSTCECT_DBLCLICK => 4
}
