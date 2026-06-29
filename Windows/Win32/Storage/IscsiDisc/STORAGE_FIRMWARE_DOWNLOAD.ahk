#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.IscsiDisc
 */
export default struct STORAGE_FIRMWARE_DOWNLOAD {
    #StructPack 8

    Version : UInt32

    Size : UInt32

    Offset : Int64

    BufferSize : Int64

    ImageBuffer : Int8[1]

}
