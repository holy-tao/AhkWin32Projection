#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
class msidbRegistryRoot extends Win32Enum {

    /**
     * Native name: msidbRegistryRootClassesRoot
     * @type {Integer (Int32)}
     */
    static ClassesRoot => 0

    /**
     * Native name: msidbRegistryRootCurrentUser
     * @type {Integer (Int32)}
     */
    static CurrentUser => 1

    /**
     * Native name: msidbRegistryRootLocalMachine
     * @type {Integer (Int32)}
     */
    static LocalMachine => 2

    /**
     * Native name: msidbRegistryRootUsers
     * @type {Integer (Int32)}
     */
    static Users => 3
}
