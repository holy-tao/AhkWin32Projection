#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the constants that indicate the state of a line display descriptor.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.linedisplaydescriptorstate
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class LineDisplayDescriptorState extends Win32Enum{

    /**
     * Turns the descriptor off.
     * @type {Integer (Int32)}
     */
    static Off => 0

    /**
     * Turns the descriptor on.
     * @type {Integer (Int32)}
     */
    static On => 1

    /**
     * Sets the descriptor to blinking.
     * @type {Integer (Int32)}
     */
    static Blink => 2
}
