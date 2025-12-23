#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Identifiers for properties of the Scale effect.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1effects/ne-d2d1effects-d2d1_scale_prop
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_SCALE_PROP extends Win32Enum{

    /**
     * The scale amount in the X and Y direction as a ratio of the output size to the input size.
     *             
     * 
     * This property a <a href="https://docs.microsoft.com/windows/desktop/api/dcommon/ns-dcommon-d2d_vector_2f">D2D1_VECTOR_2F</a> defined as: (X scale, Y scale). 
     *             The scale amounts are FLOAT, unitless, and must be positive or 0.
     * 
     * The type is <a href="https://docs.microsoft.com/windows/desktop/api/dcommon/ns-dcommon-d2d_vector_2f">D2D1_VECTOR_2F</a>.
     * 
     * The default value is {1.0f, 1.0f}.
     * @type {Integer (Int32)}
     */
    static D2D1_SCALE_PROP_SCALE => 0

    /**
     * The image scaling center point. This property is a <a href="https://docs.microsoft.com/windows/desktop/api/dcommon/ns-dcommon-d2d_vector_2f">D2D1_VECTOR_2F</a> defined as: (point X, point Y). The units are in DIPs.
     *             
     * 
     * Use the center point property to scale around a point other than the upper-left corner.
     * 
     * The type is <a href="https://docs.microsoft.com/windows/desktop/api/dcommon/ns-dcommon-d2d_vector_2f">D2D1_VECTOR_2F</a>.
     * 
     * The default value is {0.0f, 0.0f}.
     * @type {Integer (Int32)}
     */
    static D2D1_SCALE_PROP_CENTER_POINT => 1

    /**
     * The interpolation mode the effect uses to scale the image. There are 6 scale modes that range in quality and speed.
     *             
     * 
     * The type is <a href="https://docs.microsoft.com/windows/desktop/api/d2d1effects/ne-d2d1effects-d2d1_scale_interpolation_mode">D2D1_SCALE_INTERPOLATION_MODE</a>.
     * 
     * The default value is D2D1_SCALE_INTERPOLATION_MODE_LINEAR.
     * @type {Integer (Int32)}
     */
    static D2D1_SCALE_PROP_INTERPOLATION_MODE => 2

    /**
     * The mode used to calculate the border of the image, soft or hard. 
     *             
     * 
     * The type is <a href="https://docs.microsoft.com/windows/desktop/api/d2d1effects/ne-d2d1effects-d2d1_border_mode">D2D1_BORDER_MODE</a>.
     * 
     * The default value is D2D1_BORDER_MODE_SOFT.
     * @type {Integer (Int32)}
     */
    static D2D1_SCALE_PROP_BORDER_MODE => 3

    /**
     * In the high quality cubic interpolation mode, the sharpness level of the scaling filter as a float between 0 and 1. The values are unitless. 
     *             You can use sharpness to adjust the quality of an image when you scale the image down.
     *             
     * 
     * The sharpness factor affects the shape of the kernel. The higher the sharpness factor, the smaller the kernel.
     * 
     * <div class="alert"><b>Note</b>  This property affects only the high quality cubic interpolation mode.</div>
     * <div> </div>
     * The type is FLOAT.
     * 
     * The default value is 0.0f.
     * @type {Integer (Int32)}
     */
    static D2D1_SCALE_PROP_SHARPNESS => 4
}
