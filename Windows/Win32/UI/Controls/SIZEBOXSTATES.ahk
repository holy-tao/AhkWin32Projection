#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class SIZEBOXSTATES extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SZB_RIGHTALIGN => 1

    /**
     * @type {Integer (Int32)}
     */
    static SZB_LEFTALIGN => 2

    /**
     * @type {Integer (Int32)}
     */
    static SZB_TOPRIGHTALIGN => 3

    /**
     * @type {Integer (Int32)}
     */
    static SZB_TOPLEFTALIGN => 4

    /**
     * @type {Integer (Int32)}
     */
    static SZB_HALFBOTTOMRIGHTALIGN => 5

    /**
     * @type {Integer (Int32)}
     */
    static SZB_HALFBOTTOMLEFTALIGN => 6

    /**
     * @type {Integer (Int32)}
     */
    static SZB_HALFTOPRIGHTALIGN => 7

    /**
     * @type {Integer (Int32)}
     */
    static SZB_HALFTOPLEFTALIGN => 8
}
