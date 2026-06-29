#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PROCESS_KEEPALIVE_COUNT_INFORMATION {
    #StructPack 4

    WakeCount : UInt32

    NoWakeCount : UInt32

}
