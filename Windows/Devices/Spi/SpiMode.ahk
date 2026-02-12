#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the SPI communication mode. The communication mode defines the clock edge on which the host out line toggles, the host in line samples, and the signal clock's signal steady level (named SCLK). Each mode is defined with a pair of parameters called clock polarity (CPOL) and clock phase (CPHA).
  * 
  * For the definition of *host*, see [Windows.Devices.Spi namespace](/uwp/api/windows.devices.spi).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.spi.spimode
 * @namespace Windows.Devices.Spi
 * @version WindowsRuntime 1.4
 */
class SpiMode extends Win32Enum{

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
