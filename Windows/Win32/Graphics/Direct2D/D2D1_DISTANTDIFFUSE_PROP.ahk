#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Identifiers for properties of the Distant-diffuse lighting effect.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1effects/ne-d2d1effects-d2d1_distantdiffuse_prop
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_DISTANTDIFFUSE_PROP extends Win32Enum{

    /**
     * The direction angle of the light source in the XY plane relative to the X-axis in the counter clock wise direction. The units are in degrees and must be between 0 and 360 degrees.
     *             
     * 
     * The type is FLOAT.
     * 
     * The default value is 0.0f.
     * @type {Integer (Int32)}
     */
    static D2D1_DISTANTDIFFUSE_PROP_AZIMUTH => 0

    /**
     * The direction angle of the light source in the YZ plane relative to the Y-axis in the counter clock wise direction. The units are in degrees and must be between 0 and 360 degrees. 
     *             
     * 
     * The type is FLOAT.
     * 
     * The default value is 0.0f.
     * @type {Integer (Int32)}
     */
    static D2D1_DISTANTDIFFUSE_PROP_ELEVATION => 1

    /**
     * The ratio of diffuse reflection to amount of incoming light. This property must be between 0 and 10,000 and is unitless. 
     *             
     * 
     * The type is FLOAT.
     * 
     * The default value is 1.0f.
     * @type {Integer (Int32)}
     */
    static D2D1_DISTANTDIFFUSE_PROP_DIFFUSE_CONSTANT => 2

    /**
     * The scale factor in the Z direction. The surface scale is unitless and must be between 0 and 10,000.
     *             
     * 
     * The type is FLOAT.
     * 
     * The default value is 1.0f.
     * @type {Integer (Int32)}
     */
    static D2D1_DISTANTDIFFUSE_PROP_SURFACE_SCALE => 3

    /**
     * The color of the incoming light. This property is exposed as a D2D1_VECTOR_3F – (R, G, B) and used to compute LR, LG, LB. 
     *             
     * 
     * The type is D2D1_VECTOR_3F.
     * 
     * The default value is {1.0f, 1.0f, 1.0f}.
     * @type {Integer (Int32)}
     */
    static D2D1_DISTANTDIFFUSE_PROP_COLOR => 4

    /**
     * The size of an element in the Sobel kernel used to generate the surface normal in the X and Y direction. This property maps to the dx and dy values in the Sobel gradient. This property is a D2D1_VECTOR_2F (Kernel Unit Length X, Kernel Unit Length Y) and is defined in (device-independent pixels (DIPs)/Kernel Unit). The effect uses bilinear interpolation to scale the bitmap to match size of kernel elements. 
     *             
     * 
     * The type is D2D1_VECTOR_2F.
     * 
     * The default value is {1.0f, 1.0f}.
     * @type {Integer (Int32)}
     */
    static D2D1_DISTANTDIFFUSE_PROP_KERNEL_UNIT_LENGTH => 5

    /**
     * The interpolation mode the effect uses to scale the image to the corresponding kernel unit length. There are six scale modes that range in quality and speed.
     *             
     * 
     * The type is D2D1_DISTANTDIFFUSE_SCALE_MODE.
     * 
     * The default value is D2D1_DISTANTDIFFUSE_SCALE_MODE_LINEAR.
     * @type {Integer (Int32)}
     */
    static D2D1_DISTANTDIFFUSE_PROP_SCALE_MODE => 6
}
