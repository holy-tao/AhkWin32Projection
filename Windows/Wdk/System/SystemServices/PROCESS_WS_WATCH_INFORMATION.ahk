#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PROCESS_WS_WATCH_INFORMATION {
    #StructPack 8

    FaultingPc : IntPtr

    FaultingVa : IntPtr

}
