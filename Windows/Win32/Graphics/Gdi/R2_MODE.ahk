#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Gdi
 */
class R2_MODE extends Win32Enum {

    /**
     * Native name: R2_BLACK
     * @type {Integer (Int32)}
     */
    static BLACK => 1

    /**
     * Native name: R2_NOTMERGEPEN
     * @type {Integer (Int32)}
     */
    static NOTMERGEPEN => 2

    /**
     * Native name: R2_MASKNOTPEN
     * @type {Integer (Int32)}
     */
    static MASKNOTPEN => 3

    /**
     * Native name: R2_NOTCOPYPEN
     * @type {Integer (Int32)}
     */
    static NOTCOPYPEN => 4

    /**
     * Native name: R2_MASKPENNOT
     * @type {Integer (Int32)}
     */
    static MASKPENNOT => 5

    /**
     * Native name: R2_NOT
     * @type {Integer (Int32)}
     */
    static NOT => 6

    /**
     * Native name: R2_XORPEN
     * @type {Integer (Int32)}
     */
    static XORPEN => 7

    /**
     * Native name: R2_NOTMASKPEN
     * @type {Integer (Int32)}
     */
    static NOTMASKPEN => 8

    /**
     * Native name: R2_MASKPEN
     * @type {Integer (Int32)}
     */
    static MASKPEN => 9

    /**
     * Native name: R2_NOTXORPEN
     * @type {Integer (Int32)}
     */
    static NOTXORPEN => 10

    /**
     * Native name: R2_NOP
     * @type {Integer (Int32)}
     */
    static NOP => 11

    /**
     * Native name: R2_MERGENOTPEN
     * @type {Integer (Int32)}
     */
    static MERGENOTPEN => 12

    /**
     * Native name: R2_COPYPEN
     * @type {Integer (Int32)}
     */
    static COPYPEN => 13

    /**
     * Native name: R2_MERGEPENNOT
     * @type {Integer (Int32)}
     */
    static MERGEPENNOT => 14

    /**
     * Native name: R2_MERGEPEN
     * @type {Integer (Int32)}
     */
    static MERGEPEN => 15

    /**
     * Native name: R2_WHITE
     * @type {Integer (Int32)}
     */
    static WHITE => 16

    /**
     * Native name: R2_LAST
     * @type {Integer (Int32)}
     */
    static LAST => 16
}
