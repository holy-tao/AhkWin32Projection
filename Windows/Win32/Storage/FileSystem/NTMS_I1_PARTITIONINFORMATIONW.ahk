#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.Storage.FileSystem
 * @charset Unicode
 */
export default struct NTMS_I1_PARTITIONINFORMATIONW {
    #StructPack 4

    PhysicalMedia : Guid

    LogicalMedia : Guid

    State : UInt32

    Side : UInt16

    dwOmidLabelIdLength : UInt32

    OmidLabelId : Int8[255]

    szOmidLabelType : WCHAR[64]

    szOmidLabelInfo : WCHAR[256]

    dwMountCount : UInt32

    dwAllocateCount : UInt32

}
