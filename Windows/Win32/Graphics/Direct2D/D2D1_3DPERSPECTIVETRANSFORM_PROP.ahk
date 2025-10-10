#Requires AutoHotkey v2.0.0 64-bit

/**
 * Identifiers for the properties of the 3D perspective transform effect.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1effects/ne-d2d1effects-d2d1_3dperspectivetransform_prop
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_3DPERSPECTIVETRANSFORM_PROP{

    /**
     * The interpolation mode the effect uses on the image. There are 5 scale modes that range in quality and speed.
 *             
 * 
 * Type is D2D1_3DPERSPECTIVETRANSFORM_INTERPOLATION_MODE.
 * 
 * Default value is D2D1_3DPERSPECTIVETRANSFORM_INTERPOLATION_MODE_LINEAR.
     * @type {Integer (Int32)}
     */
    static D2D1_3DPERSPECTIVETRANSFORM_PROP_INTERPOLATION_MODE => 0

    /**
     * The mode used to calculate the border of the image, soft or hard. See Border modes for more info.
 *             
 * 
 * Type is D2D1_BORDER_MODE.
 * 
 * Default value is D2D1_BORDER_MODE_SOFT.
     * @type {Integer (Int32)}
     */
    static D2D1_3DPERSPECTIVETRANSFORM_PROP_BORDER_MODE => 1

    /**
     * The distance from the PerspectiveOrigin to the projection plane. The value specified in DIPs and must be greater than 0.
 *             
 * 
 * Type is FLOAT.
 * 
 * Default value is 1000.0f.
     * @type {Integer (Int32)}
     */
    static D2D1_3DPERSPECTIVETRANSFORM_PROP_DEPTH => 2

    /**
     * The X and Y location of the viewer in the 3D scene. This property is a D2D1_VECTOR_2F defined as: (point X, point Y). The units are in DIPs.
 *             You set the Z value with the Depth property.
 *             
 * 
 * Type is D2D1_VECTOR_2F.
 * 
 * Default value is {0.0f, 0.0f}.
     * @type {Integer (Int32)}
     */
    static D2D1_3DPERSPECTIVETRANSFORM_PROP_PERSPECTIVE_ORIGIN => 3

    /**
     * A translation the effect performs before it rotates the projection plane. This property is a D2D1_VECTOR_3F defined as: (X, Y, Z). The units are in DIPs.
 *             
 * 
 * Type is D2D1_VECTOR_3F.
 * 
 * Default value is {0.0f, 0.0f, 0.0f}.
     * @type {Integer (Int32)}
     */
    static D2D1_3DPERSPECTIVETRANSFORM_PROP_LOCAL_OFFSET => 4

    /**
     * A translation the effect performs after it rotates the projection plane. This property is a D2D1_VECTOR_3F defined as: (X, Y, Z). The units are in DIPs.
 *             
 * 
 * Type is D2D1_VECTOR_3F.
 * 
 * Default value is {0.0f, 0.0f, 0.0f}.
     * @type {Integer (Int32)}
     */
    static D2D1_3DPERSPECTIVETRANSFORM_PROP_GLOBAL_OFFSET => 5

    /**
     * The center point of the rotation the effect performs. This property is a D2D1_VECTOR_3F defined as: (X, Y, Z). The units are in DIPs.
 *             
 * 
 * Type is D2D1_VECTOR_3F.
 * 
 * Default value is {0.0f, 0.0f, 0.0f}.
     * @type {Integer (Int32)}
     */
    static D2D1_3DPERSPECTIVETRANSFORM_PROP_ROTATION_ORIGIN => 6

    /**
     * The angles of rotation for each axis. This property is a D2D1_VECTOR_3F defined as: (X, Y, Z). The units are in degrees.
 *             
 * 
 * Type is D2D1_VECTOR_3F.
 * 
 * Default value is {0.0f, 0.0f, 0.0f}.
     * @type {Integer (Int32)}
     */
    static D2D1_3DPERSPECTIVETRANSFORM_PROP_ROTATION => 7
}
