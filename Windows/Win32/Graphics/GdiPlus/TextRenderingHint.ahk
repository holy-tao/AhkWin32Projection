#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class TextRenderingHint extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static TextRenderingHintSystemDefault => 0

    /**
     * @type {Integer (Int32)}
     */
    static TextRenderingHintSingleBitPerPixelGridFit => 1

    /**
     * @type {Integer (Int32)}
     */
    static TextRenderingHintSingleBitPerPixel => 2

    /**
     * @type {Integer (Int32)}
     */
    static TextRenderingHintAntiAliasGridFit => 3

    /**
     * @type {Integer (Int32)}
     */
    static TextRenderingHintAntiAlias => 4

    /**
     * @type {Integer (Int32)}
     */
    static TextRenderingHintClearTypeGridFit => 5
}
