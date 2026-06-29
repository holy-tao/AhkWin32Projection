#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEA_SEL_BUGCHECK_RECOVERY_STATUS_START_EVENT {
    #StructPack 8

    WheaEventLogEntry : IntPtr

    StartingIrql : Int8

}
