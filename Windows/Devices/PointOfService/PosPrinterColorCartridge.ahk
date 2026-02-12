#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Describes the color cartridges that the point-of-service printer can use for printing.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.posprintercolorcartridge
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class PosPrinterColorCartridge extends Win32Enum{

    /**
     * An unknown color cartridge.
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * The primary color cartridge.
     * @type {Integer (Int32)}
     */
    static Primary => 1

    /**
     * The first custom color cartridge, which provides a secondary color, usually red.
     * @type {Integer (Int32)}
     */
    static Custom1 => 2

    /**
     * The second custom color cartridge.
     * @type {Integer (Int32)}
     */
    static Custom2 => 3

    /**
     * The third custom color cartridge.
     * @type {Integer (Int32)}
     */
    static Custom3 => 4

    /**
     * The fourth custom color cartridge.
     * @type {Integer (Int32)}
     */
    static Custom4 => 5

    /**
     * The fifth custom color cartridge.
     * @type {Integer (Int32)}
     */
    static Custom5 => 6

    /**
     * The sixth custom color cartridge.
     * @type {Integer (Int32)}
     */
    static Custom6 => 7

    /**
     * The cyan cartridge for full color printing.
     * @type {Integer (Int32)}
     */
    static Cyan => 8

    /**
     * The magenta cartridge for full color printing.
     * @type {Integer (Int32)}
     */
    static Magenta => 9

    /**
     * The yellow cartridge for full color printing.
     * @type {Integer (Int32)}
     */
    static Yellow => 10
}
