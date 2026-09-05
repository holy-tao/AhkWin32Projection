#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleGridRowAlign extends Win32Enum {

    /**
     * Native name: styleGridRowAlignCenter
     * @type {Integer (Int32)}
     */
    static Center => 0

    /**
     * Native name: styleGridRowAlignEnd
     * @type {Integer (Int32)}
     */
    static End => 1

    /**
     * Native name: styleGridRowAlignStart
     * @type {Integer (Int32)}
     */
    static Start => 2

    /**
     * Native name: styleGridRowAlignStretch
     * @type {Integer (Int32)}
     */
    static Stretch => 3

    /**
     * Native name: styleGridRowAlignNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => 4

    /**
     * Native name: styleGridRowAlign_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
