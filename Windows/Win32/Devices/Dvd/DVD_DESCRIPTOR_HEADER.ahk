#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Dvd
 */
export default struct DVD_DESCRIPTOR_HEADER {
    #StructPack 2

    Length : UInt16

    Reserved : Int8[2]

    Data : Int8[1]

}
