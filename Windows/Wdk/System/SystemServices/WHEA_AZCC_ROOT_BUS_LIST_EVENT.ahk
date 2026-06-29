#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEA_AZCC_ROOT_BUS_LIST_EVENT {
    #StructPack 8

    WheaEventLogEntry : IntPtr

    RootBusCount : UInt32

    RootBuses : UInt32[8]

}
