#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Describes the channel modes that the ADC controller can use for input.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.adc.adcchannelmode
 * @namespace Windows.Devices.Adc
 * @version WindowsRuntime 1.4
 */
class AdcChannelMode extends Win32Enum{

    /**
     * Simple value of a particular pin.
     * @type {Integer (Int32)}
     */
    static SingleEnded => 0

    /**
     * Difference between two pins.
     * @type {Integer (Int32)}
     */
    static Differential => 1
}
