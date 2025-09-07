#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Describes the red, green, blue, and alpha components of a color. | D2D_COLOR_F (D2DBaseTypes.h)
 * @remarks
 * For more information, see [**D3DCOLORVALUE**](/previous-versions/windows/desktop/legacy/dd368193(v=vs.85)).
 * @see https://learn.microsoft.com/windows/win32/Direct2D/d2d-color-f
 * @namespace Windows.Win32.Graphics.Direct2D.Common
 * @version v4.0.30319
 */
class D2D_COLOR_F extends Win32Struct
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
