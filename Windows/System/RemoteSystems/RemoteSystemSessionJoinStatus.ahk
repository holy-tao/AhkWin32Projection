#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Contains values which describe the result of this device's attempt to join a remote session.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemsessionjoinstatus
 * @namespace Windows.System.RemoteSystems
 * @version WindowsRuntime 1.4
 */
class RemoteSystemSessionJoinStatus extends Win32Enum{

    /**
     * The join attempt was successful.
     * @type {Integer (Int32)}
     */
    static Success => 0

    /**
     * The join request failed because this device is already a participant in the maximum allowed number of sessions.
     * @type {Integer (Int32)}
     */
    static SessionLimitsExceeded => 1

    /**
     * The join attempt failed for an unknown reason.
     * @type {Integer (Int32)}
     */
    static OperationAborted => 2

    /**
     * The connection to the remote session was lost.
     * @type {Integer (Int32)}
     */
    static SessionUnavailable => 3

    /**
     * The join request was rejected by the device controlling this session.
     * @type {Integer (Int32)}
     */
    static RejectedByController => 4
}
