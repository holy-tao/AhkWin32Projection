#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct VIDEO_CURSOR_ATTRIBUTES {
    #StructPack 2

    Width : UInt16

    Height : UInt16

    Column : Int16

    Row : Int16

    Rate : Int8

    Enable : Int8

}
