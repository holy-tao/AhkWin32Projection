#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct VIDEO_POINTER_ATTRIBUTES {
    #StructPack 4

    Flags : UInt32

    Width : UInt32

    Height : UInt32

    WidthInBytes : UInt32

    Enable : UInt32

    Column : Int16

    Row : Int16

    Pixels : Int8[1]

}
