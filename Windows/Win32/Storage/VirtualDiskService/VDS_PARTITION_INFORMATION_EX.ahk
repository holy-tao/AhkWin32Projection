#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\VDS_PARTITION_INFO_MBR.ahk" { VDS_PARTITION_INFO_MBR }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\VDS_PARTITION_INFO_GPT.ahk" { VDS_PARTITION_INFO_GPT }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\__VDS_PARTITION_STYLE.ahk" { __VDS_PARTITION_STYLE }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * This structure is reserved for system use. (VDS_PARTITION_INFORMATION_EX)
 * @see https://learn.microsoft.com/windows/win32/api/vds/ns-vds-vds_partition_information_ex
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
export default struct VDS_PARTITION_INFORMATION_EX {
    #StructPack 8

    dwPartitionStyle : __VDS_PARTITION_STYLE

    ullStartingOffset : Int64

    ullPartitionLength : Int64

    dwPartitionNumber : UInt32

    bRewritePartition : BOOLEAN

    Mbr : VDS_PARTITION_INFO_MBR

    static __New() {
        DefineProp(this.Prototype, 'Gpt', { type: VDS_PARTITION_INFO_GPT, offset: 32 })
        this.DeleteProp("__New")
    }
}
