#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents a 3x3 matrix.
 * @see https://learn.microsoft.com/windows/win32/api/mileffects/ns-mileffects-milmatrix3x2d
 * @namespace Windows.Win32.Graphics.Dwm
 */
export default struct MilMatrix3x2D {
    #StructPack 8

    /**
     * Type: <b>DOUBLE</b>
     * 
     * The value of the first row and first column of the matrix.
     */
    S_11 : Float64

    /**
     * Type: <b>DOUBLE</b>
     * 
     * The value of the first row and first second of the matrix.
     */
    S_12 : Float64

    /**
     * Type: <b>DOUBLE</b>
     * 
     * The value of the second row and first column of the matrix.
     */
    S_21 : Float64

    /**
     * Type: <b>DOUBLE</b>
     * 
     * The value of the second row and second column of the matrix.
     */
    S_22 : Float64

    /**
     * Type: <b>DOUBLE</b>
     */
    DX : Float64

    /**
     * Type: <b>DOUBLE</b>
     */
    DY : Float64

}
