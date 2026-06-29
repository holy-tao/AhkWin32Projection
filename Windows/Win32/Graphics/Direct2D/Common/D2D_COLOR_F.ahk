#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes the red, green, blue, and alpha components of a color. | D2D_COLOR_F (D2DBaseTypes.h)
 * @remarks
 * For more information, see [**D3DCOLORVALUE**](/previous-versions/windows/desktop/legacy/dd368193(v=vs.85)).
 * @see https://learn.microsoft.com/windows/win32/Direct2D/d2d-color-f
 * @namespace Windows.Win32.Graphics.Direct2D.Common
 */
export default struct D2D_COLOR_F {
    #StructPack 4

    r : Float32

    g : Float32

    b : Float32

    a : Float32

}
