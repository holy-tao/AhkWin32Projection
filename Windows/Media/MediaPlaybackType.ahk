#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32Enum.ahk

/**
 * Defines values for the types of media playback.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.mediaplaybacktype
 * @namespace Windows.Media
 * @version WindowsRuntime 1.4
 */
class MediaPlaybackType extends Win32Enum{

    /**
     * The media type is unknown.
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * The media type is audio music.
     * @type {Integer (Int32)}
     */
    static Music => 1

    /**
     * The media type is video.
     * @type {Integer (Int32)}
     */
    static Video => 2

    /**
     * The media type is an image.
     * @type {Integer (Int32)}
     */
    static Image => 3
}
