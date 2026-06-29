#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEA_FAILED_ADD_DEFECT_LIST_EVENT {
    #StructPack 8

    WheaEventLogEntry : IntPtr

}
