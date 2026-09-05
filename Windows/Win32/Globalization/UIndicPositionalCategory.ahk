#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 */
class UIndicPositionalCategory extends Win32Enum {

    /**
     * Native name: U_INPC_NA
     * @type {Integer (Int32)}
     */
    static INPC_NA => 0

    /**
     * Native name: U_INPC_BOTTOM
     * @type {Integer (Int32)}
     */
    static INPC_BOTTOM => 1

    /**
     * Native name: U_INPC_BOTTOM_AND_LEFT
     * @type {Integer (Int32)}
     */
    static INPC_BOTTOM_AND_LEFT => 2

    /**
     * Native name: U_INPC_BOTTOM_AND_RIGHT
     * @type {Integer (Int32)}
     */
    static INPC_BOTTOM_AND_RIGHT => 3

    /**
     * Native name: U_INPC_LEFT
     * @type {Integer (Int32)}
     */
    static INPC_LEFT => 4

    /**
     * Native name: U_INPC_LEFT_AND_RIGHT
     * @type {Integer (Int32)}
     */
    static INPC_LEFT_AND_RIGHT => 5

    /**
     * Native name: U_INPC_OVERSTRUCK
     * @type {Integer (Int32)}
     */
    static INPC_OVERSTRUCK => 6

    /**
     * Native name: U_INPC_RIGHT
     * @type {Integer (Int32)}
     */
    static INPC_RIGHT => 7

    /**
     * Native name: U_INPC_TOP
     * @type {Integer (Int32)}
     */
    static INPC_TOP => 8

    /**
     * Native name: U_INPC_TOP_AND_BOTTOM
     * @type {Integer (Int32)}
     */
    static INPC_TOP_AND_BOTTOM => 9

    /**
     * Native name: U_INPC_TOP_AND_BOTTOM_AND_RIGHT
     * @type {Integer (Int32)}
     */
    static INPC_TOP_AND_BOTTOM_AND_RIGHT => 10

    /**
     * Native name: U_INPC_TOP_AND_LEFT
     * @type {Integer (Int32)}
     */
    static INPC_TOP_AND_LEFT => 11

    /**
     * Native name: U_INPC_TOP_AND_LEFT_AND_RIGHT
     * @type {Integer (Int32)}
     */
    static INPC_TOP_AND_LEFT_AND_RIGHT => 12

    /**
     * Native name: U_INPC_TOP_AND_RIGHT
     * @type {Integer (Int32)}
     */
    static INPC_TOP_AND_RIGHT => 13

    /**
     * Native name: U_INPC_VISUAL_ORDER_LEFT
     * @type {Integer (Int32)}
     */
    static INPC_VISUAL_ORDER_LEFT => 14

    /**
     * Native name: U_INPC_TOP_AND_BOTTOM_AND_LEFT
     * @type {Integer (Int32)}
     */
    static INPC_TOP_AND_BOTTOM_AND_LEFT => 15
}
