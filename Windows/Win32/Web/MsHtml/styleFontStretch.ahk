#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleFontStretch extends Win32Enum {

    /**
     * Native name: styleFontStretchNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => 0

    /**
     * Native name: styleFontStretchWider
     * @type {Integer (Int32)}
     */
    static Wider => 1

    /**
     * Native name: styleFontStretchNarrower
     * @type {Integer (Int32)}
     */
    static Narrower => 2

    /**
     * Native name: styleFontStretchUltraCondensed
     * @type {Integer (Int32)}
     */
    static UltraCondensed => 3

    /**
     * Native name: styleFontStretchExtraCondensed
     * @type {Integer (Int32)}
     */
    static ExtraCondensed => 4

    /**
     * Native name: styleFontStretchCondensed
     * @type {Integer (Int32)}
     */
    static Condensed => 5

    /**
     * Native name: styleFontStretchSemiCondensed
     * @type {Integer (Int32)}
     */
    static SemiCondensed => 6

    /**
     * Native name: styleFontStretchNormal
     * @type {Integer (Int32)}
     */
    static Normal => 7

    /**
     * Native name: styleFontStretchSemiExpanded
     * @type {Integer (Int32)}
     */
    static SemiExpanded => 8

    /**
     * Native name: styleFontStretchExpanded
     * @type {Integer (Int32)}
     */
    static Expanded => 9

    /**
     * Native name: styleFontStretchExtraExpanded
     * @type {Integer (Int32)}
     */
    static ExtraExpanded => 10

    /**
     * Native name: styleFontStretchUltraExpanded
     * @type {Integer (Int32)}
     */
    static UltraExpanded => 11

    /**
     * Native name: styleFontStretch_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
