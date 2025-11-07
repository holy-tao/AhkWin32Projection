#Requires AutoHotkey v2.0.0 64-bit

/**
 * Identifiers for the properties of the Arithmetic composite effect.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1effects/ne-d2d1effects-d2d1_arithmeticcomposite_prop
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_ARITHMETICCOMPOSITE_PROP{

    /**
     * The coefficients for the equation used to composite the two input images. The coefficients are unitless and unbounded.
     *             
     * 
     * Type is D2D1_VECTOR_4F.
     * 
     * Default value is {1.0f, 0.0f, 0.0f, 0.0f}.
     * @type {Integer (Int32)}
     */
    static D2D1_ARITHMETICCOMPOSITE_PROP_COEFFICIENTS => 0

    /**
     * The effect clamps color values to between 0 and 1 before the effect passes the values to the next effect in the graph.
     *             If you set this to TRUE the effect will clamp the values. If you set this to FALSE, the effect will not clamp the color values, 
     *             but other effects and the output surface may clamp the values if they are not of high enough precision.
     *             
     * 
     * Type is BOOL.
     * 
     * Default value is FALSE.
     * @type {Integer (Int32)}
     */
    static D2D1_ARITHMETICCOMPOSITE_PROP_CLAMP_OUTPUT => 1
}
