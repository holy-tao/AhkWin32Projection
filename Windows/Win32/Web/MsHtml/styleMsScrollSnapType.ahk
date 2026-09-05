#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleMsScrollSnapType extends Win32Enum {

    /**
     * Native name: styleMsScrollSnapTypeNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => 0

    /**
     * Native name: styleMsScrollSnapTypeNone
     * @type {Integer (Int32)}
     */
    static None => 1

    /**
     * Native name: styleMsScrollSnapTypeMandatory
     * @type {Integer (Int32)}
     */
    static Mandatory => 2

    /**
     * Native name: styleMsScrollSnapTypeProximity
     * @type {Integer (Int32)}
     */
    static Proximity => 3

    /**
     * Native name: styleMsScrollSnapType_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
