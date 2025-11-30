#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class R2_MODE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static R2_BLACK => 1

    /**
     * @type {Integer (Int32)}
     */
    static R2_NOTMERGEPEN => 2

    /**
     * @type {Integer (Int32)}
     */
    static R2_MASKNOTPEN => 3

    /**
     * @type {Integer (Int32)}
     */
    static R2_NOTCOPYPEN => 4

    /**
     * @type {Integer (Int32)}
     */
    static R2_MASKPENNOT => 5

    /**
     * @type {Integer (Int32)}
     */
    static R2_NOT => 6

    /**
     * @type {Integer (Int32)}
     */
    static R2_XORPEN => 7

    /**
     * @type {Integer (Int32)}
     */
    static R2_NOTMASKPEN => 8

    /**
     * @type {Integer (Int32)}
     */
    static R2_MASKPEN => 9

    /**
     * @type {Integer (Int32)}
     */
    static R2_NOTXORPEN => 10

    /**
     * @type {Integer (Int32)}
     */
    static R2_NOP => 11

    /**
     * @type {Integer (Int32)}
     */
    static R2_MERGENOTPEN => 12

    /**
     * @type {Integer (Int32)}
     */
    static R2_COPYPEN => 13

    /**
     * @type {Integer (Int32)}
     */
    static R2_MERGEPENNOT => 14

    /**
     * @type {Integer (Int32)}
     */
    static R2_MERGEPEN => 15

    /**
     * @type {Integer (Int32)}
     */
    static R2_WHITE => 16

    /**
     * @type {Integer (Int32)}
     */
    static R2_LAST => 16
}
