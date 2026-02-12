#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Represents the polarity of changes that are relevant to the associated action.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.gpio.gpiochangepolarity
 * @namespace Windows.Devices.Gpio
 * @version WindowsRuntime 1.4
 */
class GpioChangePolarity extends Win32Enum{

    /**
     * Transitions from high to low should trigger the associated action.
     * @type {Integer (Int32)}
     */
    static Falling => 0

    /**
     * Transitions from low to high should trigger the associated action.
     * @type {Integer (Int32)}
     */
    static Rising => 1

    /**
     * Transitions from both low to high and high to low should trigger the associated action.
     * @type {Integer (Int32)}
     */
    static Both => 2
}
