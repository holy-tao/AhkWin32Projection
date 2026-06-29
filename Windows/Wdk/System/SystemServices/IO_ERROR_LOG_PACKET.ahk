#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct IO_ERROR_LOG_PACKET {
    #StructPack 8

    MajorFunctionCode : Int8

    RetryCount : Int8

    DumpDataSize : UInt16

    NumberOfStrings : UInt16

    StringOffset : UInt16

    EventCategory : UInt16

    ErrorCode : NTSTATUS

    UniqueErrorValue : UInt32

    FinalStatus : NTSTATUS

    SequenceNumber : UInt32

    IoControlCode : UInt32

    DeviceOffset : Int64

    DumpData : UInt32[1]

}
