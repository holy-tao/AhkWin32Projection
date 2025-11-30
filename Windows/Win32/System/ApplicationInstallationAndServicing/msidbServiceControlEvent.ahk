#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class msidbServiceControlEvent extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static msidbServiceControlEventStart => 1

    /**
     * @type {Integer (Int32)}
     */
    static msidbServiceControlEventStop => 2

    /**
     * @type {Integer (Int32)}
     */
    static msidbServiceControlEventDelete => 8

    /**
     * @type {Integer (Int32)}
     */
    static msidbServiceControlEventUninstallStart => 16

    /**
     * @type {Integer (Int32)}
     */
    static msidbServiceControlEventUninstallStop => 32

    /**
     * @type {Integer (Int32)}
     */
    static msidbServiceControlEventUninstallDelete => 128
}
