#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct KDPC_WATCHDOG_INFORMATION {
    #StructPack 4

    DpcTimeLimit : UInt32

    DpcTimeCount : UInt32

    DpcWatchdogLimit : UInt32

    DpcWatchdogCount : UInt32

    Reserved : UInt32

}
