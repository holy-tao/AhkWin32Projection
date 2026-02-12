#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Describes an error on a Play To connection.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.playto.playtoconnectionerror
 * @namespace Windows.Media.PlayTo
 * @version WindowsRuntime 1.4
 */
class PlayToConnectionError extends Win32Enum{

    /**
     * No error occurred.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * The Play To target device has not responded for at least 5 seconds.
     * @type {Integer (Int32)}
     */
    static DeviceNotResponding => 1

    /**
     * The Play To target device has encountered an error.
     * @type {Integer (Int32)}
     */
    static DeviceError => 2

    /**
     * The Play To target device is locked.
     * @type {Integer (Int32)}
     */
    static DeviceLocked => 3

    /**
     * The Play To target device failed to play the protected content.
     * @type {Integer (Int32)}
     */
    static ProtectedPlaybackFailed => 4
}
