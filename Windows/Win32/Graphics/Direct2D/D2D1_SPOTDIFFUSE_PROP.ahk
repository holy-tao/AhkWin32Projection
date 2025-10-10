#Requires AutoHotkey v2.0.0 64-bit

/**
 * Identifiers for properties of the Spot-diffuse lighting effect.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1effects/ne-d2d1effects-d2d1_spotdiffuse_prop
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_SPOTDIFFUSE_PROP{

    /**
     * The light position of the point light source. The property is a D2D1_VECTOR_3F defined as (x, y, z). The units are in device-independent pixels (DIPs) and are unbounded.
 *             
 * 
 * The type is <a href="https://docs.microsoft.com/windows/desktop/api/dcommon/ns-dcommon-d2d_vector_3f">D2D1_VECTOR_3F</a>.
 *             
 * 
 * The default value is {0.0f, 0.0f, 0.0f}.
     * @type {Integer (Int32)}
     */
    static D2D1_SPOTDIFFUSE_PROP_LIGHT_POSITION => 0

    /**
     * Where the spot light is focused. The property is exposed as a D2D1_VECTOR_3F with – (x, y, z). The units are in DIPs and the values are unbounded.
 *             
 * 
 * The type is <a href="https://docs.microsoft.com/windows/desktop/api/dcommon/ns-dcommon-d2d_vector_3f">D2D1_VECTOR_3F</a>.
 *             
 * 
 * The default value is {0.0f, 0.0f, 0.0f}.
     * @type {Integer (Int32)}
     */
    static D2D1_SPOTDIFFUSE_PROP_POINTS_AT => 1

    /**
     * The focus of the spot light. This property is unitless and is defined between 0 and 200.
 *             
 * 
 * The type is FLOAT.
 * 
 * The default value is 1.0f.
     * @type {Integer (Int32)}
     */
    static D2D1_SPOTDIFFUSE_PROP_FOCUS => 2

    /**
     * The cone angle that restricts the region where the light is projected. No light is projected outside the cone. The limiting cone angle is the angle between the spot light axis (the axis between the LightPosition and PointsAt properties) and the spot light cone. This property is defined in degrees and must be between 0 to 90 degrees.
 *             
 * 
 * The type is FLOAT.
 * 
 * The default value is 90.0f.
     * @type {Integer (Int32)}
     */
    static D2D1_SPOTDIFFUSE_PROP_LIMITING_CONE_ANGLE => 3

    /**
     * The ratio of diffuse reflection to amount of incoming light. This property must be between 0 and 10,000 and is unitless.
 *             
 * 
 * The type is FLOAT.
 * 
 * The default value is 1.0f.
     * @type {Integer (Int32)}
     */
    static D2D1_SPOTDIFFUSE_PROP_DIFFUSE_CONSTANT => 4

    /**
     * The scale factor in the Z direction. The surface scale is unitless and must be between 0 and 10,000.
 *             
 * 
 * The type is FLOAT.
 * 
 * The default value is 1.0f.
     * @type {Integer (Int32)}
     */
    static D2D1_SPOTDIFFUSE_PROP_SURFACE_SCALE => 5

    /**
     * The color of the incoming light. This property is exposed as a Vector 3 – (R, G, B) and used to compute L<sub>R</sub>, L<sub>G</sub>, L<sub>B</sub>.
 *             
 * 
 * The type is <a href="https://docs.microsoft.com/windows/desktop/api/dcommon/ns-dcommon-d2d_vector_3f">D2D1_VECTOR_3F</a>.
 * 
 * The default value is {1.0f, 1.0f, 1.0f}
     * @type {Integer (Int32)}
     */
    static D2D1_SPOTDIFFUSE_PROP_COLOR => 6

    /**
     * The size of an element in the Sobel kernel used to generate the surface normal in the X and Y direction. This property maps to the dx and dy values in the Sobel gradient. 
 *             This property is a <a href="https://docs.microsoft.com/windows/desktop/api/dcommon/ns-dcommon-d2d_vector_2f">D2D1_VECTOR_2F</a>(Kernel Unit Length X, Kernel Unit Length Y) and is defined in (DIPs/Kernel Unit). 
 *             The effect uses bilinear interpolation to scale the bitmap to match size of kernel elements.
 *             
 * 
 * The type is <a href="https://docs.microsoft.com/windows/desktop/api/dcommon/ns-dcommon-d2d_vector_2f">D2D1_VECTOR_2F</a>.
 *             
 * 
 * The default value is {1.0f, 1.0f}.
     * @type {Integer (Int32)}
     */
    static D2D1_SPOTDIFFUSE_PROP_KERNEL_UNIT_LENGTH => 7

    /**
     * The interpolation mode the effect uses to scale the image to the corresponding kernel unit length. There are six scale modes that range in quality and speed.
 *             
 * 
 * The type is <a href="https://docs.microsoft.com/windows/desktop/api/d2d1effects/ne-d2d1effects-d2d1_spotdiffuse_scale_mode">D2D1_SPOTDIFFUSE_SCALE_MODE</a>.
 *             
 * 
 * The default value is D2D1_SPOTDIFFUSE_SCALE_MODE_LINEAR.
     * @type {Integer (Int32)}
     */
    static D2D1_SPOTDIFFUSE_PROP_SCALE_MODE => 8
}
