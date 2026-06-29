#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEAP_ROW_FAILURE_EVENT {
    #StructPack 8

    WheaEventLogEntry : IntPtr

    LowOrderPage : UInt32

    HighOrderPage : UInt32

}
