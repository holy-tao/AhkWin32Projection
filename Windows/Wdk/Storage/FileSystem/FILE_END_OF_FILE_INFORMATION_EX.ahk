#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct FILE_END_OF_FILE_INFORMATION_EX {
    #StructPack 8

    EndOfFile : Int64

    PagingFileSizeInMM : Int64

    PagingFileMaxSize : Int64

    Flags : UInt32

}
