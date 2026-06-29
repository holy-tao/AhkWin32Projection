#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct VIDEO_COLOR_LUT_DATA {
    #StructPack 4

    Length : UInt32

    LutDataFormat : UInt32

    LutData : Int8[1]

}
