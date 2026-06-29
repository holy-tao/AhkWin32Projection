#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct VIDEO_COLOR_CAPABILITIES {
    #StructPack 4

    Length : UInt32

    AttributeFlags : UInt32

    RedPhosphoreDecay : Int32

    GreenPhosphoreDecay : Int32

    BluePhosphoreDecay : Int32

    WhiteChromaticity_x : Int32

    WhiteChromaticity_y : Int32

    WhiteChromaticity_Y1 : Int32

    RedChromaticity_x : Int32

    RedChromaticity_y : Int32

    GreenChromaticity_x : Int32

    GreenChromaticity_y : Int32

    BlueChromaticity_x : Int32

    BlueChromaticity_y : Int32

    WhiteGamma : Int32

    RedGamma : Int32

    GreenGamma : Int32

    BlueGamma : Int32

}
