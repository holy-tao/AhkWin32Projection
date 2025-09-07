#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the possible types of file system property ids.
 * @see https://learn.microsoft.com/windows/win32/api/fsrmenums/ne-fsrmenums-fsrmfilesystempropertyid
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class FsrmFileSystemPropertyId{

    /**
     * The file system property id is not used. This is the default.
     * @type {Integer (Int32)}
     */
    static FsrmFileSystemPropertyId_Undefined => 0

    /**
     * The file system property id is the filename, including the extension.
     * @type {Integer (Int32)}
     */
    static FsrmFileSystemPropertyId_FileName => 1

    /**
     * The file system property id is the file's creation time.
     * @type {Integer (Int32)}
     */
    static FsrmFileSystemPropertyId_DateCreated => 2

    /**
     * The file system property id is the file's last accessed time.
     * @type {Integer (Int32)}
     */
    static FsrmFileSystemPropertyId_DateLastAccessed => 3

    /**
     * The file system property id is the file's last modified time.
     * @type {Integer (Int32)}
     */
    static FsrmFileSystemPropertyId_DateLastModified => 4

    /**
     * The file system property id is the current time.
     * @type {Integer (Int32)}
     */
    static FsrmFileSystemPropertyId_DateNow => 5
}
