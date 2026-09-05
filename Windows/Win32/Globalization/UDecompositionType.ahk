#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 */
class UDecompositionType extends Win32Enum {

    /**
     * Native name: U_DT_NONE
     * @type {Integer (Int32)}
     */
    static DT_NONE => 0

    /**
     * Native name: U_DT_CANONICAL
     * @type {Integer (Int32)}
     */
    static DT_CANONICAL => 1

    /**
     * Native name: U_DT_COMPAT
     * @type {Integer (Int32)}
     */
    static DT_COMPAT => 2

    /**
     * Native name: U_DT_CIRCLE
     * @type {Integer (Int32)}
     */
    static DT_CIRCLE => 3

    /**
     * Native name: U_DT_FINAL
     * @type {Integer (Int32)}
     */
    static DT_FINAL => 4

    /**
     * Native name: U_DT_FONT
     * @type {Integer (Int32)}
     */
    static DT_FONT => 5

    /**
     * Native name: U_DT_FRACTION
     * @type {Integer (Int32)}
     */
    static DT_FRACTION => 6

    /**
     * Native name: U_DT_INITIAL
     * @type {Integer (Int32)}
     */
    static DT_INITIAL => 7

    /**
     * Native name: U_DT_ISOLATED
     * @type {Integer (Int32)}
     */
    static DT_ISOLATED => 8

    /**
     * Native name: U_DT_MEDIAL
     * @type {Integer (Int32)}
     */
    static DT_MEDIAL => 9

    /**
     * Native name: U_DT_NARROW
     * @type {Integer (Int32)}
     */
    static DT_NARROW => 10

    /**
     * Native name: U_DT_NOBREAK
     * @type {Integer (Int32)}
     */
    static DT_NOBREAK => 11

    /**
     * Native name: U_DT_SMALL
     * @type {Integer (Int32)}
     */
    static DT_SMALL => 12

    /**
     * Native name: U_DT_SQUARE
     * @type {Integer (Int32)}
     */
    static DT_SQUARE => 13

    /**
     * Native name: U_DT_SUB
     * @type {Integer (Int32)}
     */
    static DT_SUB => 14

    /**
     * Native name: U_DT_SUPER
     * @type {Integer (Int32)}
     */
    static DT_SUPER => 15

    /**
     * Native name: U_DT_VERTICAL
     * @type {Integer (Int32)}
     */
    static DT_VERTICAL => 16

    /**
     * Native name: U_DT_WIDE
     * @type {Integer (Int32)}
     */
    static DT_WIDE => 17
}
