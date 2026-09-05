#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleInterpolation extends Win32Enum {

    /**
     * Native name: styleInterpolationNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => 0

    /**
     * Native name: styleInterpolationNN
     * @type {Integer (Int32)}
     */
    static InterpolationNN => 1

    /**
     * Native name: styleInterpolationBCH
     * @type {Integer (Int32)}
     */
    static InterpolationBCH => 2

    /**
     * Native name: styleInterpolation_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
