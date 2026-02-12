#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Describes the status of an attempt to create a remote session.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemsessioncreationstatus
 * @namespace Windows.System.RemoteSystems
 * @version WindowsRuntime 1.4
 */
class RemoteSystemSessionCreationStatus extends Win32Enum{

    /**
     * The remote session was created successfully.
     * @type {Integer (Int32)}
     */
    static Success => 0

    /**
     * The remote session was not created because this device is already a participant in the maximum allowed number of sessions.
     * @type {Integer (Int32)}
     */
    static SessionLimitsExceeded => 1

    /**
     * The creation attempt failed for an unknown reason.
     * @type {Integer (Int32)}
     */
    static OperationAborted => 2
}
