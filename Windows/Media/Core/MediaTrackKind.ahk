#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the type of a media track.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.core.mediatrackkind
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class MediaTrackKind extends Win32Enum{

    /**
     * The track is an audio track.
     * @type {Integer (Int32)}
     */
    static Audio => 0

    /**
     * The track is a video track.
     * @type {Integer (Int32)}
     */
    static Video => 1

    /**
     * The track is a timed metadata track.
     * @type {Integer (Int32)}
     */
    static TimedMetadata => 2
}
