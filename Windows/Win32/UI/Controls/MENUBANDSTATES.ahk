#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class MENUBANDSTATES extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static MDS_NORMAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static MDS_HOT => 2

    /**
     * @type {Integer (Int32)}
     */
    static MDS_PRESSED => 3

    /**
     * @type {Integer (Int32)}
     */
    static MDS_DISABLED => 4

    /**
     * @type {Integer (Int32)}
     */
    static MDS_CHECKED => 5

    /**
     * @type {Integer (Int32)}
     */
    static MDS_HOTCHECKED => 6
}
