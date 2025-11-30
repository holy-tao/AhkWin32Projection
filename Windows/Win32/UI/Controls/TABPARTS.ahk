#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class TABPARTS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static TABP_TABITEM => 1

    /**
     * @type {Integer (Int32)}
     */
    static TABP_TABITEMLEFTEDGE => 2

    /**
     * @type {Integer (Int32)}
     */
    static TABP_TABITEMRIGHTEDGE => 3

    /**
     * @type {Integer (Int32)}
     */
    static TABP_TABITEMBOTHEDGE => 4

    /**
     * @type {Integer (Int32)}
     */
    static TABP_TOPTABITEM => 5

    /**
     * @type {Integer (Int32)}
     */
    static TABP_TOPTABITEMLEFTEDGE => 6

    /**
     * @type {Integer (Int32)}
     */
    static TABP_TOPTABITEMRIGHTEDGE => 7

    /**
     * @type {Integer (Int32)}
     */
    static TABP_TOPTABITEMBOTHEDGE => 8

    /**
     * @type {Integer (Int32)}
     */
    static TABP_PANE => 9

    /**
     * @type {Integer (Int32)}
     */
    static TABP_BODY => 10

    /**
     * @type {Integer (Int32)}
     */
    static TABP_AEROWIZARDBODY => 11
}
