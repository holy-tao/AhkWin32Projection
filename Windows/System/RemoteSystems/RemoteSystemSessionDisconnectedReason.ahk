#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Contains values that describe the reason that a device may be disconnected from a remote session.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemsessiondisconnectedreason
 * @namespace Windows.System.RemoteSystems
 * @version WindowsRuntime 1.4
 */
class RemoteSystemSessionDisconnectedReason extends Win32Enum{

    /**
     * The connection to the remote session was lost.
     * @type {Integer (Int32)}
     */
    static SessionUnavailable => 0

    /**
     * The device controlling the remote session removed this device as a participant.
     * @type {Integer (Int32)}
     */
    static RemovedByController => 1

    /**
     * The device controlling the remote session ended the session.
     * @type {Integer (Int32)}
     */
    static SessionClosed => 2
}
