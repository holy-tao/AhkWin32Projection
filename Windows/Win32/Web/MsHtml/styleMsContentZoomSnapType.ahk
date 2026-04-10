#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleMsContentZoomSnapType extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static styleMsContentZoomSnapTypeNotSet => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleMsContentZoomSnapTypeNone => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleMsContentZoomSnapTypeMandatory => 2

    /**
     * @type {Integer (Int32)}
     */
    static styleMsContentZoomSnapTypeProximity => 3

    /**
     * @type {Integer (Int32)}
     */
    static styleMsContentZoomSnapType_Max => 2147483647
}
