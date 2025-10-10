#Requires AutoHotkey v2.0.0 64-bit

/**
 * Describes the gamma function used for color interpolation.
 * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/ne-xpsobjectmodel-xps_color_interpolation
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class XPS_COLOR_INTERPOLATION{

    /**
     * First, the color values are converted to scRGB, then a linear interpolation is performed between them.
     * @type {Integer (Int32)}
     */
    static XPS_COLOR_INTERPOLATION_SCRGBLINEAR => 1

    /**
     * First, the color values are converted to sRGB, then a linear interpolation is performed between them.
     * @type {Integer (Int32)}
     */
    static XPS_COLOR_INTERPOLATION_SRGBLINEAR => 2
}
