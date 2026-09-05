#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleFontSize extends Win32Enum {

    /**
     * Native name: styleFontSizeXXSmall
     * @type {Integer (Int32)}
     */
    static SizeXXSmall => 0

    /**
     * Native name: styleFontSizeXSmall
     * @type {Integer (Int32)}
     */
    static SizeXSmall => 1

    /**
     * Native name: styleFontSizeSmall
     * @type {Integer (Int32)}
     */
    static Small => 2

    /**
     * Native name: styleFontSizeMedium
     * @type {Integer (Int32)}
     */
    static Medium => 3

    /**
     * Native name: styleFontSizeLarge
     * @type {Integer (Int32)}
     */
    static Large => 4

    /**
     * Native name: styleFontSizeXLarge
     * @type {Integer (Int32)}
     */
    static SizeXLarge => 5

    /**
     * Native name: styleFontSizeXXLarge
     * @type {Integer (Int32)}
     */
    static SizeXXLarge => 6

    /**
     * Native name: styleFontSizeSmaller
     * @type {Integer (Int32)}
     */
    static Smaller => 7

    /**
     * Native name: styleFontSizeLarger
     * @type {Integer (Int32)}
     */
    static Larger => 8

    /**
     * Native name: styleFontSize_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
