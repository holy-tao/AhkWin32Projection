#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DWRITE_MATRIX structure specifies the graphics transform to be applied to rendered glyphs.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_matrix
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class DWRITE_MATRIX extends Win32Struct
{
    static sizeof => 24

    static packingSize => 4

    /**
     * Type: <b>FLOAT</b>
     * 
     * A value indicating the horizontal scaling / cosine of rotation.
     * @type {Float}
     */
    m11 {
        get => NumGet(this, 0, "float")
        set => NumPut("float", value, this, 0)
    }

    /**
     * Type: <b>FLOAT</b>
     * 
     * A value indicating the vertical shear / sine of rotation.
     * @type {Float}
     */
    m12 {
        get => NumGet(this, 4, "float")
        set => NumPut("float", value, this, 4)
    }

    /**
     * Type: <b>FLOAT</b>
     * 
     * A value indicating the horizontal shear / negative sine of rotation.
     * @type {Float}
     */
    m21 {
        get => NumGet(this, 8, "float")
        set => NumPut("float", value, this, 8)
    }

    /**
     * Type: <b>FLOAT</b>
     * 
     * A value indicating the vertical scaling / cosine of rotation.
     * @type {Float}
     */
    m22 {
        get => NumGet(this, 12, "float")
        set => NumPut("float", value, this, 12)
    }

    /**
     * Type: <b>FLOAT</b>
     * 
     * A value indicating the horizontal shift (always orthogonal regardless of rotation).
     * @type {Float}
     */
    dx {
        get => NumGet(this, 16, "float")
        set => NumPut("float", value, this, 16)
    }

    /**
     * Type: <b>FLOAT</b>
     * 
     * A value indicating the vertical shift (always orthogonal regardless of rotation.)
     * @type {Float}
     */
    dy {
        get => NumGet(this, 20, "float")
        set => NumPut("float", value, this, 20)
    }
}
