#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Determines how the pin value is represented. Implementation of specifics are decided by the provider, so differential may be fully or pseudo differential.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.adc.provider.provideradcchannelmode
 * @namespace Windows.Devices.Adc.Provider
 * @version WindowsRuntime 1.4
 */
class ProviderAdcChannelMode extends Win32Enum{

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
