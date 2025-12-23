#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The WMPPlaylistChangeEventType enumeration type defines the types of changes that can be made to a playlist.
 * @see https://learn.microsoft.com/windows/win32/api/wmp/ne-wmp-wmpplaylistchangeeventtype
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class WMPPlaylistChangeEventType extends Win32Enum{

    /**
     * An unknown change has occurred.
     * @type {Integer (Int32)}
     */
    static wmplcUnknown => 0

    /**
     * The playlist has been cleared.
     * @type {Integer (Int32)}
     */
    static wmplcClear => 1

    /**
     * A playlist attribute has changed value.
     * @type {Integer (Int32)}
     */
    static wmplcInfoChange => 2

    /**
     * A media item within the playlist has been moved to a new position.
     * @type {Integer (Int32)}
     */
    static wmplcMove => 3

    /**
     * A media item has been deleted from the playlist.
     * @type {Integer (Int32)}
     */
    static wmplcDelete => 4

    /**
     * A media item has been inserted into the playlist.
     * @type {Integer (Int32)}
     */
    static wmplcInsert => 5

    /**
     * A media item has been appended to the playlist.
     * @type {Integer (Int32)}
     */
    static wmplcAppend => 6

    /**
     * Not supported.
     * @type {Integer (Int32)}
     */
    static wmplcPrivate => 7

    /**
     * The name of the playlist has changed.
     * @type {Integer (Int32)}
     */
    static wmplcNameChange => 8

    /**
     * Not supported.
     * @type {Integer (Int32)}
     */
    static wmplcMorph => 9

    /**
     * The playlist has been sorted.
     * @type {Integer (Int32)}
     */
    static wmplcSort => 10

    /**
     * Last enumerated value. Not a valid change type.
     * @type {Integer (Int32)}
     */
    static wmplcLast => 11
}
