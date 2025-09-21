#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents a 3x3 matrix.
 * @see https://learn.microsoft.com/windows/win32/api/mileffects/ns-mileffects-milmatrix3x2d
 * @namespace Windows.Win32.Graphics.Dwm
 * @version v4.0.30319
 */
class MilMatrix3x2D extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * Type: <b>DOUBLE</b>
     * 
     * The value of the first row and first column of the matrix.
     * @type {Float}
     */
    S_11 {
        get => NumGet(this, 0, "double")
        set => NumPut("double", value, this, 0)
    }

    /**
     * Type: <b>DOUBLE</b>
     * 
     * The value of the first row and first second of the matrix.
     * @type {Float}
     */
    S_12 {
        get => NumGet(this, 8, "double")
        set => NumPut("double", value, this, 8)
    }

    /**
     * Type: <b>DOUBLE</b>
     * 
     * The value of the second row and first column of the matrix.
     * @type {Float}
     */
    S_21 {
        get => NumGet(this, 16, "double")
        set => NumPut("double", value, this, 16)
    }

    /**
     * Type: <b>DOUBLE</b>
     * 
     * The value of the second row and second column of the matrix.
     * @type {Float}
     */
    S_22 {
        get => NumGet(this, 24, "double")
        set => NumPut("double", value, this, 24)
    }

    /**
     * Type: <b>DOUBLE</b>
     * @type {Float}
     */
    DX {
        get => NumGet(this, 32, "double")
        set => NumPut("double", value, this, 32)
    }

    /**
     * Type: <b>DOUBLE</b>
     * @type {Float}
     */
    DY {
        get => NumGet(this, 40, "double")
        set => NumPut("double", value, this, 40)
    }
}
