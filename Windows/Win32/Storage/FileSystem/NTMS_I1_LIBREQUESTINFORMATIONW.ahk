#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\SYSTEMTIME.ahk" { SYSTEMTIME }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.Storage.FileSystem
 * @charset Unicode
 */
export default struct NTMS_I1_LIBREQUESTINFORMATIONW {
    #StructPack 4

    OperationCode : UInt32

    OperationOption : UInt32

    State : UInt32

    PartitionId : Guid

    DriveId : Guid

    PhysMediaId : Guid

    Library : Guid

    SlotId : Guid

    TimeQueued : SYSTEMTIME

    TimeCompleted : SYSTEMTIME

    szApplication : WCHAR[64]

    szUser : WCHAR[64]

    szComputer : WCHAR[64]

}
