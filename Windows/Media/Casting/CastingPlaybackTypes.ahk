#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Indicates the capabilities of a particular casting device.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.casting.castingplaybacktypes
 * @namespace Windows.Media.Casting
 * @version WindowsRuntime 1.4
 */
class CastingPlaybackTypes extends Win32BitflagEnum{

    /**
     * The casting device does not support playback.
     * @type {Integer (UInt32)}
     */
    static None => 0

    /**
     * The casting device supports audio playback.
     * @type {Integer (UInt32)}
     */
    static Audio => 1

    /**
     * The casting device supports video playback.
     * @type {Integer (UInt32)}
     */
    static Video => 2

    /**
     * The casting device supports image playback.
     * @type {Integer (UInt32)}
     */
    static Picture => 4
}
