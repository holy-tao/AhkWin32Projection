#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.DistributedFileSystem
 * @architecture X64, Arm64
 */
export default struct DFS_STORAGE_INFO_0_32 {
    #StructPack 4

    State : UInt32

    ServerName : UInt32

    ShareName : UInt32

}
