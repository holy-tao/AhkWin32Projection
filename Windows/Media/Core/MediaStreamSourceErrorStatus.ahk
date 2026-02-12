#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies errors related to [MediaStreamSource](mediastreamsource.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.core.mediastreamsourceerrorstatus
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class MediaStreamSourceErrorStatus extends Win32Enum{

    /**
     * An unspecified error has occurred in the application.
     * @type {Integer (Int32)}
     */
    static Other => 0

    /**
     * The application ran out of memory.
     * @type {Integer (Int32)}
     */
    static OutOfMemory => 1

    /**
     * The application failed to open a file
     * @type {Integer (Int32)}
     */
    static FailedToOpenFile => 2

    /**
     * The application failed to connect to a streaming media server or web server.
     * @type {Integer (Int32)}
     */
    static FailedToConnectToServer => 3

    /**
     * The network connection to the server was lost.
     * @type {Integer (Int32)}
     */
    static ConnectionToServerLost => 4

    /**
     * An unspecified network related error has occurred.
     * @type {Integer (Int32)}
     */
    static UnspecifiedNetworkError => 5

    /**
     * The application encountered an error while attempting to decode the media data.
     * @type {Integer (Int32)}
     */
    static DecodeError => 6

    /**
     * The application does not support the media storage format or media encoding format.
     * @type {Integer (Int32)}
     */
    static UnsupportedMediaFormat => 7
}
