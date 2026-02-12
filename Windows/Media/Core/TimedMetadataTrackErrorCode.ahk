#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the type of error that occurred with a [TimedMetadataTrack](timedmetadatatrack.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.core.timedmetadatatrackerrorcode
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class TimedMetadataTrackErrorCode extends Win32Enum{

    /**
     * No error code.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * The error was related to the format of the timed metadata track data.
     * @type {Integer (Int32)}
     */
    static DataFormatError => 1

    /**
     * A network error occurred.
     * @type {Integer (Int32)}
     */
    static NetworkError => 2

    /**
     * The error occurred internal to the system.
     * @type {Integer (Int32)}
     */
    static InternalError => 3
}
