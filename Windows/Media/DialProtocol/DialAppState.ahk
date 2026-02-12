#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * The state of the application on the remote device.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.dialprotocol.dialappstate
 * @namespace Windows.Media.DialProtocol
 * @version WindowsRuntime 1.4
 */
class DialAppState extends Win32Enum{

    /**
     * The state cannot be determined.
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * The app is stopped on the remote device.
     * @type {Integer (Int32)}
     */
    static Stopped => 1

    /**
     * The app is running on the remote device.
     * @type {Integer (Int32)}
     */
    static Running => 2

    /**
     * An error occurred while attempting to retrieve the state.
     * @type {Integer (Int32)}
     */
    static NetworkFailure => 3
}
