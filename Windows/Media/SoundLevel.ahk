#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32Enum.ahk

/**
 * Specifies the sound level of the capture or render stream.
 * @remarks
 * The sound level of an application applies to the state of its capture and render streams.
 * @see https://learn.microsoft.com/uwp/api/windows.media.soundlevel
 * @namespace Windows.Media
 * @version WindowsRuntime 1.4
 */
class SoundLevel extends Win32Enum{

    /**
     * The sound level is muted.
     * @type {Integer (Int32)}
     */
    static Muted => 0

    /**
     * The sound level is low.
     * @type {Integer (Int32)}
     */
    static Low => 1

    /**
     * The sound level is at full volume.
     * @type {Integer (Int32)}
     */
    static Full => 2
}
