#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.Storage.FileSystem
 * @charset ANSI
 */
export default struct NTMS_I1_PARTITIONINFORMATIONA {
    #StructPack 4

    PhysicalMedia : Guid

    LogicalMedia : Guid

    State : UInt32

    Side : UInt16

    dwOmidLabelIdLength : UInt32

    OmidLabelId : Int8[255]

    szOmidLabelType : CHAR[64]

    szOmidLabelInfo : CHAR[256]

    dwMountCount : UInt32

    dwAllocateCount : UInt32

}
