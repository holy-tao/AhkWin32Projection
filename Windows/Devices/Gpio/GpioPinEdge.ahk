#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Describes the possible types of change that can occur to the value of the general-purpose I/O (GPIO) pin for the [GpioPin.ValueChanged](gpiopin_valuechanged.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.gpio.gpiopinedge
 * @namespace Windows.Devices.Gpio
 * @version WindowsRuntime 1.4
 */
class GpioPinEdge extends Win32Enum{

    /**
     * The value of the GPIO pin changed from high to low.
     * @type {Integer (Int32)}
     */
    static FallingEdge => 0

    /**
     * The value of the GPIO pin changed from low to high.
     * @type {Integer (Int32)}
     */
    static RisingEdge => 1
}
