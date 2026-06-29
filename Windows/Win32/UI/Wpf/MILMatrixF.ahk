#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents a 4x4 affine transformation matrix.
 * @see https://learn.microsoft.com/windows/win32/api/mileffects/ns-mileffects-milmatrixf
 * @namespace Windows.Win32.UI.Wpf
 */
export default struct MILMatrixF {
    #StructPack 8

    /**
     * Type: <b>DOUBLE</b>
     * 
     * The value of the first row and first column of the matrix.
     */
    _11 : Float64

    /**
     * Type: <b>DOUBLE</b>
     * 
     * The value of the first row and second column of the matrix.
     */
    _12 : Float64

    /**
     * Type: <b>DOUBLE</b>
     * 
     * The value of the first row and third column of the matrix.
     */
    _13 : Float64

    /**
     * Type: <b>DOUBLE</b>
     * 
     * The value of the first row and forth column of the matrix.
     */
    _14 : Float64

    /**
     * Type: <b>DOUBLE</b>
     * 
     * The value of the second row and first column of the matrix.
     */
    _21 : Float64

    /**
     * Type: <b>DOUBLE</b>
     * 
     * The value of the second row and second column of the matrix.
     */
    _22 : Float64

    /**
     * Type: <b>DOUBLE</b>
     * 
     * The value of the fisecondrst row and third column of the matrix.
     */
    _23 : Float64

    /**
     * Type: <b>DOUBLE</b>
     * 
     * The value of the second row and forth column of the matrix.
     */
    _24 : Float64

    /**
     * Type: <b>DOUBLE</b>
     * 
     * The value of the third row and first column of the matrix.
     */
    _31 : Float64

    /**
     * Type: <b>DOUBLE</b>
     * 
     * The value of the third row and second column of the matrix.
     */
    _32 : Float64

    /**
     * Type: <b>DOUBLE</b>
     * 
     * The value of the third row and third column of the matrix.
     */
    _33 : Float64

    /**
     * Type: <b>DOUBLE</b>
     * 
     * The value of the third row and forth column of the matrix.
     */
    _34 : Float64

    /**
     * Type: <b>DOUBLE</b>
     * 
     * The value of the forth row and first column of the matrix.
     */
    _41 : Float64

    /**
     * Type: <b>DOUBLE</b>
     * 
     * The value of the forth row and second column of the matrix.
     */
    _42 : Float64

    /**
     * Type: <b>DOUBLE</b>
     * 
     * The value of the forth row and third column of the matrix.
     */
    _43 : Float64

    /**
     * Type: <b>DOUBLE</b>
     * 
     * The value of the forth row and forth column of the matrix.
     */
    _44 : Float64

}
