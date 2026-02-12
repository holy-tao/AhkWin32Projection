#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Devices.Printers
 * @version WindowsRuntime 1.4
 */
class IppPrintDeviceInstallationStatus extends Win32Enum{

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
    static CommunicationError => 2

    /**
     * @type {Integer (Int32)}
     */
    static OtherFailure => 3
}
