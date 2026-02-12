#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32Enum.ahk

/**
 * Defines values for the status of the media playback.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.mediaplaybackstatus
 * @namespace Windows.Media
 * @version WindowsRuntime 1.4
 */
class MediaPlaybackStatus extends Win32Enum{

    /**
     * The media is closed.
     * @type {Integer (Int32)}
     */
    static Closed => 0

    /**
     * The media is changing.
     * @type {Integer (Int32)}
     */
    static Changing => 1

    /**
     * The media is stopped.
     * @type {Integer (Int32)}
     */
    static Stopped => 2

    /**
     * The media is playing.
     * @type {Integer (Int32)}
     */
    static Playing => 3

    /**
     * The media is paused.
     * @type {Integer (Int32)}
     */
    static Paused => 4
}
