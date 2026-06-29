#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IPMI_OS_SEL_RECORD_TYPE.ahk" { IPMI_OS_SEL_RECORD_TYPE }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct IPMI_OS_SEL_RECORD {
    #StructPack 4

    Signature : UInt32

    Version : UInt32

    Length : UInt32

    RecordType : IPMI_OS_SEL_RECORD_TYPE

    DataLength : UInt32

    Data : Int8[1]

}
