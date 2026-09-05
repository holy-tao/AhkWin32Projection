#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleBackgroundOrigin extends Win32Enum {

    /**
     * Native name: styleBackgroundOriginBorderBox
     * @type {Integer (Int32)}
     */
    static BorderBox => 0

    /**
     * Native name: styleBackgroundOriginPaddingBox
     * @type {Integer (Int32)}
     */
    static PaddingBox => 1

    /**
     * Native name: styleBackgroundOriginContentBox
     * @type {Integer (Int32)}
     */
    static ContentBox => 2

    /**
     * Native name: styleBackgroundOriginNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => 3

    /**
     * Native name: styleBackgroundOrigin_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
