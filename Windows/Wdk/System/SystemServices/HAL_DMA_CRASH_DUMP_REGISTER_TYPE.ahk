#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class HAL_DMA_CRASH_DUMP_REGISTER_TYPE extends Win32Enum {

    /**
     * Native name: HalDmaCrashDumpRegisterSet1
     * @type {Integer (Int32)}
     */
    static Set1 => 0

    /**
     * Native name: HalDmaCrashDumpRegisterSet2
     * @type {Integer (Int32)}
     */
    static Set2 => 1

    /**
     * Native name: HalDmaCrashDumpRegisterSetMax
     * @type {Integer (Int32)}
     */
    static SetMax => 2
}
