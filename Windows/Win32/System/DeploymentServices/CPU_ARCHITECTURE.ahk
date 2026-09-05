#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.DeploymentServices
 */
class CPU_ARCHITECTURE extends Win32Enum {

    /**
     * Native name: CPU_ARCHITECTURE_AMD64
     * @type {Integer (UInt32)}
     */
    static AMD64 => 9

    /**
     * Native name: CPU_ARCHITECTURE_IA64
     * @type {Integer (UInt32)}
     */
    static IA64 => 6

    /**
     * Native name: CPU_ARCHITECTURE_INTEL
     * @type {Integer (UInt32)}
     */
    static INTEL => 0
}
