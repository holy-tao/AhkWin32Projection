#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct FILE_NETWORK_OPEN_INFORMATION {
    #StructPack 8

    CreationTime : Int64

    LastAccessTime : Int64

    LastWriteTime : Int64

    ChangeTime : Int64

    AllocationSize : Int64

    EndOfFile : Int64

    FileAttributes : UInt32

}
