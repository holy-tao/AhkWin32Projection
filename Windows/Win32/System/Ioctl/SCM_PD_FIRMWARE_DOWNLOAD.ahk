#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct SCM_PD_FIRMWARE_DOWNLOAD {
    #StructPack 8

    Version : UInt32

    Size : UInt32

    Flags : UInt32

    Slot : Int8

    Reserved : Int8[3]

    Offset : Int64

    FirmwareImageSizeInBytes : UInt32

    FirmwareImage : Int8[1]

}
