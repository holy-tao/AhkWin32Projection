#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Identifiers for properties of the 3D transform effect.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1effects/ne-d2d1effects-d2d1_3dtransform_prop
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_3DTRANSFORM_PROP extends Win32Enum{

    /**
     * The interpolation mode the effect uses on the image. There are 5 scale modes that range in quality and speed.
     *             
     * 
     * Type is D2D1_3DTRANSFORM_INTERPOLATION_MODE.
     * 
     * Default value is D2D1_3DTRANSFORM_INTERPOLATION_MODE_LINEAR.
     * @type {Integer (Int32)}
     */
    static D2D1_3DTRANSFORM_PROP_INTERPOLATION_MODE => 0

    /**
     * The mode used to calculate the border of the image, soft or hard. See Border modes for more info.
     *             
     * 
     * Type is D2D1_BORDER_MODE.
     * 
     * Default value is D2D1_BORDER_MODE_SOFT.
     * @type {Integer (Int32)}
     */
    static D2D1_3DTRANSFORM_PROP_BORDER_MODE => 1

    /**
     * A 4x4 transform matrix applied to the projection plane. The following matrix calculation is used to map points from one 3D coordinate system
     *               to the transformed 2D coordinate system.
     *             
     * 
     * <img alt="3D Depth Matrix" src="./images/3d_transform_matrix1.png"/>
     * Where:<dl>
     * <dd>X, Y, Z = Input projection plane coordinates</dd>
     * <dd>M<sub>x,y</sub> = Transform Matrix elements
     *                 </dd>
     * <dd>X’, Y’, Z’ =Output projection plane coordinates</dd>
     * </dl>
     * 
     * 
     * The individual matrix elements are not bounded and are unitless. 
     * 
     * Type is D2D1_MATRIX_4X4_F.
     * 
     * Default value is Matrix4x4F(1, 0, 0, 0,
     *               0, 1, 0, 0,
     *               0, 0, 1, 0,
     *               0, 0, 0, 1).
     * @type {Integer (Int32)}
     */
    static D2D1_3DTRANSFORM_PROP_TRANSFORM_MATRIX => 2
}
