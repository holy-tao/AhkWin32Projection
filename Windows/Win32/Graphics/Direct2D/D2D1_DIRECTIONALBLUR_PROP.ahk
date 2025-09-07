#Requires AutoHotkey v2.0.0 64-bit

/**
 * Identifiers for properties of the Directional blur effect.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1effects/ne-d2d1effects-d2d1_directionalblur_prop
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_DIRECTIONALBLUR_PROP{

    /**
     * The amount of blur to be applied to the image. You can compute the blur radius of the kernel by multiplying the standard deviation by 3. 
 *           The units of both the standard deviation and blur radius are DIPs. A value of 0 DIPs disables this effect. 
 *           
 * 
 * The type is FLOAT.
 * 
 * The default value is 3.0f.
     * @type {Integer (Int32)}
     */
    static D2D1_DIRECTIONALBLUR_PROP_STANDARD_DEVIATION => 0

    /**
     * The angle of the blur relative to the x-axis, in the counterclockwise direction. The units are specified in degrees.
 *           
 * 
 * The blur kernel is first generated using the same process as for the Gaussian blur effect. The kernel values are then transformed according to the blur angle.
 * 
 * The type is FLOAT.
 * 
 * The default value is 0.0f.
     * @type {Integer (Int32)}
     */
    static D2D1_DIRECTIONALBLUR_PROP_ANGLE => 1

    /**
     * The optimization mode. See Optimization modes for more info.
 *           
 * 
 * The type is <a href="https://docs.microsoft.com/windows/desktop/api/d2d1effects/ne-d2d1effects-d2d1_directionalblur_optimization">D2D1_DIRECTIONALBLUR_OPTIMIZATION</a>.
 * 
 * The default value is D2D1_DIRECTIONALBLUR_OPTIMIZATION_BALANCED.
     * @type {Integer (Int32)}
     */
    static D2D1_DIRECTIONALBLUR_PROP_OPTIMIZATION => 2

    /**
     * The mode used to calculate the border of the image, soft or hard. See Border modes for more info.
 *           
 * 
 * The type is <a href="https://docs.microsoft.com/windows/desktop/api/d2d1effects/ne-d2d1effects-d2d1_border_mode">D2D1_BORDER_MODE</a>.
 * 
 * The default value is D2D1_BORDER_MODE_SOFT.
     * @type {Integer (Int32)}
     */
    static D2D1_DIRECTIONALBLUR_PROP_BORDER_MODE => 3
}
