#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 * @version v4.0.30319
 */
class FILE_KNOWN_FOLDER_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static KnownFolderNone => 0

    /**
     * @type {Integer (Int32)}
     */
    static KnownFolderDesktop => 1

    /**
     * @type {Integer (Int32)}
     */
    static KnownFolderDocuments => 2

    /**
     * @type {Integer (Int32)}
     */
    static KnownFolderDownloads => 3

    /**
     * @type {Integer (Int32)}
     */
    static KnownFolderMusic => 4

    /**
     * @type {Integer (Int32)}
     */
    static KnownFolderPictures => 5

    /**
     * @type {Integer (Int32)}
     */
    static KnownFolderVideos => 6

    /**
     * @type {Integer (Int32)}
     */
    static KnownFolderOther => 7

    /**
     * @type {Integer (Int32)}
     */
    static KnownFolderMax => 7
}
