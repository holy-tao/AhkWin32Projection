#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the possible values for ISO speed presets.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.devices.isospeedpreset
 * @namespace Windows.Media.Devices
 * @version WindowsRuntime 1.4
 */
class IsoSpeedPreset extends Win32Enum{

    /**
     * The film speed is automatically set.
     * @type {Integer (Int32)}
     */
    static Auto => 0

    /**
     * The film speed is set to 50 ISO.
     * @type {Integer (Int32)}
     */
    static Iso50 => 1

    /**
     * The film speed is set to 80 ISO.
     * @type {Integer (Int32)}
     */
    static Iso80 => 2

    /**
     * The film speed is set to 100 ISO.
     * @type {Integer (Int32)}
     */
    static Iso100 => 3

    /**
     * The film speed is set to 200 ISO.
     * @type {Integer (Int32)}
     */
    static Iso200 => 4

    /**
     * The film speed is set to 400 ISO.
     * @type {Integer (Int32)}
     */
    static Iso400 => 5

    /**
     * The film speed is set to 800 ISO.
     * @type {Integer (Int32)}
     */
    static Iso800 => 6

    /**
     * The film speed is set to 1600 ISO.
     * @type {Integer (Int32)}
     */
    static Iso1600 => 7

    /**
     * The film speed is set to 3200 ISO.
     * @type {Integer (Int32)}
     */
    static Iso3200 => 8

    /**
     * The film speed is set to 6400 ISO.
     * @type {Integer (Int32)}
     */
    static Iso6400 => 9

    /**
     * The film speed is set to 12800 ISO.
     * @type {Integer (Int32)}
     */
    static Iso12800 => 10

    /**
     * The film speed is set to 25600 ISO.
     * @type {Integer (Int32)}
     */
    static Iso25600 => 11
}
