#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The WMPOpenState enumeration type defines the possible operational states of Windows Media Player as it opens a digital media file.
 * @see https://docs.microsoft.com/windows/win32/api//wmp/ne-wmp-wmpopenstate
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class WMPOpenState extends Win32Enum{

    /**
     * The content source is in an undefined state.
     * @type {Integer (Int32)}
     */
    static wmposUndefined => 0

    /**
     * A new playlist is about to be loaded.
     * @type {Integer (Int32)}
     */
    static wmposPlaylistChanging => 1

    /**
     * Locating the playlist.
     * @type {Integer (Int32)}
     */
    static wmposPlaylistLocating => 2

    /**
     * Connecting to the server that is hosting the playlist.
     * @type {Integer (Int32)}
     */
    static wmposPlaylistConnecting => 3

    /**
     * Loading a playlist.
     * @type {Integer (Int32)}
     */
    static wmposPlaylistLoading => 4

    /**
     * Opening a playlist.
     * @type {Integer (Int32)}
     */
    static wmposPlaylistOpening => 5

    /**
     * Playlist is open.
     * @type {Integer (Int32)}
     */
    static wmposPlaylistOpenNoMedia => 6

    /**
     * Playlist has changed.
     * @type {Integer (Int32)}
     */
    static wmposPlaylistChanged => 7

    /**
     * New media item is about to be loaded.
     * @type {Integer (Int32)}
     */
    static wmposMediaChanging => 8

    /**
     * Locating the media item.
     * @type {Integer (Int32)}
     */
    static wmposMediaLocating => 9

    /**
     * Connecting to the server that is hosting the media item.
     * @type {Integer (Int32)}
     */
    static wmposMediaConnecting => 10

    /**
     * Loading the media item.
     * @type {Integer (Int32)}
     */
    static wmposMediaLoading => 11

    /**
     * Opening the media item.
     * @type {Integer (Int32)}
     */
    static wmposMediaOpening => 12

    /**
     * The media item is open.
     * @type {Integer (Int32)}
     */
    static wmposMediaOpen => 13

    /**
     * Starting codec acquisition.
     * @type {Integer (Int32)}
     */
    static wmposBeginCodecAcquisition => 14

    /**
     * Ending codec acquisition.
     * @type {Integer (Int32)}
     */
    static wmposEndCodecAcquisition => 15

    /**
     * Starting license acquisition.
     * @type {Integer (Int32)}
     */
    static wmposBeginLicenseAcquisition => 16

    /**
     * Ending license acquisition.
     * @type {Integer (Int32)}
     */
    static wmposEndLicenseAcquisition => 17

    /**
     * Starting individualization.
     * @type {Integer (Int32)}
     */
    static wmposBeginIndividualization => 18

    /**
     * Individualization has ended.
     * @type {Integer (Int32)}
     */
    static wmposEndIndividualization => 19

    /**
     * Waiting for the media item to open.
     * @type {Integer (Int32)}
     */
    static wmposMediaWaiting => 20

    /**
     * Opening a URL whose type is unknown.
     * @type {Integer (Int32)}
     */
    static wmposOpeningUnknownURL => 21
}
