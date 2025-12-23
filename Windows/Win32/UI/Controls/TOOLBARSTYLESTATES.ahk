#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class TOOLBARSTYLESTATES extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static TS_NORMAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static TS_HOT => 2

    /**
     * @type {Integer (Int32)}
     */
    static TS_PRESSED => 3

    /**
     * @type {Integer (Int32)}
     */
    static TS_DISABLED => 4

    /**
     * @type {Integer (Int32)}
     */
    static TS_CHECKED => 5

    /**
     * @type {Integer (Int32)}
     */
    static TS_HOTCHECKED => 6

    /**
     * @type {Integer (Int32)}
     */
    static TS_NEARHOT => 7

    /**
     * @type {Integer (Int32)}
     */
    static TS_OTHERSIDEHOT => 8
}
