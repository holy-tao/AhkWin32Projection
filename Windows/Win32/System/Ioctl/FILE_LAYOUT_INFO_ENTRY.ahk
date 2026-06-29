#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\STORAGE_RESERVE_ID.ahk" { STORAGE_RESERVE_ID }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct FILE_LAYOUT_INFO_ENTRY {
    #StructPack 8


    struct _BasicInformation {
        CreationTime : Int64

        LastAccessTime : Int64

        LastWriteTime : Int64

        ChangeTime : Int64

        FileAttributes : UInt32

    }

    BasicInformation : FILE_LAYOUT_INFO_ENTRY._BasicInformation

    OwnerId : UInt32

    SecurityId : UInt32

    Usn : Int64

    StorageReserveId : STORAGE_RESERVE_ID

}
