#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEAP_BAD_HEST_NOTIFY_DATA_EVENT {
    #StructPack 8

    WheaEventLogEntry : IntPtr

    SourceId : UInt16

    Reserved : UInt16

    NotifyDesc : IntPtr

}
