#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEA_SRAS_TABLE_NOT_FOUND {
    #StructPack 8

    WheaEventLogEntry : IntPtr

}
