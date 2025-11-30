#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Hypervisor
 * @version v4.0.30319
 */
class WHV_X64_CPUID_RESULT2_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64CpuidResult2FlagSubleafSpecific => 1

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64CpuidResult2FlagVpSpecific => 2
}
