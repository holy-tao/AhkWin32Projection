#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class styleWebkitBoxPack extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static styleWebkitBoxPackStart => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleWebkitBoxPackEnd => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleWebkitBoxPackCenter => 2

    /**
     * @type {Integer (Int32)}
     */
    static styleWebkitBoxPackJustify => 3

    /**
     * @type {Integer (Int32)}
     */
    static styleWebkitBoxPackNotSet => 5

    /**
     * @type {Integer (Int32)}
     */
    static styleWebkitBoxPack_Max => 2147483647
}
