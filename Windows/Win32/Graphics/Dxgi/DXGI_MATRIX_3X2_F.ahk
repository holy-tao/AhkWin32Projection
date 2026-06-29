#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents a 3x2 matrix. Used with GetMatrixTransform and SetMatrixTransform to indicate the scaling and translation transform for SwapChainPanel swap chains.
 * @see https://learn.microsoft.com/windows/win32/api/dxgi1_3/ns-dxgi1_3-dxgi_matrix_3x2_f
 * @namespace Windows.Win32.Graphics.Dxgi
 */
export default struct DXGI_MATRIX_3X2_F {
    #StructPack 4

    /**
     * The value in the first row and first column of the matrix.
     */
    _11 : Float32

    /**
     * The value in the first row and second column of the matrix.
     */
    _12 : Float32

    /**
     * The value in the second row and first column of the matrix.
     */
    _21 : Float32

    /**
     * The value in the second row and second column of the matrix.
     */
    _22 : Float32

    /**
     * The value in the third row and first column of the matrix.
     */
    _31 : Float32

    /**
     * The value in the third row and second column of the matrix.
     */
    _32 : Float32

}
