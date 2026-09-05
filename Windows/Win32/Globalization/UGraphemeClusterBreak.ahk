#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 */
class UGraphemeClusterBreak extends Win32Enum {

    /**
     * Native name: U_GCB_OTHER
     * @type {Integer (Int32)}
     */
    static GCB_OTHER => 0

    /**
     * Native name: U_GCB_CONTROL
     * @type {Integer (Int32)}
     */
    static GCB_CONTROL => 1

    /**
     * Native name: U_GCB_CR
     * @type {Integer (Int32)}
     */
    static GCB_CR => 2

    /**
     * Native name: U_GCB_EXTEND
     * @type {Integer (Int32)}
     */
    static GCB_EXTEND => 3

    /**
     * Native name: U_GCB_L
     * @type {Integer (Int32)}
     */
    static GCB_L => 4

    /**
     * Native name: U_GCB_LF
     * @type {Integer (Int32)}
     */
    static GCB_LF => 5

    /**
     * Native name: U_GCB_LV
     * @type {Integer (Int32)}
     */
    static GCB_LV => 6

    /**
     * Native name: U_GCB_LVT
     * @type {Integer (Int32)}
     */
    static GCB_LVT => 7

    /**
     * Native name: U_GCB_T
     * @type {Integer (Int32)}
     */
    static GCB_T => 8

    /**
     * Native name: U_GCB_V
     * @type {Integer (Int32)}
     */
    static GCB_V => 9

    /**
     * Native name: U_GCB_SPACING_MARK
     * @type {Integer (Int32)}
     */
    static GCB_SPACING_MARK => 10

    /**
     * Native name: U_GCB_PREPEND
     * @type {Integer (Int32)}
     */
    static GCB_PREPEND => 11

    /**
     * Native name: U_GCB_REGIONAL_INDICATOR
     * @type {Integer (Int32)}
     */
    static GCB_REGIONAL_INDICATOR => 12

    /**
     * Native name: U_GCB_E_BASE
     * @type {Integer (Int32)}
     */
    static GCB_E_BASE => 13

    /**
     * Native name: U_GCB_E_BASE_GAZ
     * @type {Integer (Int32)}
     */
    static GCB_E_BASE_GAZ => 14

    /**
     * Native name: U_GCB_E_MODIFIER
     * @type {Integer (Int32)}
     */
    static GCB_E_MODIFIER => 15

    /**
     * Native name: U_GCB_GLUE_AFTER_ZWJ
     * @type {Integer (Int32)}
     */
    static GCB_GLUE_AFTER_ZWJ => 16

    /**
     * Native name: U_GCB_ZWJ
     * @type {Integer (Int32)}
     */
    static GCB_ZWJ => 17
}
