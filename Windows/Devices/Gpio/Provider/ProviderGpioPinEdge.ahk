#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Describes the possible types of change that can occur to the value of the general-purpose I/O (GPIO) pin.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.gpio.provider.providergpiopinedge
 * @namespace Windows.Devices.Gpio.Provider
 * @version WindowsRuntime 1.4
 */
class ProviderGpioPinEdge extends Win32Enum{

    /**
     * The falling edge, or when value goes from high to low.
     * @type {Integer (Int32)}
     */
    static FallingEdge => 0

    /**
     * The rising edge, or when value goes from low to high.
     * @type {Integer (Int32)}
     */
    static RisingEdge => 1
}
