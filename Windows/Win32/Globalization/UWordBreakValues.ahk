#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 */
class UWordBreakValues extends Win32Enum {

    /**
     * Native name: U_WB_OTHER
     * @type {Integer (Int32)}
     */
    static WB_OTHER => 0

    /**
     * Native name: U_WB_ALETTER
     * @type {Integer (Int32)}
     */
    static WB_ALETTER => 1

    /**
     * Native name: U_WB_FORMAT
     * @type {Integer (Int32)}
     */
    static WB_FORMAT => 2

    /**
     * Native name: U_WB_KATAKANA
     * @type {Integer (Int32)}
     */
    static WB_KATAKANA => 3

    /**
     * Native name: U_WB_MIDLETTER
     * @type {Integer (Int32)}
     */
    static WB_MIDLETTER => 4

    /**
     * Native name: U_WB_MIDNUM
     * @type {Integer (Int32)}
     */
    static WB_MIDNUM => 5

    /**
     * Native name: U_WB_NUMERIC
     * @type {Integer (Int32)}
     */
    static WB_NUMERIC => 6

    /**
     * Native name: U_WB_EXTENDNUMLET
     * @type {Integer (Int32)}
     */
    static WB_EXTENDNUMLET => 7

    /**
     * Native name: U_WB_CR
     * @type {Integer (Int32)}
     */
    static WB_CR => 8

    /**
     * Native name: U_WB_EXTEND
     * @type {Integer (Int32)}
     */
    static WB_EXTEND => 9

    /**
     * Native name: U_WB_LF
     * @type {Integer (Int32)}
     */
    static WB_LF => 10

    /**
     * Native name: U_WB_MIDNUMLET
     * @type {Integer (Int32)}
     */
    static WB_MIDNUMLET => 11

    /**
     * Native name: U_WB_NEWLINE
     * @type {Integer (Int32)}
     */
    static WB_NEWLINE => 12

    /**
     * Native name: U_WB_REGIONAL_INDICATOR
     * @type {Integer (Int32)}
     */
    static WB_REGIONAL_INDICATOR => 13

    /**
     * Native name: U_WB_HEBREW_LETTER
     * @type {Integer (Int32)}
     */
    static WB_HEBREW_LETTER => 14

    /**
     * Native name: U_WB_SINGLE_QUOTE
     * @type {Integer (Int32)}
     */
    static WB_SINGLE_QUOTE => 15

    /**
     * Native name: U_WB_DOUBLE_QUOTE
     * @type {Integer (Int32)}
     */
    static WB_DOUBLE_QUOTE => 16

    /**
     * Native name: U_WB_E_BASE
     * @type {Integer (Int32)}
     */
    static WB_E_BASE => 17

    /**
     * Native name: U_WB_E_BASE_GAZ
     * @type {Integer (Int32)}
     */
    static WB_E_BASE_GAZ => 18

    /**
     * Native name: U_WB_E_MODIFIER
     * @type {Integer (Int32)}
     */
    static WB_E_MODIFIER => 19

    /**
     * Native name: U_WB_GLUE_AFTER_ZWJ
     * @type {Integer (Int32)}
     */
    static WB_GLUE_AFTER_ZWJ => 20

    /**
     * Native name: U_WB_ZWJ
     * @type {Integer (Int32)}
     */
    static WB_ZWJ => 21

    /**
     * Native name: U_WB_WSEGSPACE
     * @type {Integer (Int32)}
     */
    static WB_WSEGSPACE => 22
}
