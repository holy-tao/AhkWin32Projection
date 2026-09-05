#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
class msidbRemoveFileInstallMode extends Win32Enum {

    /**
     * Native name: msidbRemoveFileInstallModeOnInstall
     * @type {Integer (Int32)}
     */
    static OnInstall => 1

    /**
     * Native name: msidbRemoveFileInstallModeOnRemove
     * @type {Integer (Int32)}
     */
    static OnRemove => 2

    /**
     * Native name: msidbRemoveFileInstallModeOnBoth
     * @type {Integer (Int32)}
     */
    static OnBoth => 3
}
