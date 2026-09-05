#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleRubyOverhang extends Win32Enum {

    /**
     * Native name: styleRubyOverhangNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => 0

    /**
     * Native name: styleRubyOverhangAuto
     * @type {Integer (Int32)}
     */
    static Auto => 1

    /**
     * Native name: styleRubyOverhangWhitespace
     * @type {Integer (Int32)}
     */
    static Whitespace => 2

    /**
     * Native name: styleRubyOverhangNone
     * @type {Integer (Int32)}
     */
    static None => 3

    /**
     * Native name: styleRubyOverhang_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
