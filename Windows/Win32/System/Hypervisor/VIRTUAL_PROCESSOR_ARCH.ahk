#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
class VIRTUAL_PROCESSOR_ARCH extends Win32Enum {

    /**
     * Native name: Arch_Unknown
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * Native name: Arch_x86
     * @type {Integer (Int32)}
     */
    static x86 => 1

    /**
     * Native name: Arch_x64
     * @type {Integer (Int32)}
     */
    static x64 => 2

    /**
     * Native name: Arch_Armv8
     * @type {Integer (Int32)}
     */
    static Armv8 => 3
}
