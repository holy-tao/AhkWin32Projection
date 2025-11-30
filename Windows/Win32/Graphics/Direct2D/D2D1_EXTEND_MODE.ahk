#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies how a brush paints areas outside of its normal content area.
 * @remarks
 * 
 * For an <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1bitmapbrush">ID2D1BitmapBrush</a>, the brush's content is the brush's bitmap. For an <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1lineargradientbrush">ID2D1LinearGradientBrush</a>, the brush's content area is the gradient axis. For an <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1radialgradientbrush">ID2D1RadialGradientBrush</a>, the brush's content is the area within the gradient ellipse.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d2d1/ne-d2d1-d2d1_extend_mode
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_EXTEND_MODE extends Win32Enum{

    /**
     * Repeat the edge pixels of the brush's content for all regions outside the normal content area.
     * @type {Integer (Int32)}
     */
    static D2D1_EXTEND_MODE_CLAMP => 0

    /**
     * Repeat the brush's content.
     * @type {Integer (Int32)}
     */
    static D2D1_EXTEND_MODE_WRAP => 1

    /**
     * The same as D2D1_EXTEND_MODE_WRAP, except that alternate tiles of the brush's content are flipped. (The brush's normal content is drawn untransformed.)
     * @type {Integer (Int32)}
     */
    static D2D1_EXTEND_MODE_MIRROR => 2
}
