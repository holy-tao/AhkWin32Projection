#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleMsAnimationFillMode extends Win32Enum {

    /**
     * Native name: styleMsAnimationFillModeNone
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Native name: styleMsAnimationFillModeForwards
     * @type {Integer (Int32)}
     */
    static Forwards => 1

    /**
     * Native name: styleMsAnimationFillModeBackwards
     * @type {Integer (Int32)}
     */
    static Backwards => 2

    /**
     * Native name: styleMsAnimationFillModeBoth
     * @type {Integer (Int32)}
     */
    static Both => 3

    /**
     * Native name: styleMsAnimationFillModeNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => 4

    /**
     * Native name: styleMsAnimationFillMode_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
