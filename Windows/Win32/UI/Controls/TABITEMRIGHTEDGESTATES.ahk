#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class TABITEMRIGHTEDGESTATES extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static TIRES_NORMAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static TIRES_HOT => 2

    /**
     * @type {Integer (Int32)}
     */
    static TIRES_SELECTED => 3

    /**
     * @type {Integer (Int32)}
     */
    static TIRES_DISABLED => 4

    /**
     * @type {Integer (Int32)}
     */
    static TIRES_FOCUSED => 5
}
