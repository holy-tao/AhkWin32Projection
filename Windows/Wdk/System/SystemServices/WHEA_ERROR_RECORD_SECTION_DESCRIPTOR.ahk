#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Guid.ahk" { Guid }
#Import ".\WHEA_ERROR_SEVERITY.ahk" { WHEA_ERROR_SEVERITY }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEA_ERROR_RECORD_SECTION_DESCRIPTOR {
    #StructPack 8

    SectionOffset : UInt32

    SectionLength : UInt32

    Revision : IntPtr

    ValidBits : IntPtr

    Reserved : Int8

    Flags : IntPtr

    SectionType : Guid

    FRUId : Guid

    SectionSeverity : WHEA_ERROR_SEVERITY

    FRUText : Int8[20]

}
