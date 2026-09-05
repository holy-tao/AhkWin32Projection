#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleWritingMode extends Win32Enum {

    /**
     * Native name: styleWritingModeLrtb
     * @type {Integer (Int32)}
     */
    static Lrtb => 0

    /**
     * Native name: styleWritingModeTbrl
     * @type {Integer (Int32)}
     */
    static Tbrl => 1

    /**
     * Native name: styleWritingModeRltb
     * @type {Integer (Int32)}
     */
    static Rltb => 2

    /**
     * Native name: styleWritingModeBtrl
     * @type {Integer (Int32)}
     */
    static Btrl => 3

    /**
     * Native name: styleWritingModeNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => 4

    /**
     * Native name: styleWritingModeTblr
     * @type {Integer (Int32)}
     */
    static Tblr => 5

    /**
     * Native name: styleWritingModeBtlr
     * @type {Integer (Int32)}
     */
    static Btlr => 6

    /**
     * Native name: styleWritingModeLrbt
     * @type {Integer (Int32)}
     */
    static Lrbt => 7

    /**
     * Native name: styleWritingModeRlbt
     * @type {Integer (Int32)}
     */
    static Rlbt => 8

    /**
     * Native name: styleWritingModeLr
     * @type {Integer (Int32)}
     */
    static Lr => 9

    /**
     * Native name: styleWritingModeRl
     * @type {Integer (Int32)}
     */
    static Rl => 10

    /**
     * Native name: styleWritingModeTb
     * @type {Integer (Int32)}
     */
    static Tb => 11

    /**
     * Native name: styleWritingMode_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
