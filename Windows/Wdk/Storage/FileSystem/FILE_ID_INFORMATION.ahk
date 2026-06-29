#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct FILE_ID_INFORMATION {
    #StructPack 8

    VolumeSerialNumber : Int64

    FileId : IntPtr

}
