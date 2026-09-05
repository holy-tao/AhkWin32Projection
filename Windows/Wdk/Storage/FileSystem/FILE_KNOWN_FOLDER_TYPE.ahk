#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
class FILE_KNOWN_FOLDER_TYPE extends Win32Enum {

    /**
     * Native name: KnownFolderNone
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Native name: KnownFolderDesktop
     * @type {Integer (Int32)}
     */
    static Desktop => 1

    /**
     * Native name: KnownFolderDocuments
     * @type {Integer (Int32)}
     */
    static Documents => 2

    /**
     * Native name: KnownFolderDownloads
     * @type {Integer (Int32)}
     */
    static Downloads => 3

    /**
     * Native name: KnownFolderMusic
     * @type {Integer (Int32)}
     */
    static Music => 4

    /**
     * Native name: KnownFolderPictures
     * @type {Integer (Int32)}
     */
    static Pictures => 5

    /**
     * Native name: KnownFolderVideos
     * @type {Integer (Int32)}
     */
    static Videos => 6

    /**
     * Native name: KnownFolderOther
     * @type {Integer (Int32)}
     */
    static Other => 7

    /**
     * Native name: KnownFolderMax
     * @type {Integer (Int32)}
     */
    static Max => 7
}
