#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The CompositingMode enumeration specifies how rendered colors are combined with background colors. This enumeration is used by the Graphics::GetCompositingMode and Graphics::SetCompositingMode methods of the Graphics class.
 * @see https://docs.microsoft.com/windows/win32/api//gdiplusenums/ne-gdiplusenums-compositingmode
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class CompositingMode extends Win32Enum{

    /**
     * Specifies that when a color is rendered, it is blended with the background color. The blend is determined by the alpha component of the color being rendered.
     * @type {Integer (Int32)}
     */
    static CompositingModeSourceOver => 0

    /**
     * Specifies that when a color is rendered, it overwrites the background color. This mode cannot be used along with TextRenderingHintClearTypeGridFit.
     * @type {Integer (Int32)}
     */
    static CompositingModeSourceCopy => 1
}
