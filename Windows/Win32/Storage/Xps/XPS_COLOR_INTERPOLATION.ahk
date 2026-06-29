#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes the gamma function used for color interpolation.
 * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/ne-xpsobjectmodel-xps_color_interpolation
 * @namespace Windows.Win32.Storage.Xps
 */
export default struct XPS_COLOR_INTERPOLATION {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
