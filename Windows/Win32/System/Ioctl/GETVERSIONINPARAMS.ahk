#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct GETVERSIONINPARAMS {
    #StructPack 4

    bVersion : Int8

    bRevision : Int8

    bReserved : Int8

    bIDEDeviceMap : Int8

    fCapabilities : UInt32

    dwReserved : UInt32[4]

}
