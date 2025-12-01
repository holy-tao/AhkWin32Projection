#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Identifiers for properties of the Linear transfer effect.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1effects/ne-d2d1effects-d2d1_lineartransfer_prop
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_LINEARTRANSFER_PROP extends Win32Enum{

    /**
     * The Y-intercept of the linear function for the Red channel. 
     *           
     * 
     * The type is FLOAT.
     * 
     * The default is 0.0f.
     * @type {Integer (Int32)}
     */
    static D2D1_LINEARTRANSFER_PROP_RED_Y_INTERCEPT => 0

    /**
     * The slope of the linear function for the Red channel.
     *           
     * 
     * The type is FLOAT.
     * 
     * The default is 1.0f.
     * @type {Integer (Int32)}
     */
    static D2D1_LINEARTRANSFER_PROP_RED_SLOPE => 1

    /**
     * If you set this to TRUE the effect does not apply the transfer function to the Red channel. 
     *           If you set this to FALSE the effect applies the RedLinearTransfer function to the Red channel. 
     *           
     * 
     * The type is BOOL.
     * 
     * The default is FALSE.
     * @type {Integer (Int32)}
     */
    static D2D1_LINEARTRANSFER_PROP_RED_DISABLE => 2

    /**
     * The Y-intercept of the linear function for the Green channel. 
     *           
     * 
     * The type is FLOAT.
     * 
     * The default is 0.0f.
     * @type {Integer (Int32)}
     */
    static D2D1_LINEARTRANSFER_PROP_GREEN_Y_INTERCEPT => 3

    /**
     * The slope of the linear function for the Green channel.
     *           
     * 
     * The type is FLOAT.
     * 
     * The default is 1.0f.
     * @type {Integer (Int32)}
     */
    static D2D1_LINEARTRANSFER_PROP_GREEN_SLOPE => 4

    /**
     * If you set this to TRUE the effect does not apply the transfer function to the Green channel. 
     *           If you set this to FALSE the effect applies the GreenLinearTransfer function to the Green channel. 
     *           
     * 
     * The type is BOOL.
     * 
     * The default is FALSE.
     * @type {Integer (Int32)}
     */
    static D2D1_LINEARTRANSFER_PROP_GREEN_DISABLE => 5

    /**
     * The Y-intercept of the linear function for the Blue channel. 
     *           
     * 
     * The type is FLOAT.
     * 
     * The default is 0.0f.
     * @type {Integer (Int32)}
     */
    static D2D1_LINEARTRANSFER_PROP_BLUE_Y_INTERCEPT => 6

    /**
     * The slope of the linear function for the Blue channel.
     *           
     * 
     * The type is FLOAT.
     * 
     * The default is 1.0f.
     * @type {Integer (Int32)}
     */
    static D2D1_LINEARTRANSFER_PROP_BLUE_SLOPE => 7

    /**
     * If you set this to TRUE the effect does not apply the transfer function to the Blue channel. 
     *           If you set this to FALSE the effect applies the BlueLinearTransfer function to the Blue channel. 
     *           
     * 
     * The type is BOOL.
     * 
     * The default is FALSE.
     * @type {Integer (Int32)}
     */
    static D2D1_LINEARTRANSFER_PROP_BLUE_DISABLE => 8

    /**
     * The Y-intercept of the linear function for the Alpha channel. 
     *           
     * 
     * The type is FLOAT.
     * 
     * The default is 0.0f.
     * @type {Integer (Int32)}
     */
    static D2D1_LINEARTRANSFER_PROP_ALPHA_Y_INTERCEPT => 9

    /**
     * The slope of the linear function for the Alpha channel.
     *           
     * 
     * The type is FLOAT.
     * 
     * The default is 0.0f.
     * @type {Integer (Int32)}
     */
    static D2D1_LINEARTRANSFER_PROP_ALPHA_SLOPE => 10

    /**
     * If you set this to TRUE the effect does not apply the transfer function to the Alpha channel. 
     *           If you set this to FALSE the effect applies the AlphaLinearTransfer function to the Alpha channel. 
     *           
     * 
     * The type is BOOL.
     * 
     * The default is FALSE.
     * @type {Integer (Int32)}
     */
    static D2D1_LINEARTRANSFER_PROP_ALPHA_DISABLE => 11

    /**
     * Whether the effect clamps color values to between 0 and 1 before the effect passes the values to the next effect in the graph. 
     *           The effect clamps the values before it premultiplies the alpha .
     *           
     * 
     * If you set this to TRUE the effect will clamp the values. If you set this to FALSE, the effect will not clamp the color values, but other effects and 
     *           the output surface may clamp the values if they are not of high enough precision.
     * 
     * The type is BOOL.
     * 
     * The default is FALSE.
     * @type {Integer (Int32)}
     */
    static D2D1_LINEARTRANSFER_PROP_CLAMP_OUTPUT => 12
}
