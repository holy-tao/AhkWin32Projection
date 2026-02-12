#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Contains the values that describe a remote system's availability status.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemstatus
 * @namespace Windows.System.RemoteSystems
 * @version WindowsRuntime 1.4
 */
class RemoteSystemStatus extends Win32Enum{

    /**
     * The remote system is unavailable.
     * @type {Integer (Int32)}
     */
    static Unavailable => 0

    /**
     * The availability of the remote system is currently being discovered.
     * @type {Integer (Int32)}
     */
    static DiscoveringAvailability => 1

    /**
     * The remote system is available.
     * @type {Integer (Int32)}
     */
    static Available => 2

    /**
     * The availability of the remote system is unknown.
     * @type {Integer (Int32)}
     */
    static Unknown => 3
}
