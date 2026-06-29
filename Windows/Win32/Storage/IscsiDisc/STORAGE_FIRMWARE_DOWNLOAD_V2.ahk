#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.IscsiDisc
 */
export default struct STORAGE_FIRMWARE_DOWNLOAD_V2 {
    #StructPack 8

    Version : UInt32

    Size : UInt32

    Offset : Int64

    BufferSize : Int64

    Slot : Int8

    Reserved : Int8[3]

    ImageSize : UInt32

    ImageBuffer : Int8[1]

}
