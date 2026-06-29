#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes the red, green, blue, and alpha components of a color. | D2D1_COLOR_F (D2DBaseTypes.h)
 * @remarks
 * **D2D1\_COLOR\_F** is a typedef for [**D2D\_COLOR\_F**](d2d-color-f.md), which is itself a typedef for [D3DCOLORVALUE](../direct3d9/d3dcolorvalue.md). For information about the members provided by **D2D1\_COLOR\_F**, see [D3DCOLORVALUE](../direct3d9/d3dcolorvalue.md).
 * 
 * The [**ColorF**](/windows/win32/api/d2d1helper/nl-d2d1helper-colorf) class provides a set of predefined colors and helper functions for defining colors. For more information, see the [**ColorF**](/windows/win32/api/d2d1helper/nl-d2d1helper-colorf) reference.
 * @see https://learn.microsoft.com/windows/win32/Direct2D/d2d1-color-f
 * @namespace Windows.Win32.Graphics.Direct2D.Common
 */
export default struct D2D1_COLOR_F {
    #StructPack 4

    r : Float32

    g : Float32

    b : Float32

    a : Float32

}
