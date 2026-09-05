#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
class ADVERTISEFLAGS extends Win32Enum {

    /**
     * Native name: ADVERTISEFLAGS_MACHINEASSIGN
     * @type {Integer (Int32)}
     */
    static MACHINEASSIGN => 0

    /**
     * Native name: ADVERTISEFLAGS_USERASSIGN
     * @type {Integer (Int32)}
     */
    static USERASSIGN => 1
}
