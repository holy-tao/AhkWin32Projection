#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEAP_PLUGIN_DEFECT_LIST_FULL_EVENT {
    #StructPack 8

    WheaEventLogEntry : IntPtr

}
