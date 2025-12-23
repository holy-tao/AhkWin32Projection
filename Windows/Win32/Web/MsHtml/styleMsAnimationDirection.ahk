#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class styleMsAnimationDirection extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static styleMsAnimationDirectionNormal => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleMsAnimationDirectionAlternate => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleMsAnimationDirectionReverse => 2

    /**
     * @type {Integer (Int32)}
     */
    static styleMsAnimationDirectionAlternateReverse => 3

    /**
     * @type {Integer (Int32)}
     */
    static styleMsAnimationDirectionNotSet => 4

    /**
     * @type {Integer (Int32)}
     */
    static styleMsAnimationDirection_Max => 2147483647
}
