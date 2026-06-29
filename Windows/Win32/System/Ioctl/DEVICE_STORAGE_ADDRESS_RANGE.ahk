#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct DEVICE_STORAGE_ADDRESS_RANGE {
    #StructPack 8

    StartAddress : Int64

    LengthInBytes : Int64

}
