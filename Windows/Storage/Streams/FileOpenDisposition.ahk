#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Enumeration values for actions to take on a file.
 * @remarks
 * The results of the FileOpenDisposition values depend on whether the file exists or not.
 * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.fileopendisposition
 * @namespace Windows.Storage.Streams
 * @version WindowsRuntime 1.4
 */
class FileOpenDisposition extends Win32Enum{

    /**
     * Opens a file only if it exists.
     * @type {Integer (Int32)}
     */
    static OpenExisting => 0

    /**
     * Opens a file. If the file does not exist, a new file will be created and opened.
     * @type {Integer (Int32)}
     */
    static OpenAlways => 1

    /**
     * Creates a new file if one does not exist. If the file does exist, this will fail.
     * @type {Integer (Int32)}
     */
    static CreateNew => 2

    /**
     * Opens a file and truncates it so that its size is zero bytes. If the file does not exist, a new file will be created and opened.
     * @type {Integer (Int32)}
     */
    static CreateAlways => 3

    /**
     * Opens a file and truncates it so that its size is zero bytes. If the file does not exist, this will fail.
     * @type {Integer (Int32)}
     */
    static TruncateExisting => 4
}
