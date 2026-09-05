#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleInitialString extends Win32Enum {

    /**
     * Native name: styleInitialStringNoInitial
     * @type {Integer (Int32)}
     */
    static NoInitial => 0

    /**
     * Native name: styleInitialStringNone
     * @type {Integer (Int32)}
     */
    static None => 1

    /**
     * Native name: styleInitialStringAuto
     * @type {Integer (Int32)}
     */
    static Auto => 2

    /**
     * Native name: styleInitialStringNormal
     * @type {Integer (Int32)}
     */
    static Normal => 3

    /**
     * Native name: styleInitialString_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
