#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32Enum.ahk

/**
 * Specifies the auto repeat mode for media playback.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.mediaplaybackautorepeatmode
 * @namespace Windows.Media
 * @version WindowsRuntime 1.4
 */
class MediaPlaybackAutoRepeatMode extends Win32Enum{

    /**
     * No repeating.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Repeat the current track.
     * @type {Integer (Int32)}
     */
    static Track => 1

    /**
     * Repeat the current list of tracks.
     * @type {Integer (Int32)}
     */
    static List => 2
}
