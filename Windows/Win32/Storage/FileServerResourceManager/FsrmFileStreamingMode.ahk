#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the streaming modes to use for the file stream.
 * @see https://docs.microsoft.com/windows/win32/api//fsrmenums/ne-fsrmenums-fsrmfilestreamingmode
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class FsrmFileStreamingMode extends Win32Enum{

    /**
     * The streaming mode is unknown; do not use this value.
     * @type {Integer (Int32)}
     */
    static FsrmFileStreamingMode_Unknown => 0

    /**
     * Use the streaming interface for reading from the file.
     * @type {Integer (Int32)}
     */
    static FsrmFileStreamingMode_Read => 1

    /**
     * Use the streaming interface for writing to the  file.
     * @type {Integer (Int32)}
     */
    static FsrmFileStreamingMode_Write => 2
}
