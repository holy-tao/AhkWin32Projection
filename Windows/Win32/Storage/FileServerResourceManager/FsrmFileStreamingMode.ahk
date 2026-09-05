#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the streaming modes to use for the file stream.
 * @see https://learn.microsoft.com/windows/win32/api/fsrmenums/ne-fsrmenums-fsrmfilestreamingmode
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 */
class FsrmFileStreamingMode extends Win32Enum {

    /**
     * The streaming mode is unknown; do not use this value.
     * Native name: FsrmFileStreamingMode_Unknown
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * Use the streaming interface for reading from the file.
     * Native name: FsrmFileStreamingMode_Read
     * @type {Integer (Int32)}
     */
    static Read => 1

    /**
     * Use the streaming interface for writing to the  file.
     * Native name: FsrmFileStreamingMode_Write
     * @type {Integer (Int32)}
     */
    static Write => 2
}
