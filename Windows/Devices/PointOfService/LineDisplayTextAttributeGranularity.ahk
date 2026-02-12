#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the constants that indicate whether the line display supports blinking or reversing the display.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.linedisplaytextattributegranularity
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class LineDisplayTextAttributeGranularity extends Win32Enum{

    /**
     * The feature is not supported.
     * @type {Integer (Int32)}
     */
    static NotSupported => 0

    /**
     * The feature is supported for the entire display.
     * @type {Integer (Int32)}
     */
    static EntireDisplay => 1

    /**
     * The feature is supported for individual characters.
     * @type {Integer (Int32)}
     */
    static PerCharacter => 2
}
