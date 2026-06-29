#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEA_EVENT_LOG_ENTRY {
    #StructPack 8

    Header : IntPtr

}
