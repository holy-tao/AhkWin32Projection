#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FILE_ID_128.ahk" { FILE_ID_128 }

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct FILE_STAT_BASIC_INFORMATION {
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

    DeviceType : UInt32

    DeviceCharacteristics : UInt32

    Reserved : UInt32

    VolumeSerialNumber : Int64

    FileId128 : FILE_ID_128

}
