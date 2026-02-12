#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Identifies the storage location that the file picker presents to the user.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.storage.pickers.pickerlocationid
 * @namespace Windows.Storage.Pickers
 * @version WindowsRuntime 1.4
 */
class PickerLocationId extends Win32Enum{

    /**
     * The **Documents** library.
     * @type {Integer (Int32)}
     */
    static DocumentsLibrary => 0

    /**
     * The **Computer** folder.
     * @type {Integer (Int32)}
     */
    static ComputerFolder => 1

    /**
     * The Windows desktop.
     * @type {Integer (Int32)}
     */
    static Desktop => 2

    /**
     * The **Downloads** folder.
     * @type {Integer (Int32)}
     */
    static Downloads => 3

    /**
     * The HomeGroup.
     * @type {Integer (Int32)}
     */
    static HomeGroup => 4

    /**
     * The **Music** library.
     * @type {Integer (Int32)}
     */
    static MusicLibrary => 5

    /**
     * The **Pictures** library.
     * @type {Integer (Int32)}
     */
    static PicturesLibrary => 6

    /**
     * The **Videos** library.
     * @type {Integer (Int32)}
     */
    static VideosLibrary => 7

    /**
     * The **Objects** library.
     * @type {Integer (Int32)}
     */
    static Objects3D => 8

    /**
     * An unspecified location.
     * @type {Integer (Int32)}
     */
    static Unspecified => 9
}
