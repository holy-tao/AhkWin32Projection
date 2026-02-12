#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Represents a 4 × 4 matrix that is used for transformations in a 3-D space. Used as a value for [Matrix3DProjection.ProjectionMatrix](../windows.ui.xaml.media/matrix3dprojection_projectionmatrix.md).
 * @remarks
 * You can use the [Matrix3DProjection](../windows.ui.xaml.media/matrix3dprojection.md) and Matrix3D types for more complex semi–3-D scenarios than are possible with the [PlaneProjection](../windows.ui.xaml.media/planeprojection.md) type. [Matrix3DProjection](../windows.ui.xaml.media/matrix3dprojection.md) provides a complete 3-D transform matrix to apply to any [UIElement](../windows.ui.xaml/uielement.md) (you use this as a value for the [UIElement.Projection](../windows.ui.xaml/uielement_projection.md) property). The matrix lets you apply arbitrary model transform matrices and perspective matrices to visual elements.
 * 
 * Matrix3D has this row-vector syntax:<table>
 *    <tr><td>M11</td><td>M12</td><td>M13</td><td>M14</td></tr>
 *    <tr><td>M21</td><td>M22</td><td>M23</td><td>M24</td></tr>
 *    <tr><td>M31</td><td>M32</td><td>M33</td><td>M34</td></tr>
 *    <tr><td>OffsetX</td><td>OffsetY</td><td>OffsetZ</td><td>M44</td></tr>
 * </table>
 * 
 * Because the fourth column is accessible, Matrix3D can represent both affine and non-affine transforms.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.media3d.matrix3d
 * @namespace Windows.UI.Xaml.Media.Media3D
 * @version WindowsRuntime 1.4
 */
class Matrix3D extends Win32Struct
{
    static sizeof => 128

    static packingSize => 8

    /**
     * The value of the first row and first column of this Matrix3D.
     * @type {Float}
     */
    M11 {
        get => NumGet(this, 0, "double")
        set => NumPut("double", value, this, 0)
    }

    /**
     * The value of the first row and second column of this Matrix3D.
     * @type {Float}
     */
    M12 {
        get => NumGet(this, 8, "double")
        set => NumPut("double", value, this, 8)
    }

    /**
     * The value of the first row and third column of this Matrix3D.
     * @type {Float}
     */
    M13 {
        get => NumGet(this, 16, "double")
        set => NumPut("double", value, this, 16)
    }

    /**
     * The value of the first row and fourth column of this Matrix3D.
     * @type {Float}
     */
    M14 {
        get => NumGet(this, 24, "double")
        set => NumPut("double", value, this, 24)
    }

    /**
     * The value of the second row and first column of this Matrix3D.
     * @type {Float}
     */
    M21 {
        get => NumGet(this, 32, "double")
        set => NumPut("double", value, this, 32)
    }

    /**
     * The value of the second row and second column of this Matrix3D.
     * @type {Float}
     */
    M22 {
        get => NumGet(this, 40, "double")
        set => NumPut("double", value, this, 40)
    }

    /**
     * The value of the second row and third column of this Matrix3D.
     * @type {Float}
     */
    M23 {
        get => NumGet(this, 48, "double")
        set => NumPut("double", value, this, 48)
    }

    /**
     * The value of the second row and fourth column of this Matrix3D.
     * @type {Float}
     */
    M24 {
        get => NumGet(this, 56, "double")
        set => NumPut("double", value, this, 56)
    }

    /**
     * The value of the third row and first column of this Matrix3D.
     * @type {Float}
     */
    M31 {
        get => NumGet(this, 64, "double")
        set => NumPut("double", value, this, 64)
    }

    /**
     * The value of the third row and second column of this Matrix3D.
     * @type {Float}
     */
    M32 {
        get => NumGet(this, 72, "double")
        set => NumPut("double", value, this, 72)
    }

    /**
     * The value of the third row and third column of this Matrix3D.
     * @type {Float}
     */
    M33 {
        get => NumGet(this, 80, "double")
        set => NumPut("double", value, this, 80)
    }

    /**
     * The value of the third row and fourth column of this Matrix3D.
     * @type {Float}
     */
    M34 {
        get => NumGet(this, 88, "double")
        set => NumPut("double", value, this, 88)
    }

    /**
     * The value of the fourth row and first column of this Matrix3D.
     * @type {Float}
     */
    OffsetX {
        get => NumGet(this, 96, "double")
        set => NumPut("double", value, this, 96)
    }

    /**
     * The value of the fourth row and second column of this Matrix3D.
     * @type {Float}
     */
    OffsetY {
        get => NumGet(this, 104, "double")
        set => NumPut("double", value, this, 104)
    }

    /**
     * The value of the fourth row and third column of this Matrix3D.
     * @type {Float}
     */
    OffsetZ {
        get => NumGet(this, 112, "double")
        set => NumPut("double", value, this, 112)
    }

    /**
     * The value of the fourth row and fourth column of this Matrix3D.
     * @type {Float}
     */
    M44 {
        get => NumGet(this, 120, "double")
        set => NumPut("double", value, this, 120)
    }
}
