#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\SYSTEMTIME.ahk" { SYSTEMTIME }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.Storage.FileSystem
 * @charset ANSI
 */
export default struct NTMS_I1_LIBREQUESTINFORMATIONA {
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

    szApplication : CHAR[64]

    szUser : CHAR[64]

    szComputer : CHAR[64]

}
