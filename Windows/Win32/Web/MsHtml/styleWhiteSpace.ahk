#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleWhiteSpace extends Win32Enum {

    /**
     * Native name: styleWhiteSpaceNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => 0

    /**
     * Native name: styleWhiteSpaceNormal
     * @type {Integer (Int32)}
     */
    static Normal => 1

    /**
     * Native name: styleWhiteSpacePre
     * @type {Integer (Int32)}
     */
    static Pre => 2

    /**
     * Native name: styleWhiteSpaceNowrap
     * @type {Integer (Int32)}
     */
    static Nowrap => 3

    /**
     * Native name: styleWhiteSpacePreline
     * @type {Integer (Int32)}
     */
    static Preline => 4

    /**
     * Native name: styleWhiteSpacePrewrap
     * @type {Integer (Int32)}
     */
    static Prewrap => 5

    /**
     * Native name: styleWhiteSpace_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
