#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.System.Diagnostics.Etw
 */
export default struct ETW_TRACE_PARTITION_INFORMATION_V2 {
    #StructPack 8

    QpcOffsetFromRoot : Int64

    PartitionType : UInt32

    PartitionId : PWSTR

    ParentId : PWSTR

}
