#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the kinds of metadata that can be automatically displayed for a [MediaPlaybackItem](mediaplaybackitem.md). Set the type of data you want to be automatically loaded by assigning one of these values to the [AutoLoadedDisplayProperties](mediaplaybackitem_autoloadeddisplayproperties.md) properties.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.playback.autoloadeddisplaypropertykind
 * @namespace Windows.Media.Playback
 * @version WindowsRuntime 1.4
 */
class AutoLoadedDisplayPropertyKind extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * @type {Integer (Int32)}
     */
    static MusicOrVideo => 1

    /**
     * @type {Integer (Int32)}
     */
    static Music => 2

    /**
     * @type {Integer (Int32)}
     */
    static Video => 3
}
