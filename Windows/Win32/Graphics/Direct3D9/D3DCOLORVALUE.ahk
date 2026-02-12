#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * D3DCOLORVALUE structure (D3D9Types.h) - Describes color values.
 * @remarks
 * You can set the members of this structure to values outside the range of 0 through 1 to implement some unusual effects. Values greater than 1 produce strong lights that tend to wash out a scene. Negative values produce dark lights that actually remove light from a scene.
 * @see https://learn.microsoft.com/windows/win32/ktop-src/direct3d9/d3dcolorvalue
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DCOLORVALUE extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * Type: **float**
     * 
     * 
     * Floating-point value that specifies the red component of a color. This value generally is in the range from 0.0 through 1.0. A value of 0.0 indicates the complete absence of the red component, while a value of 1.0 indicates that red is fully present.
     * @type {Float}
     */
    r {
        get => NumGet(this, 0, "float")
        set => NumPut("float", value, this, 0)
    }

    /**
     * Type: **float**
     * 
     * 
     * Floating-point value that specifies the green component of a color. This value generally is in the range from 0.0 through 1.0. A value of 0.0 indicates the complete absence of the green component, while a value of 1.0 indicates that green is fully present.
     * @type {Float}
     */
    g {
        get => NumGet(this, 4, "float")
        set => NumPut("float", value, this, 4)
    }

    /**
     * Type: **float**
     * 
     * 
     * Floating-point value that specifies the blue component of a color. This value generally is in the range from 0.0 through 1.0. A value of 0.0 indicates the complete absence of the blue component, while a value of 1.0 indicates that blue is fully present.
     * @type {Float}
     */
    b {
        get => NumGet(this, 8, "float")
        set => NumPut("float", value, this, 8)
    }

    /**
     * Type: **float**
     * 
     * 
     * Floating-point value that specifies the alpha component of a color. This value generally is in the range from 0.0 through 1.0. A value of 0.0 indicates fully transparent, while a value of 1.0 indicates fully opaque.
     * @type {Float}
     */
    a {
        get => NumGet(this, 12, "float")
        set => NumPut("float", value, this, 12)
    }
}
