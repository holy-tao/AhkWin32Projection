#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleWebkitBoxPack extends Win32Enum {

    /**
     * Native name: styleWebkitBoxPackStart
     * @type {Integer (Int32)}
     */
    static Start => 0

    /**
     * Native name: styleWebkitBoxPackEnd
     * @type {Integer (Int32)}
     */
    static End => 1

    /**
     * Native name: styleWebkitBoxPackCenter
     * @type {Integer (Int32)}
     */
    static Center => 2

    /**
     * Native name: styleWebkitBoxPackJustify
     * @type {Integer (Int32)}
     */
    static Justify => 3

    /**
     * Native name: styleWebkitBoxPackNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => 5

    /**
     * Native name: styleWebkitBoxPack_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
