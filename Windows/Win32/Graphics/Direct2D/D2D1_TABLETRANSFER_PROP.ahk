#Requires AutoHotkey v2.0.0 64-bit

/**
 * Identifiers for properties of the Table transfer effect.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1effects/ne-d2d1effects-d2d1_tabletransfer_prop
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_TABLETRANSFER_PROP{

    /**
     * The list of values used to define the transfer function for the Red channel.
 *             
 * 
 * The type is FLOAT[].
 * 
 * The default is {0.0f, 1.0f}.
     * @type {Integer (Int32)}
     */
    static D2D1_TABLETRANSFER_PROP_RED_TABLE => 0

    /**
     * If you set this to TRUE the effect does not apply the transfer function to the Red channel.
 *             If you set this to FALSE it applies the RedTableTransfer function to the Red channel.
 *             
 * 
 * The type is BOOL.
 * 
 * The default is FALSE.
     * @type {Integer (Int32)}
     */
    static D2D1_TABLETRANSFER_PROP_RED_DISABLE => 1

    /**
     * The list of values used to define the transfer function for the Green channel.
 *             
 * 
 * The type is FLOAT[].
 * 
 * The default is {0.0f, 1.0f}.
     * @type {Integer (Int32)}
     */
    static D2D1_TABLETRANSFER_PROP_GREEN_TABLE => 2

    /**
     * If you set this to TRUE the effect does not apply the transfer function to the Green channel.
 *             If you set this to FALSE it applies the GreenTableTransfer function to the Green channel.
 *             
 * 
 * The type is BOOL.
 * 
 * The default is FALSE.
     * @type {Integer (Int32)}
     */
    static D2D1_TABLETRANSFER_PROP_GREEN_DISABLE => 3

    /**
     * The list of values used to define the transfer function for the Blue channel.
 *             
 * 
 * The type is FLOAT[].
 * 
 * The default is {0.0f, 1.0f}.
     * @type {Integer (Int32)}
     */
    static D2D1_TABLETRANSFER_PROP_BLUE_TABLE => 4

    /**
     * If you set this to TRUE the effect does not apply the transfer function to the Blue channel.
 *             If you set this to FALSE it applies the BlueTableTransfer function to the Blue channel.
 *             
 * 
 * The type is BOOL.
 * 
 * The default is FALSE.
     * @type {Integer (Int32)}
     */
    static D2D1_TABLETRANSFER_PROP_BLUE_DISABLE => 5

    /**
     * The list of values used to define the transfer function for the Alpha channel.
 *             
 * 
 * The type is FLOAT[].
 * 
 * The default is {0.0f, 1.0f}.
     * @type {Integer (Int32)}
     */
    static D2D1_TABLETRANSFER_PROP_ALPHA_TABLE => 6

    /**
     * If you set this to TRUE the effect does not apply the transfer function to the Alpha channel.
 *             If you set this to FALSE it applies the AlphaTableTransfer function to the Alpha channel.
 *             
 * 
 * The type is BOOL.
 * 
 * The default is FALSE.
     * @type {Integer (Int32)}
     */
    static D2D1_TABLETRANSFER_PROP_ALPHA_DISABLE => 7

    /**
     * Whether the effect clamps color values to between 0 and 1 before the effect passes the values to the next effect in the graph. The effect clamps the values before it premultiplies the alpha.
 *             
 * 
 * If you set this to TRUE the effect will clamp the values. If you set this to FALSE, the effect will not clamp the color values, 
 *             but other effects and the output surface may clamp the values if they are not of high enough precision.
 * 
 * The type is BOOL.
 * 
 * The default is FALSE.
     * @type {Integer (Int32)}
     */
    static D2D1_TABLETRANSFER_PROP_CLAMP_OUTPUT => 8
}
