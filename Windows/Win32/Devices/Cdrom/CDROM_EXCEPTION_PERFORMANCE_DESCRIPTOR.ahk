#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Cdrom
 */
export default struct CDROM_EXCEPTION_PERFORMANCE_DESCRIPTOR {
    #StructPack 1

    Lba : Int8[4]

    Time : Int8[2]

}
