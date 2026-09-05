#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
class msidbServiceControlEvent extends Win32Enum {

    /**
     * Native name: msidbServiceControlEventStart
     * @type {Integer (Int32)}
     */
    static Start => 1

    /**
     * Native name: msidbServiceControlEventStop
     * @type {Integer (Int32)}
     */
    static Stop => 2

    /**
     * Native name: msidbServiceControlEventDelete
     * @type {Integer (Int32)}
     */
    static Delete => 8

    /**
     * Native name: msidbServiceControlEventUninstallStart
     * @type {Integer (Int32)}
     */
    static UninstallStart => 16

    /**
     * Native name: msidbServiceControlEventUninstallStop
     * @type {Integer (Int32)}
     */
    static UninstallStop => 32

    /**
     * Native name: msidbServiceControlEventUninstallDelete
     * @type {Integer (Int32)}
     */
    static UninstallDelete => 128
}
