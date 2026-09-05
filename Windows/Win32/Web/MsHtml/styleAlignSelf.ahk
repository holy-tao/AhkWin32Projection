#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleAlignSelf extends Win32Enum {

    /**
     * Native name: styleAlignSelfFlexStart
     * @type {Integer (Int32)}
     */
    static FlexStart => 0

    /**
     * Native name: styleAlignSelfFlexEnd
     * @type {Integer (Int32)}
     */
    static FlexEnd => 1

    /**
     * Native name: styleAlignSelfCenter
     * @type {Integer (Int32)}
     */
    static Center => 2

    /**
     * Native name: styleAlignSelfBaseline
     * @type {Integer (Int32)}
     */
    static Baseline => 3

    /**
     * Native name: styleAlignSelfStretch
     * @type {Integer (Int32)}
     */
    static Stretch => 4

    /**
     * Native name: styleAlignSelfAuto
     * @type {Integer (Int32)}
     */
    static Auto => 5

    /**
     * Native name: styleAlignSelfNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => 6

    /**
     * Native name: styleAlignSelf_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
