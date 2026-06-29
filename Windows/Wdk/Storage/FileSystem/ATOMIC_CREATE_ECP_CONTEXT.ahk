#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\REPARSE_DATA_BUFFER.ahk" { REPARSE_DATA_BUFFER }
#Import ".\FILE_TIMESTAMPS.ahk" { FILE_TIMESTAMPS }

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct ATOMIC_CREATE_ECP_CONTEXT {
    #StructPack 8

    Size : UInt16

    InFlags : UInt16

    OutFlags : UInt16

    ReparseBufferLength : UInt16

    ReparseBuffer : REPARSE_DATA_BUFFER.Ptr

    FileSize : Int64

    ValidDataLength : Int64

    FileTimestamps : FILE_TIMESTAMPS.Ptr

    FileAttributes : UInt32

    UsnSourceInfo : UInt32

    Usn : Int64

    SuppressFileAttributeInheritanceMask : UInt32

    InOpFlags : UInt32

    OutOpFlags : UInt32

    InGenFlags : UInt32

    OutGenFlags : UInt32

    CaseSensitiveFlagsMask : UInt32

    InCaseSensitiveFlags : UInt32

    OutCaseSensitiveFlags : UInt32

}
