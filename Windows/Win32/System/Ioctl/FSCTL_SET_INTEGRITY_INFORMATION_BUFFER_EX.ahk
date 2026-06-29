#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct FSCTL_SET_INTEGRITY_INFORMATION_BUFFER_EX {
    #StructPack 4

    EnableIntegrity : Int8

    KeepIntegrityStateUnchanged : Int8

    Reserved : UInt16

    Flags : UInt32

    Version : Int8

    Reserved2 : Int8[7]

}
