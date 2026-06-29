#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SD_ENUM_SDS_ENTRY.ahk" { SD_ENUM_SDS_ENTRY }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct SD_ENUM_SDS_OUTPUT {
    #StructPack 8

    NextOffset : Int64

    NumSDEntriesReturned : Int64

    NumSDBytesReturned : Int64

    SDEntry : SD_ENUM_SDS_ENTRY[1]

}
