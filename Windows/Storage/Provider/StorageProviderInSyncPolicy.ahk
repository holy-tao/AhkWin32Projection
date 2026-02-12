#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Contains the file and directory attributes supported by the sync root.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageproviderinsyncpolicy
 * @namespace Windows.Storage.Provider
 * @version WindowsRuntime 1.4
 */
class StorageProviderInSyncPolicy extends Win32BitflagEnum{

    /**
     * The default sync policy value.
     * @type {Integer (UInt32)}
     */
    static Default => 0

    /**
     * The file creation time.
     * @type {Integer (UInt32)}
     */
    static FileCreationTime => 1

    /**
     * Read-only attribute of a file.
     * @type {Integer (UInt32)}
     */
    static FileReadOnlyAttribute => 2

    /**
     * Hidden attribute of a file.
     * @type {Integer (UInt32)}
     */
    static FileHiddenAttribute => 4

    /**
     * System attribute of a file.
     * @type {Integer (UInt32)}
     */
    static FileSystemAttribute => 8

    /**
     * The directory creation time.
     * @type {Integer (UInt32)}
     */
    static DirectoryCreationTime => 16

    /**
     * Read-only attribute of a directory.
     * @type {Integer (UInt32)}
     */
    static DirectoryReadOnlyAttribute => 32

    /**
     * Hidden attribute of a directory.
     * @type {Integer (UInt32)}
     */
    static DirectoryHiddenAttribute => 64

    /**
     * System attribute of a file.
     * @type {Integer (UInt32)}
     */
    static DirectorySystemAttribute => 128

    /**
     * The last write time on a file.
     * @type {Integer (UInt32)}
     */
    static FileLastWriteTime => 256

    /**
     * The last write time on a directory.
     * @type {Integer (UInt32)}
     */
    static DirectoryLastWriteTime => 512

    /**
     * Value reserved for the sync engine.
     * @type {Integer (UInt32)}
     */
    static PreserveInsyncForSyncEngine => 2147483648
}
