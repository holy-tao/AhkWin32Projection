#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies a value for the SVG visibility property.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1svg/ne-d2d1svg-d2d1_svg_visibility
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_SVG_VISIBILITY extends Win32Enum{

    /**
     * The element is visible.
     * @type {Integer (Int32)}
     */
    static D2D1_SVG_VISIBILITY_VISIBLE => 0

    /**
     * The element is invisible.
     * @type {Integer (Int32)}
     */
    static D2D1_SVG_VISIBILITY_HIDDEN => 1
}
