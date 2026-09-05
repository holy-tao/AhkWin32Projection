#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleWordWrap extends Win32Enum {

    /**
     * Native name: styleWordWrapNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => 0

    /**
     * Native name: styleWordWrapOff
     * @type {Integer (Int32)}
     */
    static Off => 1

    /**
     * Native name: styleWordWrapOn
     * @type {Integer (Int32)}
     */
    static On => 2

    /**
     * Native name: styleWordWrap_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
