#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleInitialString extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static styleInitialStringNoInitial => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleInitialStringNone => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleInitialStringAuto => 2

    /**
     * @type {Integer (Int32)}
     */
    static styleInitialStringNormal => 3

    /**
     * @type {Integer (Int32)}
     */
    static styleInitialString_Max => 2147483647
}
