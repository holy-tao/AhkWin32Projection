#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Values describing how service configuration is performed when a session is being established. Typically, either no input is required, or one device in the session displays a PIN and the other device requires that the PIN be entered.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.services.wifidirectserviceconfigurationmethod
 * @namespace Windows.Devices.WiFiDirect.Services
 * @version WindowsRuntime 1.4
 */
class WiFiDirectServiceConfigurationMethod extends Win32Enum{

    /**
     * Do not require input at configuration.
     * @type {Integer (Int32)}
     */
    static Default => 0

    /**
     * Display a PIN at configuration.
     * @type {Integer (Int32)}
     */
    static PinDisplay => 1

    /**
     * Request PIN entry at configuration.
     * @type {Integer (Int32)}
     */
    static PinEntry => 2
}
