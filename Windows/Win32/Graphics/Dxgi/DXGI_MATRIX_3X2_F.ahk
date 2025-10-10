#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents a 3x2 matrix. Used with GetMatrixTransform and SetMatrixTransform to indicate the scaling and translation transform for SwapChainPanel swap chains.
 * @see https://docs.microsoft.com/windows/win32/api//dxgi1_3/ns-dxgi1_3-dxgi_matrix_3x2_f
 * @namespace Windows.Win32.Graphics.Dxgi
 * @version v4.0.30319
 */
class DXGI_MATRIX_3X2_F extends Win32Struct
{
    static sizeof => 24

    static packingSize => 4

    /**
     * The value in the first row and first column of the matrix.
     * @type {Float}
     */
    _11 {
        get => NumGet(this, 0, "float")
        set => NumPut("float", value, this, 0)
    }

    /**
     * The value in the first row and second column of the matrix.
     * @type {Float}
     */
    _12 {
        get => NumGet(this, 4, "float")
        set => NumPut("float", value, this, 4)
    }

    /**
     * The value in the second row and first column of the matrix.
     * @type {Float}
     */
    _21 {
        get => NumGet(this, 8, "float")
        set => NumPut("float", value, this, 8)
    }

    /**
     * The value in the second row and second column of the matrix.
     * @type {Float}
     */
    _22 {
        get => NumGet(this, 12, "float")
        set => NumPut("float", value, this, 12)
    }

    /**
     * The value in the third row and first column of the matrix.
     * @type {Float}
     */
    _31 {
        get => NumGet(this, 16, "float")
        set => NumPut("float", value, this, 16)
    }

    /**
     * The value in the third row and second column of the matrix.
     * @type {Float}
     */
    _32 {
        get => NumGet(this, 20, "float")
        set => NumPut("float", value, this, 20)
    }
}
