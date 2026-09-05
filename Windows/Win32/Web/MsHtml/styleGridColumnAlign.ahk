#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleGridColumnAlign extends Win32Enum {

    /**
     * Native name: styleGridColumnAlignCenter
     * @type {Integer (Int32)}
     */
    static Center => 0

    /**
     * Native name: styleGridColumnAlignEnd
     * @type {Integer (Int32)}
     */
    static End => 1

    /**
     * Native name: styleGridColumnAlignStart
     * @type {Integer (Int32)}
     */
    static Start => 2

    /**
     * Native name: styleGridColumnAlignStretch
     * @type {Integer (Int32)}
     */
    static Stretch => 3

    /**
     * Native name: styleGridColumnAlignNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => 4

    /**
     * Native name: styleGridColumnAlign_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
