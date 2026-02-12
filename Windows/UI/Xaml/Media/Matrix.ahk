#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents a 3 × 3 affine transformation matrix used for transformations in two-dimensional space.
 * @remarks
 * A 3×3 matrix is used for transformations in a two-dimensional x-y plane. Affine transformation matrices can be multiplied to form any number of linear transformations, such as rotation and skew (shear), followed by translation. An affine transformation matrix has its final column equal to (0, 0, 1), so only the members in the first two columns need to be specified. Note that vectors are expressed as row-vectors, not column vectors.
 * 
 * A Matrix is stored using row-major order and has the following structure:
 * 
 * <table>
 *    <tr><td>M11</td><td>M12</td><td>0</td></tr>
 *    <tr><td>M21</td><td>M22</td><td>0</td></tr>
 *    <tr><td>OffsetX</td><td>OffsetY</td><td>1</td></tr>
 * </table>
 * 
 * The members in the last row, **OffsetX** and **OffsetY**, represent translation values.
 * 
 * In methods and properties, the transformation matrix is usually specified as a vector with only six members, as follows: (**M11**, **M12**, **M21**, **M22**, **OffsetX**, **OffsetY**)
 * 
 * Although you can use a Matrix structure directly to translate individual points, or with a [MatrixTransform](matrixtransform.md) to transform objects, the Windows Runtime also provides a set of classes that can transform objects without working directly with matrices:
 * + [RotateTransform](rotatetransform.md)
 * + [ScaleTransform](scaletransform.md)
 * + [SkewTransform](skewtransform.md)
 * + [TranslateTransform](translatetransform.md)
 * 
 * 
 * Properties of a Matrix can be animated (as one or more [DoubleAnimation](../windows.ui.xaml.media.animation/doubleanimation.md) animations or [DoubleAnimationUsingKeyFrames](../windows.ui.xaml.media.animation/doubleanimationusingkeyframes.md)).
 * 
 * Matrix is the property value for the [MatrixTransform.Matrix](matrixtransform_matrix.md) property. Related types can be used for transformation matrices in three-dimensional space and then used for a projection. See [Matrix3D](../windows.ui.xaml.media.media3d/matrix3d.md) and [Matrix3DProjection](matrix3dprojection.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.matrix
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class Matrix extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * The value of the first row and first column of this Matrix structure.
     * @type {Float}
     */
    M11 {
        get => NumGet(this, 0, "double")
        set => NumPut("double", value, this, 0)
    }

    /**
     * The value of the first row and second column of this Matrix structure.
     * @type {Float}
     */
    M12 {
        get => NumGet(this, 8, "double")
        set => NumPut("double", value, this, 8)
    }

    /**
     * The value of the second row and first column of this Matrix structure.
     * @type {Float}
     */
    M21 {
        get => NumGet(this, 16, "double")
        set => NumPut("double", value, this, 16)
    }

    /**
     * The value of the second row and second column of this Matrix structure.
     * @type {Float}
     */
    M22 {
        get => NumGet(this, 24, "double")
        set => NumPut("double", value, this, 24)
    }

    /**
     * Gets or sets the value of the third row and first column of this Matrix structure.
     * @type {Float}
     */
    OffsetX {
        get => NumGet(this, 32, "double")
        set => NumPut("double", value, this, 32)
    }

    /**
     * Gets or sets the value of the third row and second column of this Matrix structure.
     * @type {Float}
     */
    OffsetY {
        get => NumGet(this, 40, "double")
        set => NumPut("double", value, this, 40)
    }
}
