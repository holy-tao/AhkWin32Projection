#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32Enum.ahk

/**
 * Specifies the result of activating an application for a URI on a remote device.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.remotelaunchuristatus
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class RemoteLaunchUriStatus extends Win32Enum{

    /**
     * The URI could not be successfully launched on the remote system.
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * The URI was successfully launched on the remote system.
     * @type {Integer (Int32)}
     */
    static Success => 1

    /**
     * The app is not installed on the remote system.
     * @type {Integer (Int32)}
     */
    static AppUnavailable => 2

    /**
     * The application you are trying to activate on the remote system does not support this URI.
     * @type {Integer (Int32)}
     */
    static ProtocolUnavailable => 3

    /**
     * The remote system could not be reached.
     * @type {Integer (Int32)}
     */
    static RemoteSystemUnavailable => 4

    /**
     * The amount of data you tried to send to the remote system exceeded the limit.
     * @type {Integer (Int32)}
     */
    static ValueSetTooLarge => 5

    /**
     * The user is not authorized to launch an app on the remote system.
     * @type {Integer (Int32)}
     */
    static DeniedByLocalSystem => 6

    /**
     * The user is not signed in on the target device or may be blocked by group policy.
     * @type {Integer (Int32)}
     */
    static DeniedByRemoteSystem => 7
}
