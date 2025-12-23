#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Hypervisor
 * @version v4.0.30319
 */
class WHV_X64_LOCAL_APIC_EMULATION_MODE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64LocalApicEmulationModeNone => 0

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64LocalApicEmulationModeXApic => 1

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64LocalApicEmulationModeX2Apic => 2
}
