#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleDir extends Win32Enum {

    /**
     * Native name: styleDirNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => 0

    /**
     * Native name: styleDirLeftToRight
     * @type {Integer (Int32)}
     */
    static LeftToRight => 1

    /**
     * Native name: styleDirRightToLeft
     * @type {Integer (Int32)}
     */
    static RightToLeft => 2

    /**
     * Native name: styleDirInherit
     * @type {Integer (Int32)}
     */
    static Inherit => 3

    /**
     * Native name: styleDir_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
