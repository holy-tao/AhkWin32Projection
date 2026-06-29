#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEAP_DEFERRED_EVENT {
    #StructPack 8

    ListEntry : IntPtr

    WheaEventLogEntry : IntPtr

}
