#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the identifiers of the metadata items in an 8BIMResolutionInfo block.
 * @see https://docs.microsoft.com/windows/win32/api//wincodec/ne-wincodec-wic8bimresolutioninfoproperties
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class WIC8BIMResolutionInfoProperties extends Win32Enum{

    /**
     * [VT_LPSTR] A name that identifies the 8BIM block.
     * @type {Integer (Int32)}
     */
    static WIC8BIMResolutionInfoPString => 1

    /**
     * [VT_UI4] The horizontal resolution of the image.
     * @type {Integer (Int32)}
     */
    static WIC8BIMResolutionInfoHResolution => 2

    /**
     * [VT_UI2] The units that the horizontal resolution is specified in; a 1 indicates pixels per inch and a 2 indicates pixels per centimeter.
     * @type {Integer (Int32)}
     */
    static WIC8BIMResolutionInfoHResolutionUnit => 3

    /**
     * [VT_UI2] The units that the image width is specified in; a 1 indicates inches, a 2 indicates centimeters, a 3 indicates points, a 4 specifies picas, and a 5 specifies columns.
     * @type {Integer (Int32)}
     */
    static WIC8BIMResolutionInfoWidthUnit => 4

    /**
     * [VT_UI4] The vertical resolution of the image.
     * @type {Integer (Int32)}
     */
    static WIC8BIMResolutionInfoVResolution => 5

    /**
     * [VT_UI2] The units that the vertical resolution is specified in; a 1 indicates pixels per inch and a 2 indicates pixels per centimeter.
     * @type {Integer (Int32)}
     */
    static WIC8BIMResolutionInfoVResolutionUnit => 6

    /**
     * [VT_UI2] The units that the image height is specified in; a 1 indicates inches, a 2 indicates centimeters, a 3 indicates points, a 4 specifies picas, and a 5 specifies columns.
     * @type {Integer (Int32)}
     */
    static WIC8BIMResolutionInfoHeightUnit => 7
}
