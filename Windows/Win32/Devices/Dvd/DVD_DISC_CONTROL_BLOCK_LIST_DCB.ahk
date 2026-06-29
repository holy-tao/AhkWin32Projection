#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Dvd
 */
export default struct DVD_DISC_CONTROL_BLOCK_LIST_DCB {
    #StructPack 1

    DcbIdentifier : Int8[4]

}
