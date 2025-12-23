#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.DeploymentServices
 * @version v4.0.30319
 */
class CPU_ARCHITECTURE extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static CPU_ARCHITECTURE_AMD64 => 9

    /**
     * @type {Integer (UInt32)}
     */
    static CPU_ARCHITECTURE_IA64 => 6

    /**
     * @type {Integer (UInt32)}
     */
    static CPU_ARCHITECTURE_INTEL => 0
}
