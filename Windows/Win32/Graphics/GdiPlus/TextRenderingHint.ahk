#Requires AutoHotkey v2.0.0 64-bit

/**
 * The TextRenderingHint enumeration specifies the process used to render text. The process affects the quality of the text.
 * @remarks
 * 
  * The quality associated with each process varies according to the circumstances. <b><b>TextRenderingHintClearTypeGridFit</b></b> provides the best quality for most LCD monitors and relatively small font sizes. <b><b>TextRenderingHintAntiAlias</b></b> provides the best quality for rotated text. Generally, a process that produces higher quality text is slower than a process that produces lower quality text.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//gdiplusenums/ne-gdiplusenums-textrenderinghint
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class TextRenderingHint{

    /**
     * Specifies that a character is drawn using the currently selected system font smoothing mode (also called a rendering hint).
     * @type {Integer (Int32)}
     */
    static TextRenderingHintSystemDefault => 0

    /**
     * Specifies that a character is drawn using its glyph bitmap and hinting to improve character appearance on stems and curvature.
     * @type {Integer (Int32)}
     */
    static TextRenderingHintSingleBitPerPixelGridFit => 1

    /**
     * Specifies that a character is drawn using its glyph bitmap and no hinting. This results in better performance at the expense of quality.
     * @type {Integer (Int32)}
     */
    static TextRenderingHintSingleBitPerPixel => 2

    /**
     * Specifies that a character is drawn using its antialiased glyph bitmap and hinting. This results in much better quality due to antialiasing at a higher performance cost.
     * @type {Integer (Int32)}
     */
    static TextRenderingHintAntiAliasGridFit => 3

    /**
     * Specifies that a character is drawn using its antialiased glyph bitmap and no hinting. Stem width differences may be noticeable because hinting is turned off.
     * @type {Integer (Int32)}
     */
    static TextRenderingHintAntiAlias => 4

    /**
     * Specifies that a character is drawn using its glyph ClearType bitmap and hinting. This type of text rendering cannot be used along with <a href="https://docs.microsoft.com/windows/desktop/api/gdiplusenums/ne-gdiplusenums-compositingmode">CompositingModeSourceCopy</a>. 
 * 				
 * 
 * Windows XP and Windows Server 2003 and later versions of Windows only: ClearType rendering is supported only on Windows XP and Windows Server 2003 and later versions of Windows. Therefore, <a href="https://docs.microsoft.com/windows/desktop/api/gdiplusenums/ne-gdiplusenums-textrenderinghint">TextRenderingHintClearTypeGridFit</a> is ignored on other operating systems even though GDI+ is supported on those operating systems.
     * @type {Integer (Int32)}
     */
    static TextRenderingHintClearTypeGridFit => 5
}
