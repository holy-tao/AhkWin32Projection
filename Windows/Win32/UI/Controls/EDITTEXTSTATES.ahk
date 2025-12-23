#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class EDITTEXTSTATES extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static ETS_NORMAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static ETS_HOT => 2

    /**
     * @type {Integer (Int32)}
     */
    static ETS_SELECTED => 3

    /**
     * @type {Integer (Int32)}
     */
    static ETS_DISABLED => 4

    /**
     * @type {Integer (Int32)}
     */
    static ETS_FOCUSED => 5

    /**
     * @type {Integer (Int32)}
     */
    static ETS_READONLY => 6

    /**
     * @type {Integer (Int32)}
     */
    static ETS_ASSIST => 7

    /**
     * @type {Integer (Int32)}
     */
    static ETS_CUEBANNER => 8
}
