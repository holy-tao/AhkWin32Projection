#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleMsContentZoomSnapType extends Win32Enum {

    /**
     * Native name: styleMsContentZoomSnapTypeNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => 0

    /**
     * Native name: styleMsContentZoomSnapTypeNone
     * @type {Integer (Int32)}
     */
    static None => 1

    /**
     * Native name: styleMsContentZoomSnapTypeMandatory
     * @type {Integer (Int32)}
     */
    static Mandatory => 2

    /**
     * Native name: styleMsContentZoomSnapTypeProximity
     * @type {Integer (Int32)}
     */
    static Proximity => 3

    /**
     * Native name: styleMsContentZoomSnapType_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
