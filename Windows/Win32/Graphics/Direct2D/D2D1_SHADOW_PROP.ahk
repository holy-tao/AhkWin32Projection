#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Identifiers for properties of the Shadow effect.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1effects/ne-d2d1effects-d2d1_shadow_prop
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_SHADOW_PROP extends Win32Enum{

    /**
     * The amount of blur to be applied to the alpha channel of the image. You can compute the blur radius of the kernel by multiplying the standard deviation by 3.
     *             The units of both the standard deviation and blur radius are DIPs.
     *             
     * 
     * This property is the same as the Gaussian Blur standard deviation property.
     * 
     * The type is FLOAT.
     * 
     * The default value is 3.0f.
     * @type {Integer (Int32)}
     */
    static D2D1_SHADOW_PROP_BLUR_STANDARD_DEVIATION => 0

    /**
     * The color of the drop shadow. This property is a D2D1_VECTOR_4F defined as: (R, G, B, A). You must specify this color in straight alpha.
     *             
     * 
     * The type is <a href="https://docs.microsoft.com/windows/desktop/api/dcommon/ns-dcommon-d2d_vector_4f">D2D1_VECTOR_4F</a>.
     * 
     * The default value is {0.0f, 0.0f, 0.0f, 1.0f}.
     * @type {Integer (Int32)}
     */
    static D2D1_SHADOW_PROP_COLOR => 1

    /**
     * The level of performance optimization.
     *             
     * 
     * The type is <a href="https://docs.microsoft.com/windows/desktop/api/d2d1effects/ne-d2d1effects-d2d1_shadow_optimization">D2D1_SHADOW_OPTIMIZATION</a>.
     * 
     * The default value is D2D1_SHADOW_OPTIMIZATION_BALANCED.
     * @type {Integer (Int32)}
     */
    static D2D1_SHADOW_PROP_OPTIMIZATION => 2
}
