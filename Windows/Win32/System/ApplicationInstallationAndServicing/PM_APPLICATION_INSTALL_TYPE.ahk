#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
class PM_APPLICATION_INSTALL_TYPE extends Win32Enum {

    /**
     * Native name: PM_APPLICATION_INSTALL_NORMAL
     * @type {Integer (Int32)}
     */
    static NORMAL => 0

    /**
     * Native name: PM_APPLICATION_INSTALL_IN_ROM
     * @type {Integer (Int32)}
     */
    static IN_ROM => 1

    /**
     * Native name: PM_APPLICATION_INSTALL_PA
     * @type {Integer (Int32)}
     */
    static PA => 2

    /**
     * Native name: PM_APPLICATION_INSTALL_DEBUG
     * @type {Integer (Int32)}
     */
    static DEBUG => 3

    /**
     * Native name: PM_APPLICATION_INSTALL_ENTERPRISE
     * @type {Integer (Int32)}
     */
    static ENTERPRISE => 4

    /**
     * Native name: PM_APPLICATION_INSTALL_INVALID
     * @type {Integer (Int32)}
     */
    static INVALID => 5
}
