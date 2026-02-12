#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify the starting behavior of effects in a playlist.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.effects.lamparrayeffectstartmode
 * @namespace Windows.Devices.Lights.Effects
 * @version WindowsRuntime 1.4
 */
class LampArrayEffectStartMode extends Win32Enum{

    /**
     * Specifies that effects should be started one at a time, in the order in which they were added.
     * @type {Integer (Int32)}
     */
    static Sequential => 0

    /**
     * Specifies that effects should be started all at the same time.
     * @type {Integer (Int32)}
     */
    static Simultaneous => 1
}
