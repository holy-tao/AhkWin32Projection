#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleCaptionSide extends Win32Enum {

    /**
     * Native name: styleCaptionSideNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => 0

    /**
     * Native name: styleCaptionSideTop
     * @type {Integer (Int32)}
     */
    static Top => 1

    /**
     * Native name: styleCaptionSideBottom
     * @type {Integer (Int32)}
     */
    static Bottom => 2

    /**
     * Native name: styleCaptionSideLeft
     * @type {Integer (Int32)}
     */
    static Left => 3

    /**
     * Native name: styleCaptionSideRight
     * @type {Integer (Int32)}
     */
    static Right => 4

    /**
     * Native name: styleCaptionSide_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
