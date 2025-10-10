#Requires AutoHotkey v2.0.0 64-bit

/**
 * Identifiers for properties of the Point-diffuse lighting effect.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1effects/ne-d2d1effects-d2d1_pointdiffuse_prop
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_POINTDIFFUSE_PROP{

    /**
     * The light position of the point light source. The property is a D2D1_VECTOR_3F defined as (x, y, z). The units are in device-independent pixels (DIPs) and are unbounded.
 *             
 * 
 * The type is <a href="https://docs.microsoft.com/windows/desktop/api/dcommon/ns-dcommon-d2d_vector_3f">D2D1_VECTOR_3F</a>.
 * 
 * The default value is {0.0f, 0.0f, 0.0f}.
     * @type {Integer (Int32)}
     */
    static D2D1_POINTDIFFUSE_PROP_LIGHT_POSITION => 0

    /**
     * The ratio of diffuse reflection to amount of incoming light. This property must be between 0 and 10,000 and is unitless.
 *             
 * 
 * The type is FLOAT.
 * 
 * The default value is 1.0f.
     * @type {Integer (Int32)}
     */
    static D2D1_POINTDIFFUSE_PROP_DIFFUSE_CONSTANT => 1

    /**
     * The scale factor in the Z direction. The surface scale is unitless and must be between 0 and 10,000.
 *             
 * 
 * The type is FLOAT.
 * 
 * The default value is 1.0f.
     * @type {Integer (Int32)}
     */
    static D2D1_POINTDIFFUSE_PROP_SURFACE_SCALE => 2

    /**
     * The color of the incoming light. This property is exposed as a Vector 3 – (R, G, B) and used to compute LR, LG, LB.
 *             
 * 
 * The type is <a href="https://docs.microsoft.com/windows/desktop/api/dcommon/ns-dcommon-d2d_vector_3f">D2D1_VECTOR_3F</a>.
 * 
 * The default value is {1.0f, 1.0f, 1.0f}.
     * @type {Integer (Int32)}
     */
    static D2D1_POINTDIFFUSE_PROP_COLOR => 3

    /**
     * The size of an element in the Sobel kernel used to generate the surface normal in the X and Y direction. This property maps to the dx and dy values in the Sobel gradient. 
 *             This property is a <a href="https://docs.microsoft.com/windows/desktop/api/dcommon/ns-dcommon-d2d_vector_2f">D2D1_VECTOR_2F</a> (Kernel Unit Length X, Kernel Unit Length Y) and is defined in (DIPs/Kernel Unit). 
 *             The effect uses bilinear interpolation to scale the bitmap to match size of kernel elements.
 *             
 * 
 * The type is <a href="https://docs.microsoft.com/windows/desktop/api/dcommon/ns-dcommon-d2d_vector_2f">D2D1_VECTOR_2F</a>.
 * 
 * The default value is {1.0f, 1.0f}.
     * @type {Integer (Int32)}
     */
    static D2D1_POINTDIFFUSE_PROP_KERNEL_UNIT_LENGTH => 4

    /**
     * The interpolation mode the effect uses to scale the image to the corresponding kernel unit length. There are six scale modes that range in quality and speed.
 *             
 * 
 * The type is <a href="https://docs.microsoft.com/windows/desktop/api/d2d1effects/ne-d2d1effects-d2d1_pointdiffuse_scale_mode">D2D1_POINTDIFFUSE_SCALE_MODE</a>.
 * 
 * The default value is D2D1_POINTDIFFUSE_SCALE_MODE_LINEAR.
     * @type {Integer (Int32)}
     */
    static D2D1_POINTDIFFUSE_PROP_SCALE_MODE => 5
}
