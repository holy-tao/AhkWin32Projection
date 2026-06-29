#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WHEA_ERROR_SEVERITY.ahk" { WHEA_ERROR_SEVERITY }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEA_GENERIC_ERROR {
    #StructPack 8

    BlockStatus : IntPtr

    RawDataOffset : UInt32

    RawDataLength : UInt32

    DataLength : UInt32

    ErrorSeverity : WHEA_ERROR_SEVERITY

    Data : Int8[1]

}
