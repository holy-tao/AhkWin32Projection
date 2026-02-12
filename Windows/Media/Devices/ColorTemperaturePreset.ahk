#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the values for the possible color temperature presets.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.devices.colortemperaturepreset
 * @namespace Windows.Media.Devices
 * @version WindowsRuntime 1.4
 */
class ColorTemperaturePreset extends Win32Enum{

    /**
     * Indicates that the color temperature is set automatically.
     * @type {Integer (Int32)}
     */
    static Auto => 0

    /**
     * Indicates that the color temperature is set manually.
     * @type {Integer (Int32)}
     */
    static Manual => 1

    /**
     * Indicates that the color temperature is adjusted for a cloudy scene.
     * @type {Integer (Int32)}
     */
    static Cloudy => 2

    /**
     * Indicates that the color temperature is adjusted for a daylight scene.
     * @type {Integer (Int32)}
     */
    static Daylight => 3

    /**
     * Indicates that the color temperature is adjusted for a scene lit by a flash.
     * @type {Integer (Int32)}
     */
    static Flash => 4

    /**
     * Indicates that the color temperature is adjusted for a scene lit by fluorescent light.
     * @type {Integer (Int32)}
     */
    static Fluorescent => 5

    /**
     * Indicates that the color temperature is adjusted for a scene lit by tungsten light.
     * @type {Integer (Int32)}
     */
    static Tungsten => 6

    /**
     * Indicates that the color temperature is adjusted for a scene lit by candlelight.
     * @type {Integer (Int32)}
     */
    static Candlelight => 7
}
