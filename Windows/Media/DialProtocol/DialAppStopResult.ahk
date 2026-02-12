#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * The result of attempting to stop an app from running on a remote device.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.dialprotocol.dialappstopresult
 * @namespace Windows.Media.DialProtocol
 * @version WindowsRuntime 1.4
 */
class DialAppStopResult extends Win32Enum{

    /**
     * The app is successfully stopped.
     * @type {Integer (Int32)}
     */
    static Stopped => 0

    /**
     * The app failed to stop.
     * @type {Integer (Int32)}
     */
    static StopFailed => 1

    /**
     * The app cannot be stopped because the operation isn't supported.
     * @type {Integer (Int32)}
     */
    static OperationNotSupported => 2

    /**
     * An error occurred while attempting to retrieve the state.
     * @type {Integer (Int32)}
     */
    static NetworkFailure => 3
}
