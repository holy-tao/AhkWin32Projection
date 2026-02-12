#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify how to rotate content from a frame buffer to a target.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displayrotation
 * @namespace Windows.Devices.Display.Core
 * @version WindowsRuntime 1.4
 */
class DisplayRotation extends Win32Enum{

    /**
     * Specifies no rotation.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Specifies a rotation of 90 degrees clockwise.
     * @type {Integer (Int32)}
     */
    static Clockwise90Degrees => 1

    /**
     * Specifies a rotation of 180 degrees clockwise.
     * @type {Integer (Int32)}
     */
    static Clockwise180Degrees => 2

    /**
     * Specifies a rotation of 270 degrees clockwise.
     * @type {Integer (Int32)}
     */
    static Clockwise270Degrees => 3
}
