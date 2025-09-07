#Requires AutoHotkey v2.0.0 64-bit

/**
 * Describes the color type used by the XPS_COLOR structure.
 * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/ne-xpsobjectmodel-xps_color_type
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class XPS_COLOR_TYPE{

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
