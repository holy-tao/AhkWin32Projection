#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct STORAGE_HW_FIRMWARE_DOWNLOAD_V2 {
    #StructPack 8

    Version : UInt32

    Size : UInt32

    Flags : UInt32

    Slot : Int8

    Reserved : Int8[3]

    Offset : Int64

    BufferSize : Int64

    ImageSize : UInt32

    Reserved2 : UInt32

    ImageBuffer : Int8[1]

}
