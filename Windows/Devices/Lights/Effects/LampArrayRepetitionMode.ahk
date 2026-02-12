#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify the repetition behavior for effect/playlist.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.effects.lamparrayrepetitionmode
 * @namespace Windows.Devices.Lights.Effects
 * @version WindowsRuntime 1.4
 */
class LampArrayRepetitionMode extends Win32Enum{

    /**
     * Specifies that the effect/playlist is run for the defined number of times.
     * @type {Integer (Int32)}
     */
    static Occurrences => 0

    /**
     * Specifies that the effect/playlist is run forever. Can only be stopped by stopping the playlist.
     * @type {Integer (Int32)}
     */
    static Forever => 1
}
