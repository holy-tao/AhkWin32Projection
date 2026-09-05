#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
class MSIASSEMBLYINFO extends Win32Enum {

    /**
     * Native name: MSIASSEMBLYINFO_NETASSEMBLY
     * @type {Integer (UInt32)}
     */
    static NETASSEMBLY => 0

    /**
     * Native name: MSIASSEMBLYINFO_WIN32ASSEMBLY
     * @type {Integer (UInt32)}
     */
    static WIN32ASSEMBLY => 1
}
