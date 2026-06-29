#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct FILE_STAT_INFORMATION {
    #StructPack 8

    FileId : Int64

    CreationTime : Int64

    LastAccessTime : Int64

    LastWriteTime : Int64

    ChangeTime : Int64

    AllocationSize : Int64

    EndOfFile : Int64

    FileAttributes : UInt32

    ReparseTag : UInt32

    NumberOfLinks : UInt32

    EffectiveAccess : UInt32

}
