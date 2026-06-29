#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Win32.Storage.IscsiDisc
 */
export default struct IO_SCSI_CAPABILITIES {
    #StructPack 4

    Length : UInt32

    MaximumTransferLength : UInt32

    MaximumPhysicalPages : UInt32

    SupportedAsynchronousEvents : UInt32

    AlignmentMask : UInt32

    TaggedQueuing : BOOLEAN

    AdapterScansDown : BOOLEAN

    AdapterUsesPio : BOOLEAN

}
