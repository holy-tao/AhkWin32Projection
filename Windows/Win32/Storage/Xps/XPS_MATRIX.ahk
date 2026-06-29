#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes the left two columns of a 3-by-3 matrix.
 * @remarks
 * The values in the third column of the matrix are assumed to be 0, 0, 1.
 * 
 * The following table shows the entire matrix.
 * 
 * <table>
 * <tr>
 * <td>m11</td>
 * <td>m12</td>
 * <td> 0 </td>
 * </tr>
 * <tr>
 * <td>m21</td>
 * <td>m22</td>
 * <td> 0 </td>
 * </tr>
 * <tr>
 * <td>m31</td>
 * <td>m32</td>
 * <td> 1 </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/ns-xpsobjectmodel-xps_matrix
 * @namespace Windows.Win32.Storage.Xps
 */
export default struct XPS_MATRIX {
    #StructPack 4

    /**
     * The value in the left column of the first row of the matrix.
     */
    m11 : Float32

    /**
     * The value in the center column of the first row of the matrix.
     */
    m12 : Float32

    /**
     * The value in the left column of the second row of the matrix.
     */
    m21 : Float32

    /**
     * The value in the center column of the second row of the matrix.
     */
    m22 : Float32

    /**
     * The value in the left column of the third row of the matrix. This value is also the x-offset.
     */
    m31 : Float32

    /**
     * The value in the center column of the third row of the matrix. This value is also the y-offset.
     */
    m32 : Float32

}
