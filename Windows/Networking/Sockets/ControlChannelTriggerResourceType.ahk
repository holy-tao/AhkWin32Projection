#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * The resource type used by a control channel trigger.
 * @remarks
 * A local computer system can be in several power states:
 * 
 * 
 * + System active
 * + Connected standby
 * + Shutdown
 * An app in the system active mode can receive a control channel trigger when either a software or hardware slot is used. An app in the connected standby mode can only receive a control channel trigger when a hardware slot is used.
 * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.controlchanneltriggerresourcetype
 * @namespace Windows.Networking.Sockets
 * @version WindowsRuntime 1.4
 */
class ControlChannelTriggerResourceType extends Win32Enum{

    /**
     * Request a software slot from the system.
     * @type {Integer (Int32)}
     */
    static RequestSoftwareSlot => 0

    /**
     * Request a hardware slot from the system.
     * @type {Integer (Int32)}
     */
    static RequestHardwareSlot => 1
}
