#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Dvd
 */
export default struct DVD_SET_RPC_KEY {
    #StructPack 1

    PreferredDriveRegionCode : Int8

    Reserved : Int8[3]

}
