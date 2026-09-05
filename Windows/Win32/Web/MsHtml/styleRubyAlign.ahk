#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleRubyAlign extends Win32Enum {

    /**
     * Native name: styleRubyAlignNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => 0

    /**
     * Native name: styleRubyAlignAuto
     * @type {Integer (Int32)}
     */
    static Auto => 1

    /**
     * Native name: styleRubyAlignLeft
     * @type {Integer (Int32)}
     */
    static Left => 2

    /**
     * Native name: styleRubyAlignCenter
     * @type {Integer (Int32)}
     */
    static Center => 3

    /**
     * Native name: styleRubyAlignRight
     * @type {Integer (Int32)}
     */
    static Right => 4

    /**
     * Native name: styleRubyAlignDistributeLetter
     * @type {Integer (Int32)}
     */
    static DistributeLetter => 5

    /**
     * Native name: styleRubyAlignDistributeSpace
     * @type {Integer (Int32)}
     */
    static DistributeSpace => 6

    /**
     * Native name: styleRubyAlignLineEdge
     * @type {Integer (Int32)}
     */
    static LineEdge => 7

    /**
     * Native name: styleRubyAlign_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
