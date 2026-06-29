#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEA_SRAS_TABLE_ENTRIES_EVENT {
    #StructPack 8

    WheaEventLogEntry : IntPtr

    LogNumber : UInt32

    NumberSignals : UInt32

    Data : Int8[1]

}
