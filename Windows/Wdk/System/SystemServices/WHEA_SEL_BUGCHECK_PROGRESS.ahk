#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEA_SEL_BUGCHECK_PROGRESS {
    #StructPack 8

    WheaEventLogEntry : IntPtr

    BugCheckCode : UInt32

    BugCheckProgressSummary : UInt32

}
