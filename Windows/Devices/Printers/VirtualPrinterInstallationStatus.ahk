#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Devices.Printers
 * @version WindowsRuntime 1.4
 */
class VirtualPrinterInstallationStatus extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static InstallationSucceeded => 0

    /**
     * @type {Integer (Int32)}
     */
    static PrinterAlreadyInstalled => 1

    /**
     * @type {Integer (Int32)}
     */
    static PrinterInstallationAccessDenied => 2

    /**
     * @type {Integer (Int32)}
     */
    static PrinterInstallationFailed => 3
}
