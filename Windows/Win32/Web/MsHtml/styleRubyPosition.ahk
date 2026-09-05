#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleRubyPosition extends Win32Enum {

    /**
     * Native name: styleRubyPositionNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => 0

    /**
     * Native name: styleRubyPositionAbove
     * @type {Integer (Int32)}
     */
    static Above => 1

    /**
     * Native name: styleRubyPositionInline
     * @type {Integer (Int32)}
     */
    static Inline => 2

    /**
     * Native name: styleRubyPosition_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
