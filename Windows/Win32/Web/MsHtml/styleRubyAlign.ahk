#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class styleRubyAlign extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static styleRubyAlignNotSet => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleRubyAlignAuto => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleRubyAlignLeft => 2

    /**
     * @type {Integer (Int32)}
     */
    static styleRubyAlignCenter => 3

    /**
     * @type {Integer (Int32)}
     */
    static styleRubyAlignRight => 4

    /**
     * @type {Integer (Int32)}
     */
    static styleRubyAlignDistributeLetter => 5

    /**
     * @type {Integer (Int32)}
     */
    static styleRubyAlignDistributeSpace => 6

    /**
     * @type {Integer (Int32)}
     */
    static styleRubyAlignLineEdge => 7

    /**
     * @type {Integer (Int32)}
     */
    static styleRubyAlign_Max => 2147483647
}
