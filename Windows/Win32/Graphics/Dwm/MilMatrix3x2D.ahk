#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies a 3x2 matrix that describes a transform.
 * @remarks
 * 
  * In Windows Vista, this structure was named MIL_MATRIX3X2D. It was renamed in Windows 7.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//dwmapi/ns-dwmapi-milmatrix3x2d
 * @namespace Windows.Win32.Graphics.Dwm
 * @version v4.0.30319
 */
class MilMatrix3x2D extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * The value at the (1,1) position of the matrix (first row, first column).
     * @type {Float}
     */
    S_11 {
        get => NumGet(this, 0, "double")
        set => NumPut("double", value, this, 0)
    }

    /**
     * The value at the (1,2) position of the matrix (first row, second column).
     * @type {Float}
     */
    S_12 {
        get => NumGet(this, 8, "double")
        set => NumPut("double", value, this, 8)
    }

    /**
     * The value at the (2,1) position of the matrix (second row, first column).
     * @type {Float}
     */
    S_21 {
        get => NumGet(this, 16, "double")
        set => NumPut("double", value, this, 16)
    }

    /**
     * The value at the (2,2) position of the matrix (second row, second column).
     * @type {Float}
     */
    S_22 {
        get => NumGet(this, 24, "double")
        set => NumPut("double", value, this, 24)
    }

    /**
     * The value at the (3,1) position of the matrix (third row, first column).
     * @type {Float}
     */
    DX {
        get => NumGet(this, 32, "double")
        set => NumPut("double", value, this, 32)
    }

    /**
     * The value at the (3,2) position of the matrix (third row, second column).
     * @type {Float}
     */
    DY {
        get => NumGet(this, 40, "double")
        set => NumPut("double", value, this, 40)
    }
}
