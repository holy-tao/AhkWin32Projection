#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Describes the modes in which you can open a general-purpose I/O (GPIO) pin. These modes determine whether other connections to the GPIO pin can be opened while you have the pin open.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.gpio.gpiosharingmode
 * @namespace Windows.Devices.Gpio
 * @version WindowsRuntime 1.4
 */
class GpioSharingMode extends Win32Enum{

    /**
     * Opens the GPIO pin exclusively, so that no other connection to the pin can be opened.
     * @type {Integer (Int32)}
     */
    static Exclusive => 0

    /**
     * Opens the GPIO pin as shared, so that other connections in **SharedReadOnly** mode to the pin can be opened.
     * 
     * You can only perform operations that do not change the state of the GPIO pin in shared mode. Operations that you can perform on the GPIO pin in shared mode include:
     * 
     * 
     * + Calling the [GpioPin.Read](gpiopin_read_431746835.md) method.
     * + Calling the [GpioPin.GetDriveMode](gpiopin_getdrivemode_1456675415.md) method.
     * + Getting the values of properties, such as [GpioPin.PinNumber](gpiopin_pinnumber.md) and [GpioPin.DebounceTimeout](gpiopin_debouncetimeout.md).
     * + Registering an event handler for the [GpioPin.ValueChanged](gpiopin_valuechanged.md) event.
     * @type {Integer (Int32)}
     */
    static SharedReadOnly => 1
}
