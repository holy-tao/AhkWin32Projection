#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies a Wi-Fi Direct configuration method. Configuration is how a user tells one piece of Wi-Fi Direct equipment to connect to another piece of Wi-Fi Direct equipment.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.wifidirectconfigurationmethod
 * @namespace Windows.Devices.WiFiDirect
 * @version WindowsRuntime 1.4
 */
class WiFiDirectConfigurationMethod extends Win32Enum{

    /**
     * This device accepts entry of the PIN being displayed on the accepting device.
     * @type {Integer (Int32)}
     */
    static ProvidePin => 0

    /**
     * This device accepts connections from devices that provide the PIN this device currently displays.
     * @type {Integer (Int32)}
     */
    static DisplayPin => 1

    /**
     * This device uses the pushbutton method for pairing. A user pushes a button on both the connecting device and the accepting device in order to establish a connection between them.
     * @type {Integer (Int32)}
     */
    static PushButton => 2
}
