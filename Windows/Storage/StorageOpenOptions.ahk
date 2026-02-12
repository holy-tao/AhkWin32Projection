#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32Enum.ahk

/**
 * Provides options to use when opening a file.
 * @remarks
 * For more explanation on usage, see [OpenAsync](istoragefile2_openasync_1542217918.md).
 * @see https://learn.microsoft.com/uwp/api/windows.storage.storageopenoptions
 * @namespace Windows.Storage
 * @version WindowsRuntime 1.4
 */
class StorageOpenOptions extends Win32BitflagEnum{

    /**
     * No options are specified.
     * @type {Integer (UInt32)}
     */
    static None => 0

    /**
     * Only allow the file to be read.
     * @type {Integer (UInt32)}
     */
    static AllowOnlyReaders => 1

    /**
     * Allows both readers and writers to coexist.
     * @type {Integer (UInt32)}
     */
    static AllowReadersAndWriters => 2
}
