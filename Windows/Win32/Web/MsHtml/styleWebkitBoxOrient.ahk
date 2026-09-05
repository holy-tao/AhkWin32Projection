#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleWebkitBoxOrient extends Win32Enum {

    /**
     * Native name: styleWebkitBoxOrientHorizontal
     * @type {Integer (Int32)}
     */
    static Horizontal => 0

    /**
     * Native name: styleWebkitBoxOrientInlineAxis
     * @type {Integer (Int32)}
     */
    static InlineAxis => 1

    /**
     * Native name: styleWebkitBoxOrientVertical
     * @type {Integer (Int32)}
     */
    static Vertical => 2

    /**
     * Native name: styleWebkitBoxOrientBlockAxis
     * @type {Integer (Int32)}
     */
    static BlockAxis => 3

    /**
     * Native name: styleWebkitBoxOrientNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => 4

    /**
     * Native name: styleWebkitBoxOrient_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
