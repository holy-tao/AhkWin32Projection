#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WHEA_ERROR_SEVERITY.ahk" { WHEA_ERROR_SEVERITY }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEA_GENERIC_ERROR_DATA_ENTRY_V1 {
    #StructPack 8

    SectionType : Guid

    ErrorSeverity : WHEA_ERROR_SEVERITY

    Revision : IntPtr

    ValidBits : Int8

    Flags : Int8

    ErrorDataLength : UInt32

    FRUId : Guid

    FRUText : Int8[20]

    Data : Int8[1]

}
