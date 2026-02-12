#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Indicates the possible states that the player can be in.
  * 
  * > [!NOTE]
  * > **MediaPlayerState** may be altered or unavailable after Windows 10, version 1607. Use [MediaPlaybackState](mediaplaybackstate.md) instead.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplayerstate
 * @namespace Windows.Media.Playback
 * @version WindowsRuntime 1.4
 */
class MediaPlayerState extends Win32Enum{

    /**
     * The media player is closed.
     * @type {Integer (Int32)}
     */
    static Closed => 0

    /**
     * The media player is opening.
     * @type {Integer (Int32)}
     */
    static Opening => 1

    /**
     * The media player is buffering content.
     * @type {Integer (Int32)}
     */
    static Buffering => 2

    /**
     * The media player is playing.
     * @type {Integer (Int32)}
     */
    static Playing => 3

    /**
     * The media player is paused.
     * @type {Integer (Int32)}
     */
    static Paused => 4

    /**
     * Not implemented.
     * @type {Integer (Int32)}
     */
    static Stopped => 5
}
