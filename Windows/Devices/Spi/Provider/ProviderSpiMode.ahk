#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the SPI communication mode. The communication mode defines the clock edge on which the master out line toggles, the master in line samples, and the signal clock's signal steady level (named SCLK). Each mode is defined with a pair of parameters called clock polarity (CPOL) and clock phase (CPHA).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.spi.provider.providerspimode
 * @namespace Windows.Devices.Spi.Provider
 * @version WindowsRuntime 1.4
 */
class ProviderSpiMode extends Win32Enum{

    /**
     * CPOL = 0, CPHA = 0.
     * @type {Integer (Int32)}
     */
    static Mode0 => 0

    /**
     * CPOL = 0, CPHA = 1.
     * @type {Integer (Int32)}
     */
    static Mode1 => 1

    /**
     * CPOL = 1, CPHA = 0.
     * @type {Integer (Int32)}
     */
    static Mode2 => 2

    /**
     * CPOL = 1, CPHA = 1.
     * @type {Integer (Int32)}
     */
    static Mode3 => 3
}
