#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify the result of a [DisplayState](displaystate.md) operation.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaystateoperationstatus
 * @namespace Windows.Devices.Display.Core
 * @version WindowsRuntime 1.4
 */
class DisplayStateOperationStatus extends Win32Enum{

    /**
     * Indicates that the operation succeeded.
     * @type {Integer (Int32)}
     */
    static Success => 0

    /**
     * Indicates that the operation failed, but some system state was modified.
     * @type {Integer (Int32)}
     */
    static PartialFailure => 1

    /**
     * Indicates that the operation failed for an unknown reason.
     * @type {Integer (Int32)}
     */
    static UnknownFailure => 2

    /**
     * Indicates that the operation failed because target ownership has been lost.
     * @type {Integer (Int32)}
     */
    static TargetOwnershipLost => 3

    /**
     * Indicates that the operation failed because the system display state has changed since the relevant [DisplayState](displaystate.md) object was created.
     * @type {Integer (Int32)}
     */
    static SystemStateChanged => 4

    /**
     * Indicates that an involved adapter cannot support the number of paths requested.
     * @type {Integer (Int32)}
     */
    static TooManyPathsForAdapter => 5

    /**
     * Indicates that the operation failed because one or more modes specified by a [DisplayPath](displaypath.md) are not supported in the present configuration.
     * @type {Integer (Int32)}
     */
    static ModesNotSupported => 6

    /**
     * Indicates that the operation failed because the current session is currently in an unsupported remote desktop session that does not allow access to the display stack.
     * @type {Integer (Int32)}
     */
    static RemoteSessionNotSupported => 7
}
