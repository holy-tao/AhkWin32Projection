#Requires AutoHotkey v2.0.0 64-bit

/**
 * The MatrixOrder enumeration specifies the order of multiplication when a new matrix is multiplied by an existing matrix.
 * @see https://docs.microsoft.com/windows/win32/api//gdiplusenums/ne-gdiplusenums-matrixorder
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class MatrixOrder{

    /**
     * Specifies that the new matrix is on the left and the existing matrix is on the right.
     * @type {Integer (Int32)}
     */
    static MatrixOrderPrepend => 0

    /**
     * Specifies that the existing matrix is on the left and the new matrix is on the right.
     * @type {Integer (Int32)}
     */
    static MatrixOrderAppend => 1
}
