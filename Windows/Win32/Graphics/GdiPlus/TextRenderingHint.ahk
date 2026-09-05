#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
class TextRenderingHint extends Win32Enum {

    /**
     * Native name: TextRenderingHintSystemDefault
     * @type {Integer (Int32)}
     */
    static SystemDefault => 0

    /**
     * Native name: TextRenderingHintSingleBitPerPixelGridFit
     * @type {Integer (Int32)}
     */
    static SingleBitPerPixelGridFit => 1

    /**
     * Native name: TextRenderingHintSingleBitPerPixel
     * @type {Integer (Int32)}
     */
    static SingleBitPerPixel => 2

    /**
     * Native name: TextRenderingHintAntiAliasGridFit
     * @type {Integer (Int32)}
     */
    static AntiAliasGridFit => 3

    /**
     * Native name: TextRenderingHintAntiAlias
     * @type {Integer (Int32)}
     */
    static AntiAlias => 4

    /**
     * Native name: TextRenderingHintClearTypeGridFit
     * @type {Integer (Int32)}
     */
    static ClearTypeGridFit => 5
}
