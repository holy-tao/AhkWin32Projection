#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleRubyOverhang extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static styleRubyOverhangNotSet => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleRubyOverhangAuto => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleRubyOverhangWhitespace => 2

    /**
     * @type {Integer (Int32)}
     */
    static styleRubyOverhangNone => 3

    /**
     * @type {Integer (Int32)}
     */
    static styleRubyOverhang_Max => 2147483647
}
