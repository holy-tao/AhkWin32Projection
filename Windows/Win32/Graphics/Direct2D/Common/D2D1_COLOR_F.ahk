#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Describes the red, green, blue, and alpha components of a color. | D2D1_COLOR_F (D2DBaseTypes.h)
 * @remarks
 * **D2D1\_COLOR\_F** is a typedef for [**D2D\_COLOR\_F**](d2d-color-f.md), which is itself a typedef for [D3DCOLORVALUE](../direct3d9/d3dcolorvalue.md). For information about the members provided by **D2D1\_COLOR\_F**, see [D3DCOLORVALUE](../direct3d9/d3dcolorvalue.md).
 * 
 * The [**ColorF**](/windows/win32/api/d2d1helper/nl-d2d1helper-colorf) class provides a set of predefined colors and helper functions for defining colors. For more information, see the [**ColorF**](/windows/win32/api/d2d1helper/nl-d2d1helper-colorf) reference.
 * @see https://learn.microsoft.com/windows/win32/Direct2D/d2d1-color-f
 * @namespace Windows.Win32.Graphics.Direct2D.Common
 * @version v4.0.30319
 */
class D2D1_COLOR_F extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * @type {Float}
     */
    r {
        get => NumGet(this, 0, "float")
        set => NumPut("float", value, this, 0)
    }

    /**
     * @type {Float}
     */
    g {
        get => NumGet(this, 4, "float")
        set => NumPut("float", value, this, 4)
    }

    /**
     * @type {Float}
     */
    b {
        get => NumGet(this, 8, "float")
        set => NumPut("float", value, this, 8)
    }

    /**
     * @type {Float}
     */
    a {
        get => NumGet(this, 12, "float")
        set => NumPut("float", value, this, 12)
    }
}
