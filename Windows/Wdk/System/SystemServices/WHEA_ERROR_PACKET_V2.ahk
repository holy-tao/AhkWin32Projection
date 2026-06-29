#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WHEA_ERROR_TYPE.ahk" { WHEA_ERROR_TYPE }
#Import ".\WHEA_ERROR_SEVERITY.ahk" { WHEA_ERROR_SEVERITY }
#Import "..\..\..\Win32\System\Diagnostics\Debug\WHEA_ERROR_SOURCE_TYPE.ahk" { WHEA_ERROR_SOURCE_TYPE }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\WHEA_ERROR_PACKET_DATA_FORMAT.ahk" { WHEA_ERROR_PACKET_DATA_FORMAT }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEA_ERROR_PACKET_V2 {
    #StructPack 8

    Signature : UInt32

    Version : UInt32

    Length : UInt32

    Flags : IntPtr

    ErrorType : WHEA_ERROR_TYPE

    ErrorSeverity : WHEA_ERROR_SEVERITY

    ErrorSourceId : UInt32

    ErrorSourceType : WHEA_ERROR_SOURCE_TYPE

    NotifyType : Guid

    Context : Int64

    DataFormat : WHEA_ERROR_PACKET_DATA_FORMAT

    Reserved1 : UInt32

    DataOffset : UInt32

    DataLength : UInt32

    PshedDataOffset : UInt32

    PshedDataLength : UInt32

}
