#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Dvd
 */
export default struct DVD_DISK_KEY_DESCRIPTOR {
    #StructPack 1

    DiskKeyData : Int8[2048]

}
