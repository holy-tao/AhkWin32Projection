#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class TASKBARPARTS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static TBP_BACKGROUNDBOTTOM => 1

    /**
     * @type {Integer (Int32)}
     */
    static TBP_BACKGROUNDRIGHT => 2

    /**
     * @type {Integer (Int32)}
     */
    static TBP_BACKGROUNDTOP => 3

    /**
     * @type {Integer (Int32)}
     */
    static TBP_BACKGROUNDLEFT => 4

    /**
     * @type {Integer (Int32)}
     */
    static TBP_SIZINGBARBOTTOM => 5

    /**
     * @type {Integer (Int32)}
     */
    static TBP_SIZINGBARRIGHT => 6

    /**
     * @type {Integer (Int32)}
     */
    static TBP_SIZINGBARTOP => 7

    /**
     * @type {Integer (Int32)}
     */
    static TBP_SIZINGBARLEFT => 8
}
