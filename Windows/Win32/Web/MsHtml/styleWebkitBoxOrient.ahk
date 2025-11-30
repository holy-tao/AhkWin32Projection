#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class styleWebkitBoxOrient extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static styleWebkitBoxOrientHorizontal => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleWebkitBoxOrientInlineAxis => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleWebkitBoxOrientVertical => 2

    /**
     * @type {Integer (Int32)}
     */
    static styleWebkitBoxOrientBlockAxis => 3

    /**
     * @type {Integer (Int32)}
     */
    static styleWebkitBoxOrientNotSet => 4

    /**
     * @type {Integer (Int32)}
     */
    static styleWebkitBoxOrient_Max => 2147483647
}
