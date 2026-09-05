#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
class MSIARCHITECTUREFLAGS extends Win32Enum {

    /**
     * Native name: MSIARCHITECTUREFLAGS_X86
     * @type {Integer (Int32)}
     */
    static X86 => 1

    /**
     * Native name: MSIARCHITECTUREFLAGS_IA64
     * @type {Integer (Int32)}
     */
    static IA64 => 2

    /**
     * Native name: MSIARCHITECTUREFLAGS_AMD64
     * @type {Integer (Int32)}
     */
    static AMD64 => 4

    /**
     * Native name: MSIARCHITECTUREFLAGS_ARM
     * @type {Integer (Int32)}
     */
    static ARM => 8
}
