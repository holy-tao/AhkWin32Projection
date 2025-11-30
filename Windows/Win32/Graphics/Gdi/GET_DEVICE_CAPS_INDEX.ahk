#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class GET_DEVICE_CAPS_INDEX extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static DRIVERVERSION => 0

    /**
     * @type {Integer (UInt32)}
     */
    static TECHNOLOGY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static HORZSIZE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static VERTSIZE => 6

    /**
     * @type {Integer (UInt32)}
     */
    static HORZRES => 8

    /**
     * @type {Integer (UInt32)}
     */
    static VERTRES => 10

    /**
     * @type {Integer (UInt32)}
     */
    static BITSPIXEL => 12

    /**
     * @type {Integer (UInt32)}
     */
    static PLANES => 14

    /**
     * @type {Integer (UInt32)}
     */
    static NUMBRUSHES => 16

    /**
     * @type {Integer (UInt32)}
     */
    static NUMPENS => 18

    /**
     * @type {Integer (UInt32)}
     */
    static NUMMARKERS => 20

    /**
     * @type {Integer (UInt32)}
     */
    static NUMFONTS => 22

    /**
     * @type {Integer (UInt32)}
     */
    static NUMCOLORS => 24

    /**
     * @type {Integer (UInt32)}
     */
    static PDEVICESIZE => 26

    /**
     * @type {Integer (UInt32)}
     */
    static CURVECAPS => 28

    /**
     * @type {Integer (UInt32)}
     */
    static LINECAPS => 30

    /**
     * @type {Integer (UInt32)}
     */
    static POLYGONALCAPS => 32

    /**
     * @type {Integer (UInt32)}
     */
    static TEXTCAPS => 34

    /**
     * @type {Integer (UInt32)}
     */
    static CLIPCAPS => 36

    /**
     * @type {Integer (UInt32)}
     */
    static RASTERCAPS => 38

    /**
     * @type {Integer (UInt32)}
     */
    static ASPECTX => 40

    /**
     * @type {Integer (UInt32)}
     */
    static ASPECTY => 42

    /**
     * @type {Integer (UInt32)}
     */
    static ASPECTXY => 44

    /**
     * @type {Integer (UInt32)}
     */
    static LOGPIXELSX => 88

    /**
     * @type {Integer (UInt32)}
     */
    static LOGPIXELSY => 90

    /**
     * @type {Integer (UInt32)}
     */
    static SIZEPALETTE => 104

    /**
     * @type {Integer (UInt32)}
     */
    static NUMRESERVED => 106

    /**
     * @type {Integer (UInt32)}
     */
    static COLORRES => 108

    /**
     * @type {Integer (UInt32)}
     */
    static PHYSICALWIDTH => 110

    /**
     * @type {Integer (UInt32)}
     */
    static PHYSICALHEIGHT => 111

    /**
     * @type {Integer (UInt32)}
     */
    static PHYSICALOFFSETX => 112

    /**
     * @type {Integer (UInt32)}
     */
    static PHYSICALOFFSETY => 113

    /**
     * @type {Integer (UInt32)}
     */
    static SCALINGFACTORX => 114

    /**
     * @type {Integer (UInt32)}
     */
    static SCALINGFACTORY => 115

    /**
     * @type {Integer (UInt32)}
     */
    static VREFRESH => 116

    /**
     * @type {Integer (UInt32)}
     */
    static DESKTOPVERTRES => 117

    /**
     * @type {Integer (UInt32)}
     */
    static DESKTOPHORZRES => 118

    /**
     * @type {Integer (UInt32)}
     */
    static BLTALIGNMENT => 119

    /**
     * @type {Integer (UInt32)}
     */
    static SHADEBLENDCAPS => 120

    /**
     * @type {Integer (UInt32)}
     */
    static COLORMGMTCAPS => 121
}
