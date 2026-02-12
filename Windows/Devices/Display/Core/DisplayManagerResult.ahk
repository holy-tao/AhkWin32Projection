#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify the result of a [DisplayManager](displaymanager.md) operation.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaymanagerresult
 * @namespace Windows.Devices.Display.Core
 * @version WindowsRuntime 1.4
 */
class DisplayManagerResult extends Win32Enum{

    /**
     * Indicates that the operation succeeded.
     * @type {Integer (Int32)}
     */
    static Success => 0

    /**
     * Indicates that the operation failed for an unknown reason.
     * @type {Integer (Int32)}
     */
    static UnknownFailure => 1

    /**
     * Indicates that the operation failed becaused a specified target could not be acquired, either due to another component currently owning it, or due to target ownership restrictions.
     * @type {Integer (Int32)}
     */
    static TargetAccessDenied => 2

    /**
     * Indicates that the operation failed because a specified target is stale and should be re-enumerated.
     * @type {Integer (Int32)}
     */
    static TargetStale => 3

    /**
     * Indicates that the operation failed because the current session is currently in an unsupported remote desktop session that does not allow access to the display stack.
     * @type {Integer (Int32)}
     */
    static RemoteSessionNotSupported => 4
}
