#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Indicates the format of a playlist file.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.playlists.playlistformat
 * @namespace Windows.Media.Playlists
 * @version WindowsRuntime 1.4
 */
class PlaylistFormat extends Win32Enum{

    /**
     * Windows Media playlist.
     * @type {Integer (Int32)}
     */
    static WindowsMedia => 0

    /**
     * Zune playlist.
     * @type {Integer (Int32)}
     */
    static Zune => 1

    /**
     * M3U playlist.
     * @type {Integer (Int32)}
     */
    static M3u => 2
}
