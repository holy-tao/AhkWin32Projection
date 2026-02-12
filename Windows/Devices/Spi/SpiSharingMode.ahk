#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the sharing mode for the SPI bus.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.spi.spisharingmode
 * @namespace Windows.Devices.Spi
 * @version WindowsRuntime 1.4
 */
class SpiSharingMode extends Win32Enum{

    /**
     * SPI bus segment is not shared.
     * @type {Integer (Int32)}
     */
    static Exclusive => 0

    /**
     * SPI bus is shared.
     * @type {Integer (Int32)}
     */
    static Shared => 1
}
