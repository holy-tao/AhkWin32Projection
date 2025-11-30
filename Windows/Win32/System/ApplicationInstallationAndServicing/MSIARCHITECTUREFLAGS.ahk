#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class MSIARCHITECTUREFLAGS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static MSIARCHITECTUREFLAGS_X86 => 1

    /**
     * @type {Integer (Int32)}
     */
    static MSIARCHITECTUREFLAGS_IA64 => 2

    /**
     * @type {Integer (Int32)}
     */
    static MSIARCHITECTUREFLAGS_AMD64 => 4

    /**
     * @type {Integer (Int32)}
     */
    static MSIARCHITECTUREFLAGS_ARM => 8
}
