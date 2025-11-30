#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class PACKMAN_RUNTIME extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static PACKMAN_RUNTIME_NATIVE => 1

    /**
     * @type {Integer (Int32)}
     */
    static PACKMAN_RUNTIME_SILVERLIGHTMOBILE => 2

    /**
     * @type {Integer (Int32)}
     */
    static PACKMAN_RUNTIME_XNA => 3

    /**
     * @type {Integer (Int32)}
     */
    static PACKMAN_RUNTIME_MODERN_NATIVE => 4

    /**
     * @type {Integer (Int32)}
     */
    static PACKMAN_RUNTIME_JUPITER => 5

    /**
     * @type {Integer (Int32)}
     */
    static PACKMAN_RUNTIME_INVALID => 6
}
