#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * The result of attempting to launch an app on a remote device.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.dialprotocol.dialapplaunchresult
 * @namespace Windows.Media.DialProtocol
 * @version WindowsRuntime 1.4
 */
class DialAppLaunchResult extends Win32Enum{

    /**
     * The app successfully launched.
     * @type {Integer (Int32)}
     */
    static Launched => 0

    /**
     * The app failed to launch.
     * @type {Integer (Int32)}
     */
    static FailedToLaunch => 1

    /**
     * The app was not found.
     * @type {Integer (Int32)}
     */
    static NotFound => 2

    /**
     * An error occurred while attempting to retrieve the state.
     * @type {Integer (Int32)}
     */
    static NetworkFailure => 3
}
