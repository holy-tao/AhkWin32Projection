#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Hypervisor
 * @version v4.0.30319
 */
class VIRTUAL_PROCESSOR_ARCH extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static Arch_Unknown => 0

    /**
     * @type {Integer (Int32)}
     */
    static Arch_x86 => 1

    /**
     * @type {Integer (Int32)}
     */
    static Arch_x64 => 2

    /**
     * @type {Integer (Int32)}
     */
    static Arch_Armv8 => 3
}
