#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the identifiers of the metadata items in an 8BIMResolutionInfo block.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/ne-wincodec-wic8bimresolutioninfoproperties
 * @namespace Windows.Win32.Graphics.Imaging
 */
class WIC8BIMResolutionInfoProperties extends Win32Enum {

    /**
     * [VT_LPSTR] A name that identifies the 8BIM block.
     * Native name: WIC8BIMResolutionInfoPString
     * @type {Integer (Int32)}
     */
    static InfoPString => 1

    /**
     * [VT_UI4] The horizontal resolution of the image.
     * Native name: WIC8BIMResolutionInfoHResolution
     * @type {Integer (Int32)}
     */
    static InfoHResolution => 2

    /**
     * [VT_UI2] The units that the horizontal resolution is specified in; a 1 indicates pixels per inch and a 2 indicates pixels per centimeter.
     * Native name: WIC8BIMResolutionInfoHResolutionUnit
     * @type {Integer (Int32)}
     */
    static InfoHResolutionUnit => 3

    /**
     * [VT_UI2] The units that the image width is specified in; a 1 indicates inches, a 2 indicates centimeters, a 3 indicates points, a 4 specifies picas, and a 5 specifies columns.
     * Native name: WIC8BIMResolutionInfoWidthUnit
     * @type {Integer (Int32)}
     */
    static WidthUnit => 4

    /**
     * [VT_UI4] The vertical resolution of the image.
     * Native name: WIC8BIMResolutionInfoVResolution
     * @type {Integer (Int32)}
     */
    static InfoVResolution => 5

    /**
     * [VT_UI2] The units that the vertical resolution is specified in; a 1 indicates pixels per inch and a 2 indicates pixels per centimeter.
     * Native name: WIC8BIMResolutionInfoVResolutionUnit
     * @type {Integer (Int32)}
     */
    static InfoVResolutionUnit => 6

    /**
     * [VT_UI2] The units that the image height is specified in; a 1 indicates inches, a 2 indicates centimeters, a 3 indicates points, a 4 specifies picas, and a 5 specifies columns.
     * Native name: WIC8BIMResolutionInfoHeightUnit
     * @type {Integer (Int32)}
     */
    static HeightUnit => 7
}
