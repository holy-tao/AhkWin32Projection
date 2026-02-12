#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Contains the values that describe a remote system's status type. This is a simplification of the [RemoteSystemStatus](remotesystemstatus.md) enumeration and is used to construct a [RemoteSystemStatusTypeFilter](remotesystemstatustypefilter.md) object.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemstatustype
 * @namespace Windows.System.RemoteSystems
 * @version WindowsRuntime 1.4
 */
class RemoteSystemStatusType extends Win32Enum{

    /**
     * The remote system can have any availability status and be discoverable.
     * @type {Integer (Int32)}
     */
    static Any => 0

    /**
     * The remote system must have a [Status](remotesystem_status.md) property value of **Available** in order to be discoverable.
     * @type {Integer (Int32)}
     */
    static Available => 1
}
