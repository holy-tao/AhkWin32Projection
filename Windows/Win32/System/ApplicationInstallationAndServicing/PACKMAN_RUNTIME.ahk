#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
class PACKMAN_RUNTIME extends Win32Enum {

    /**
     * Native name: PACKMAN_RUNTIME_NATIVE
     * @type {Integer (Int32)}
     */
    static NATIVE => 1

    /**
     * Native name: PACKMAN_RUNTIME_SILVERLIGHTMOBILE
     * @type {Integer (Int32)}
     */
    static SILVERLIGHTMOBILE => 2

    /**
     * Native name: PACKMAN_RUNTIME_XNA
     * @type {Integer (Int32)}
     */
    static XNA => 3

    /**
     * Native name: PACKMAN_RUNTIME_MODERN_NATIVE
     * @type {Integer (Int32)}
     */
    static MODERN_NATIVE => 4

    /**
     * Native name: PACKMAN_RUNTIME_JUPITER
     * @type {Integer (Int32)}
     */
    static JUPITER => 5

    /**
     * Native name: PACKMAN_RUNTIME_INVALID
     * @type {Integer (Int32)}
     */
    static INVALID => 6
}
