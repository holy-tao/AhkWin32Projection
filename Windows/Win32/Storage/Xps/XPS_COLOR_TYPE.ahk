#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes the color type used by the XPS_COLOR structure.
 * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/ne-xpsobjectmodel-xps_color_type
 * @namespace Windows.Win32.Storage.Xps
 */
export default struct XPS_COLOR_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The color value is an sRGB value.
     * @type {Integer (Int32)}
     */
    static XPS_COLOR_TYPE_SRGB => 1

    /**
     * The color value is an scRGB value.
     * @type {Integer (Int32)}
     */
    static XPS_COLOR_TYPE_SCRGB => 2

    /**
     * The color value is specified using context color syntax.
     * @type {Integer (Int32)}
     */
    static XPS_COLOR_TYPE_CONTEXT => 3
}
