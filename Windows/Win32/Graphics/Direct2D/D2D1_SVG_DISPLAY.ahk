#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies a value for the SVG display property.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1svg/ne-d2d1svg-d2d1_svg_display
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_SVG_DISPLAY extends Win32Enum{

    /**
     * The element uses the default display behavior.
     * @type {Integer (Int32)}
     */
    static D2D1_SVG_DISPLAY_INLINE => 0

    /**
     * The element and all children are not rendered directly.
     * @type {Integer (Int32)}
     */
    static D2D1_SVG_DISPLAY_NONE => 1
}
