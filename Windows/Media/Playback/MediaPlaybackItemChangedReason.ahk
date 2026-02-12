#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the reason why the current [MediaPlaybackItem](mediaplaybackitem.md) in a [MediaPlaybackList](mediaplaybacklist.md) changed. Check for the reason by accessing the [Reason](currentmediaplaybackitemchangedeventargs_reason.md) property of the [CurrentMediaPlaybackItemChangedEventArgs](currentmediaplaybackitemchangedeventargs.md) object passed into the [MediaPlaybackList.CurrentItemChanged](mediaplaybacklist_currentitemchanged.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybackitemchangedreason
 * @namespace Windows.Media.Playback
 * @version WindowsRuntime 1.4
 */
class MediaPlaybackItemChangedReason extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static InitialItem => 0

    /**
     * @type {Integer (Int32)}
     */
    static EndOfStream => 1

    /**
     * @type {Integer (Int32)}
     */
    static Error => 2

    /**
     * @type {Integer (Int32)}
     */
    static AppRequested => 3
}
