#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32Enum.ahk

/**
 * Provides values that identify storage folders.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.storage.knownfolderid
 * @namespace Windows.Storage
 * @version WindowsRuntime 1.4
 */
class KnownFolderId extends Win32Enum{

    /**
     * App Captures folder.
     * @type {Integer (Int32)}
     */
    static AppCaptures => 0

    /**
     * Camera Roll folder.
     * @type {Integer (Int32)}
     */
    static CameraRoll => 1

    /**
     * Documents library folder.
     * @type {Integer (Int32)}
     */
    static DocumentsLibrary => 2

    /**
     * HomeGroup folder.
     * @type {Integer (Int32)}
     */
    static HomeGroup => 3

    /**
     * The folder of media server (Digital Living Network Alliance (DLNA)) devices.
     * @type {Integer (Int32)}
     */
    static MediaServerDevices => 4

    /**
     * Music library folder.
     * @type {Integer (Int32)}
     */
    static MusicLibrary => 5

    /**
     * Objects 3D folder.
     * @type {Integer (Int32)}
     */
    static Objects3D => 6

    /**
     * Pictures library folder.
     * @type {Integer (Int32)}
     */
    static PicturesLibrary => 7

    /**
     * Playlists folder.
     * @type {Integer (Int32)}
     */
    static Playlists => 8

    /**
     * Recorded calls folder.
     * @type {Integer (Int32)}
     */
    static RecordedCalls => 9

    /**
     * Removable devices folder.
     * @type {Integer (Int32)}
     */
    static RemovableDevices => 10

    /**
     * Saved pictures folder.
     * @type {Integer (Int32)}
     */
    static SavedPictures => 11

    /**
     * Screenshots folder.
     * @type {Integer (Int32)}
     */
    static Screenshots => 12

    /**
     * Videos library folder.
     * @type {Integer (Int32)}
     */
    static VideosLibrary => 13

    /**
     * All app modifications folder.
     * @type {Integer (Int32)}
     */
    static AllAppMods => 14

    /**
     * Current app modifications folder.
     * @type {Integer (Int32)}
     */
    static CurrentAppMods => 15

    /**
     * Downloads library folder.
     * @type {Integer (Int32)}
     */
    static DownloadsFolder => 16
}
