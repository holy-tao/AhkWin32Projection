#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32Enum.ahk

/**
 * Indicates the reason that data could not be streamed.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.storage.streamedfilefailuremode
 * @namespace Windows.Storage
 * @version WindowsRuntime 1.4
 */
class StreamedFileFailureMode extends Win32Enum{

    /**
     * Streaming the data failed.
     * @type {Integer (Int32)}
     */
    static Failed => 0

    /**
     * The data could not be accessed.
     * @type {Integer (Int32)}
     */
    static CurrentlyUnavailable => 1

    /**
     * Streaming the data failed to complete.
     * @type {Integer (Int32)}
     */
    static Incomplete => 2
}
