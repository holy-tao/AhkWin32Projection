#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEAP_STUCK_ERROR_EVENT {
    #StructPack 8

    WheaEventLogEntry : IntPtr

    EpIndex : UInt32

    Bank : UInt32

    MciStatus : Int64

}
