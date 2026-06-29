#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Creates a D2D1_RECT_F structure that contains the specified dimensions.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1helper/nf-d2d1helper-rectf
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
export default struct RectF {
    #StructPack 4

    X : Float32

    Y : Float32

    Width : Float32

    Height : Float32

}
