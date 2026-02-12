#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Describes the possible color cartridges that a point-of-service printer can support.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.posprintercolorcapabilities
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class PosPrinterColorCapabilities extends Win32BitflagEnum{

    /**
     * Supports no color cartridges.
     * @type {Integer (UInt32)}
     */
    static None => 0

    /**
     * Supports a primary color cartridge.
     * @type {Integer (UInt32)}
     */
    static Primary => 1

    /**
     * Supports a first custom color cartridge, which provides a secondary color, usually red.
     * @type {Integer (UInt32)}
     */
    static Custom1 => 2

    /**
     * Supports a second custom color cartridge.
     * @type {Integer (UInt32)}
     */
    static Custom2 => 4

    /**
     * Supports a third custom color cartridge.
     * @type {Integer (UInt32)}
     */
    static Custom3 => 8

    /**
     * Supports a fourth custom color cartridge.
     * @type {Integer (UInt32)}
     */
    static Custom4 => 16

    /**
     * Supports a fifth custom color cartridge.
     * @type {Integer (UInt32)}
     */
    static Custom5 => 32

    /**
     * Supports a sixth custom color cartridge.
     * @type {Integer (UInt32)}
     */
    static Custom6 => 64

    /**
     * Supports a cyan cartridge for full color printing.
     * @type {Integer (UInt32)}
     */
    static Cyan => 128

    /**
     * Supports a magenta cartridge for full color printing.
     * @type {Integer (UInt32)}
     */
    static Magenta => 256

    /**
     * Supports a yellow cartridge for full color printing.
     * @type {Integer (UInt32)}
     */
    static Yellow => 512

    /**
     * Supports full color printing.
     * @type {Integer (UInt32)}
     */
    static Full => 1024
}
