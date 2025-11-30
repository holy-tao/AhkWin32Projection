#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class HAL_DMA_CRASH_DUMP_REGISTER_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static HalDmaCrashDumpRegisterSet1 => 0

    /**
     * @type {Integer (Int32)}
     */
    static HalDmaCrashDumpRegisterSet2 => 1

    /**
     * @type {Integer (Int32)}
     */
    static HalDmaCrashDumpRegisterSetMax => 2
}
