#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
class MSIDBSTATE extends Win32Enum {

    /**
     * Native name: MSIDBSTATE_ERROR
     * @type {Integer (Int32)}
     */
    static ERROR => -1

    /**
     * Native name: MSIDBSTATE_READ
     * @type {Integer (Int32)}
     */
    static READ => 0

    /**
     * Native name: MSIDBSTATE_WRITE
     * @type {Integer (Int32)}
     */
    static WRITE => 1
}
