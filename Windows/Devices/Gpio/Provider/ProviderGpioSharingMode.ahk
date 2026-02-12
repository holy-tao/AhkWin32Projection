#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Describes the modes in which you can open a general-purpose I/O (GPIO) pin. These modes determine whether other connections to the GPIO pin can be opened while you have the pin open.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.gpio.provider.providergpiosharingmode
 * @namespace Windows.Devices.Gpio.Provider
 * @version WindowsRuntime 1.4
 */
class ProviderGpioSharingMode extends Win32Enum{

    /**
     * Opens the GPIO pin exclusively, so that no other connection to the pin can be opened.
     * @type {Integer (Int32)}
     */
    static Exclusive => 0

    /**
     * Opens the GPIO pin as shared, so that other connections in **SharedReadOnly** mode to the pin can be opened. Only operations that do not change the state of the pin can be performed.
     * @type {Integer (Int32)}
     */
    static SharedReadOnly => 1
}
