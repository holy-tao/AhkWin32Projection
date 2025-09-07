#Requires AutoHotkey v2.0.0 64-bit

/**
 * Identifiers for properties of the Edge Detection effect.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1effects_2/ne-d2d1effects_2-d2d1_edgedetection_prop
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_EDGEDETECTION_PROP{

    /**
     * The D2D1_EDGEDETECTION_PROP_STRENGTH property is a float value modulating the response of the edge detection filter. A low strength value means that weaker edges will get filtered out, 
 *           while a high value means stronger edges will get filtered out.  The allowed range is 0.0 to 1.0.  The default value is 0.5.
     * @type {Integer (Int32)}
     */
    static D2D1_EDGEDETECTION_PROP_STRENGTH => 0

    /**
     * The D2D1_EDGEDETECTION_PROP_BLUR_RADIUS property is a float value specifying the amount of blur to apply.  Applying blur is used to remove high frequencies and reduce phantom edges.  
 *           The allowed range is 0.0 to 10.0. The default value is 0.0 (no blur applied).
     * @type {Integer (Int32)}
     */
    static D2D1_EDGEDETECTION_PROP_BLUR_RADIUS => 1

    /**
     * The D2D1_EDGEDETECTION_PROP_MODE property is a <a href="https://docs.microsoft.com/windows/desktop/api/d2d1effects_2/ne-d2d1effects_2-d2d1_edgedetection_mode">D2D1_EDGEDETECTION_MODE</a> enumeration value which mode to use for edge detection.  
 *           The default value is D2D1_EDGEDETECTION_MODE_SOBEL.
     * @type {Integer (Int32)}
     */
    static D2D1_EDGEDETECTION_PROP_MODE => 2

    /**
     * The D2D1_EDGEDETECTION_PROP_OVERLAY_EDGES property is a boolean value. Edge detection only applies to the RGB channels, the alpha channel is ignored for purposes of detecting edges.
 *           If D2D1_EDGEDETECTION_PROP_OVERLAY_EDGES is false, the output edges is fully opaque. If D2D1_EDGEDETECTION_PROP_OVERLAY_EDGES is true, the input opacity is preserved.
 *           The default value is false.
     * @type {Integer (Int32)}
     */
    static D2D1_EDGEDETECTION_PROP_OVERLAY_EDGES => 3

    /**
     * The D2D1_EDGEDETECTION_PROP_ALPHA_MODE property is a <a href="https://docs.microsoft.com/windows/desktop/api/dcommon/ne-dcommon-d2d1_alpha_mode">D2D1_ALPHA_MODE</a> enumeration value indicating the alpha mode of the input file.
 *           If the input is not opaque, this value is used to determine whether to unpremultiply the inputs.
 *           See the About Alpha Modes section of the <a href="https://docs.microsoft.com/windows/desktop/Direct2D/supported-pixel-formats-and-alpha-modes">Supported Pixel Formats and Alpha Modes</a> topic for additional information.   
 *           
 *           The default value is D2D1_ALPHA_MODE_PREMULTIPLIED.
     * @type {Integer (Int32)}
     */
    static D2D1_EDGEDETECTION_PROP_ALPHA_MODE => 4
}
