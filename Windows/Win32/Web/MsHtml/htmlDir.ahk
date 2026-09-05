#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class htmlDir extends Win32Enum {

    /**
     * Native name: htmlDirNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => 0

    /**
     * Native name: htmlDirLeftToRight
     * @type {Integer (Int32)}
     */
    static LeftToRight => 1

    /**
     * Native name: htmlDirRightToLeft
     * @type {Integer (Int32)}
     */
    static RightToLeft => 2

    /**
     * Native name: htmlDir_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
