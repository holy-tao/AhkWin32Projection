#Requires AutoHotkey v2.0.0 64-bit

/**
 * Identifiers for the properties of the Color matrix effect.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1effects/ne-d2d1effects-d2d1_colormatrix_prop
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_COLORMATRIX_PROP{

    /**
     * A 5x4 matrix of float values. The elements in the matrix are not bounded and are unitless.
 *           
 * 
 * The type is <a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-matrix-5x4-f">D2D1_MATRIX_5X4_F</a>.
 * 
 * The default value is the identity matrix, Matrix5x4F(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0).
     * @type {Integer (Int32)}
     */
    static D2D1_COLORMATRIX_PROP_COLOR_MATRIX => 0

    /**
     * The alpha mode of the output. 
 *           
 * 
 * The type is <a href="https://docs.microsoft.com/windows/desktop/api/d2d1effects/ne-d2d1effects-d2d1_colormatrix_alpha_mode">D2D1_COLORMATRIX_ALPHA_MODE</a>.
 * 
 * The default value is D2D1_COLORMATRIX_ALPHA_MODE_PREMULTIPLIED.
     * @type {Integer (Int32)}
     */
    static D2D1_COLORMATRIX_PROP_ALPHA_MODE => 1

    /**
     * Whether the effect clamps color values to between 0 and 1 before the effect passes the values to the next effect in the graph. 
 *           The effect clamps the values before it premultiplies the alpha.
 *           
 * 
 * If you set this to TRUE the effect will clamp the values. If you set this to FALSE, the effect will not clamp the color values, 
 *           but other effects and the output surface may clamp the values if they are not of high enough precision.
 * 
 * The type is BOOL.
 * 
 * The default value is FALSE.
     * @type {Integer (Int32)}
     */
    static D2D1_COLORMATRIX_PROP_CLAMP_OUTPUT => 2
}
