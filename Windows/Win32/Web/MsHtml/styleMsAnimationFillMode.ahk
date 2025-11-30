#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class styleMsAnimationFillMode extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static styleMsAnimationFillModeNone => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleMsAnimationFillModeForwards => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleMsAnimationFillModeBackwards => 2

    /**
     * @type {Integer (Int32)}
     */
    static styleMsAnimationFillModeBoth => 3

    /**
     * @type {Integer (Int32)}
     */
    static styleMsAnimationFillModeNotSet => 4

    /**
     * @type {Integer (Int32)}
     */
    static styleMsAnimationFillMode_Max => 2147483647
}
