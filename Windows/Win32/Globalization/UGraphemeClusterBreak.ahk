#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class UGraphemeClusterBreak extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static U_GCB_OTHER => 0

    /**
     * @type {Integer (Int32)}
     */
    static U_GCB_CONTROL => 1

    /**
     * @type {Integer (Int32)}
     */
    static U_GCB_CR => 2

    /**
     * @type {Integer (Int32)}
     */
    static U_GCB_EXTEND => 3

    /**
     * @type {Integer (Int32)}
     */
    static U_GCB_L => 4

    /**
     * @type {Integer (Int32)}
     */
    static U_GCB_LF => 5

    /**
     * @type {Integer (Int32)}
     */
    static U_GCB_LV => 6

    /**
     * @type {Integer (Int32)}
     */
    static U_GCB_LVT => 7

    /**
     * @type {Integer (Int32)}
     */
    static U_GCB_T => 8

    /**
     * @type {Integer (Int32)}
     */
    static U_GCB_V => 9

    /**
     * @type {Integer (Int32)}
     */
    static U_GCB_SPACING_MARK => 10

    /**
     * @type {Integer (Int32)}
     */
    static U_GCB_PREPEND => 11

    /**
     * @type {Integer (Int32)}
     */
    static U_GCB_REGIONAL_INDICATOR => 12

    /**
     * @type {Integer (Int32)}
     */
    static U_GCB_E_BASE => 13

    /**
     * @type {Integer (Int32)}
     */
    static U_GCB_E_BASE_GAZ => 14

    /**
     * @type {Integer (Int32)}
     */
    static U_GCB_E_MODIFIER => 15

    /**
     * @type {Integer (Int32)}
     */
    static U_GCB_GLUE_AFTER_ZWJ => 16

    /**
     * @type {Integer (Int32)}
     */
    static U_GCB_ZWJ => 17
}
