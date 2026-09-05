#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the possible types of file system property ids.
 * @see https://learn.microsoft.com/windows/win32/api/fsrmenums/ne-fsrmenums-fsrmfilesystempropertyid
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 */
class FsrmFileSystemPropertyId extends Win32Enum {

    /**
     * The file system property id is not used. This is the default.
     * Native name: FsrmFileSystemPropertyId_Undefined
     * @type {Integer (Int32)}
     */
    static Undefined => 0

    /**
     * The file system property id is the filename, including the extension.
     * Native name: FsrmFileSystemPropertyId_FileName
     * @type {Integer (Int32)}
     */
    static FileName => 1

    /**
     * The file system property id is the file's creation time.
     * Native name: FsrmFileSystemPropertyId_DateCreated
     * @type {Integer (Int32)}
     */
    static DateCreated => 2

    /**
     * The file system property id is the file's last accessed time.
     * Native name: FsrmFileSystemPropertyId_DateLastAccessed
     * @type {Integer (Int32)}
     */
    static DateLastAccessed => 3

    /**
     * The file system property id is the file's last modified time.
     * Native name: FsrmFileSystemPropertyId_DateLastModified
     * @type {Integer (Int32)}
     */
    static DateLastModified => 4

    /**
     * The file system property id is the current time.
     * Native name: FsrmFileSystemPropertyId_DateNow
     * @type {Integer (Int32)}
     */
    static DateNow => 5
}
