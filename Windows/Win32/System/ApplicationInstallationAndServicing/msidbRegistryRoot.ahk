#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class msidbRegistryRoot extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static msidbRegistryRootClassesRoot => 0

    /**
     * @type {Integer (Int32)}
     */
    static msidbRegistryRootCurrentUser => 1

    /**
     * @type {Integer (Int32)}
     */
    static msidbRegistryRootLocalMachine => 2

    /**
     * @type {Integer (Int32)}
     */
    static msidbRegistryRootUsers => 3
}
