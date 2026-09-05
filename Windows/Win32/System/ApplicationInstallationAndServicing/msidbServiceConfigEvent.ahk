#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
class msidbServiceConfigEvent extends Win32Enum {

    /**
     * Native name: msidbServiceConfigEventInstall
     * @type {Integer (Int32)}
     */
    static Install => 1

    /**
     * Native name: msidbServiceConfigEventUninstall
     * @type {Integer (Int32)}
     */
    static Uninstall => 2

    /**
     * Native name: msidbServiceConfigEventReinstall
     * @type {Integer (Int32)}
     */
    static Reinstall => 4
}
