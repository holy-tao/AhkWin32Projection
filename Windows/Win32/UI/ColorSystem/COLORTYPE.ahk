#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The values of the **COLORTYPE** enumeration are used by several WCS functions. Variables of type **COLOR** are defined in the color spaces enumerated by the **COLORTYPE** enumeration.
 * @remarks
 * 
 * In addition to managing the common two, three, and four channel color spaces, WCS 1.0 is able to perform color management with device profiles that contain five through eight [color channels](/windows/win32/wcs/c). It is also able to use named color spaces. When five, six, seven, or eight color channels are used, the provider of the device profile is free to determine what the color channels represent. The same is true of named color spaces. WCS 1.0 is able to manage these color spaces as long as there is a mapping in the device profile that maps the channels or the name space into the [PCS](/windows/win32/wcs/p). The device profile must also contain a mapping from the PCS into the five, size, seven, or eight channel space, or into the named color space.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//icm/ne-icm-colortype
 * @namespace Windows.Win32.UI.ColorSystem
 * @version v4.0.30319
 */
class COLORTYPE extends Win32Enum{

    /**
     * The **COLOR** is in the GRAYCOLOR color space.
     * @type {Integer (Int32)}
     */
    static COLOR_GRAY => 1

    /**
     * The **COLOR** is in the RGBCOLOR color space.
     * @type {Integer (Int32)}
     */
    static COLOR_RGB => 2

    /**
     * The **COLOR** is in the XYZCOLOR color space.
     * @type {Integer (Int32)}
     */
    static COLOR_XYZ => 3

    /**
     * The **COLOR** is in the YxyCOLOR color space.
     * @type {Integer (Int32)}
     */
    static COLOR_Yxy => 4

    /**
     * The **COLOR** is in the LabCOLOR color space.
     * @type {Integer (Int32)}
     */
    static COLOR_Lab => 5

    /**
     * The **COLOR** is in the GENERIC3CHANNEL color space.
     * @type {Integer (Int32)}
     */
    static COLOR_3_CHANNEL => 6

    /**
     * The **COLOR** is in the CMYKCOLOR color space.
     * @type {Integer (Int32)}
     */
    static COLOR_CMYK => 7

    /**
     * The **COLOR** is in a five channel color space.
     * @type {Integer (Int32)}
     */
    static COLOR_5_CHANNEL => 8

    /**
     * The **COLOR** is in a six channel color space.
     * @type {Integer (Int32)}
     */
    static COLOR_6_CHANNEL => 9

    /**
     * The **COLOR** is in a seven channel color space.
     * @type {Integer (Int32)}
     */
    static COLOR_7_CHANNEL => 10

    /**
     * The **COLOR** is in an eight channel color space.
     * @type {Integer (Int32)}
     */
    static COLOR_8_CHANNEL => 11

    /**
     * The **COLOR** is in a named color space.
     * @type {Integer (Int32)}
     */
    static COLOR_NAMED => 12
}
