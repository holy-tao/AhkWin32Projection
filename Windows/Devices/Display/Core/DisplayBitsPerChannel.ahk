#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify a number of bits per channel, as flags.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaybitsperchannel
 * @namespace Windows.Devices.Display.Core
 * @version WindowsRuntime 1.4
 */
class DisplayBitsPerChannel extends Win32BitflagEnum{

    /**
     * Indicates no specific number of bits per channel.
     * @type {Integer (UInt32)}
     */
    static None => 0

    /**
     * Indicates 6 bits per channel.
     * @type {Integer (UInt32)}
     */
    static Bpc6 => 1

    /**
     * Indicates 8 bits per channel.
     * @type {Integer (UInt32)}
     */
    static Bpc8 => 2

    /**
     * Indicates 10 bits per channel.
     * @type {Integer (UInt32)}
     */
    static Bpc10 => 4

    /**
     * Indicates 12 bits per channel.
     * @type {Integer (UInt32)}
     */
    static Bpc12 => 8

    /**
     * Indicates 14 bits per channel.
     * @type {Integer (UInt32)}
     */
    static Bpc14 => 16

    /**
     * Indicates 16 bits per channel.
     * @type {Integer (UInt32)}
     */
    static Bpc16 => 32
}
