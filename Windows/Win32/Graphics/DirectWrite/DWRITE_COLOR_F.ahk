#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes the red, green, blue, and alpha components of a color. | DWRITE_COLOR_F (Dwrite\_2.h)
 * @remarks
 * For more information, see [**D3DCOLORVALUE**](../direct3d9/d3dcolorvalue.md).
 * @see https://learn.microsoft.com/windows/win32/DirectWrite/dwrite-color-f
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct DWRITE_COLOR_F {
    #StructPack 4

    r : Float32

    g : Float32

    b : Float32

    a : Float32

}
