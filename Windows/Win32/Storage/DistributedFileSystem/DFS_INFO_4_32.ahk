#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Storage.DistributedFileSystem
 * @architecture X64, Arm64
 */
export default struct DFS_INFO_4_32 {
    #StructPack 4

    EntryPath : UInt32

    Comment : UInt32

    State : UInt32

    Timeout : UInt32

    Guid : Guid

    NumberOfStorages : UInt32

    Storage : UInt32

}
