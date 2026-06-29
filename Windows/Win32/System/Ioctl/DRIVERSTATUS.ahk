#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct DRIVERSTATUS {
    #StructPack 4

    bDriverError : Int8

    bIDEError : Int8

    bReserved : Int8[2]

    dwReserved : UInt32[2]

}
