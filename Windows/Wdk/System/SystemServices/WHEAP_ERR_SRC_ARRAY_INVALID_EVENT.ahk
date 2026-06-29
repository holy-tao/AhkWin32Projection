#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEAP_ERR_SRC_ARRAY_INVALID_EVENT {
    #StructPack 8

    WheaEventLogEntry : IntPtr

    ErrorSourceCount : UInt32

    ReportedLength : UInt32

    ExpectedLength : UInt32

}
