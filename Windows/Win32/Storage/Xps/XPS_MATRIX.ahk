#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

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
 * @version v4.0.30319
 */
class XPS_MATRIX extends Win32Struct
{
    static sizeof => 24

    static packingSize => 4

    /**
     * The value in the left column of the first row of the matrix.
     * @type {Float}
     */
    m11 {
        get => NumGet(this, 0, "float")
        set => NumPut("float", value, this, 0)
    }

    /**
     * The value in the center column of the first row of the matrix.
     * @type {Float}
     */
    m12 {
        get => NumGet(this, 4, "float")
        set => NumPut("float", value, this, 4)
    }

    /**
     * The value in the left column of the second row of the matrix.
     * @type {Float}
     */
    m21 {
        get => NumGet(this, 8, "float")
        set => NumPut("float", value, this, 8)
    }

    /**
     * The value in the center column of the second row of the matrix.
     * @type {Float}
     */
    m22 {
        get => NumGet(this, 12, "float")
        set => NumPut("float", value, this, 12)
    }

    /**
     * The value in the left column of the third row of the matrix. This value is also the x-offset.
     * @type {Float}
     */
    m31 {
        get => NumGet(this, 16, "float")
        set => NumPut("float", value, this, 16)
    }

    /**
     * The value in the center column of the third row of the matrix. This value is also the y-offset.
     * @type {Float}
     */
    m32 {
        get => NumGet(this, 20, "float")
        set => NumPut("float", value, this, 20)
    }
}
