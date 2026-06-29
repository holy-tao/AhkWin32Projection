#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.DistributedFileSystem
 * @architecture X64, Arm64
 */
export default struct DFS_INFO_3_32 {
    #StructPack 4

    EntryPath : UInt32

    Comment : UInt32

    State : UInt32

    NumberOfStorages : UInt32

    Storage : UInt32

}
