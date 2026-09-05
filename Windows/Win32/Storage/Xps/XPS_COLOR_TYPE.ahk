#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Describes the color type used by the XPS_COLOR structure.
 * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/ne-xpsobjectmodel-xps_color_type
 * @namespace Windows.Win32.Storage.Xps
 */
class XPS_COLOR_TYPE extends Win32Enum {

    /**
     * The color value is an sRGB value.
     * Native name: XPS_COLOR_TYPE_SRGB
     * @type {Integer (Int32)}
     */
    static SRGB => 1

    /**
     * The color value is an scRGB value.
     * Native name: XPS_COLOR_TYPE_SCRGB
     * @type {Integer (Int32)}
     */
    static SCRGB => 2

    /**
     * The color value is specified using context color syntax.
     * Native name: XPS_COLOR_TYPE_CONTEXT
     * @type {Integer (Int32)}
     */
    static CONTEXT => 3
}
