#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleMsAnimationDirection extends Win32Enum {

    /**
     * Native name: styleMsAnimationDirectionNormal
     * @type {Integer (Int32)}
     */
    static Normal => 0

    /**
     * Native name: styleMsAnimationDirectionAlternate
     * @type {Integer (Int32)}
     */
    static Alternate => 1

    /**
     * Native name: styleMsAnimationDirectionReverse
     * @type {Integer (Int32)}
     */
    static Reverse => 2

    /**
     * Native name: styleMsAnimationDirectionAlternateReverse
     * @type {Integer (Int32)}
     */
    static AlternateReverse => 3

    /**
     * Native name: styleMsAnimationDirectionNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => 4

    /**
     * Native name: styleMsAnimationDirection_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
