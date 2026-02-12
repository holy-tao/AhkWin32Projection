#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Describes the possible values for a general-purpose I/O (GPIO) pin.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.gpio.gpiopinvalue
 * @namespace Windows.Devices.Gpio
 * @version WindowsRuntime 1.4
 */
class GpioPinValue extends Win32Enum{

    /**
     * The value of the GPIO pin is low.
     * @type {Integer (Int32)}
     */
    static Low => 0

    /**
     * The value of the GPIO pin is high.
     * @type {Integer (Int32)}
     */
    static High => 1
}
