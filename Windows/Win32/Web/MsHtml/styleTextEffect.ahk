#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleTextEffect extends Win32Enum {

    /**
     * Native name: styleTextEffectNone
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Native name: styleTextEffectEmboss
     * @type {Integer (Int32)}
     */
    static Emboss => 1

    /**
     * Native name: styleTextEffectEngrave
     * @type {Integer (Int32)}
     */
    static Engrave => 2

    /**
     * Native name: styleTextEffectOutline
     * @type {Integer (Int32)}
     */
    static Outline => 3

    /**
     * Native name: styleTextEffect_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
