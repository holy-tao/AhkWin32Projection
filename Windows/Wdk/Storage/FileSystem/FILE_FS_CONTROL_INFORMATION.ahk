#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct FILE_FS_CONTROL_INFORMATION {
    #StructPack 8

    FreeSpaceStartFiltering : Int64

    FreeSpaceThreshold : Int64

    FreeSpaceStopFiltering : Int64

    DefaultQuotaThreshold : Int64

    DefaultQuotaLimit : Int64

    FileSystemControlFlags : UInt32

}
