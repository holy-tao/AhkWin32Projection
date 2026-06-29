#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEA_ETW_OVERFLOW_EVENT {
    #StructPack 8

    WheaEventLogEntry : IntPtr

    RecordId : Int64

}
