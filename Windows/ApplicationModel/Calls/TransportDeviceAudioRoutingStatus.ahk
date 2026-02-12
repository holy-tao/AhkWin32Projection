#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify the audio routing status of an underlying transport device.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.transportdeviceaudioroutingstatus
 * @namespace Windows.ApplicationModel.Calls
 * @version WindowsRuntime 1.4
 */
class TransportDeviceAudioRoutingStatus extends Win32Enum{

    /**
     * Specifies that the audio routing status is unknown. You can use the remote device (Phone) instead for the outgoing call being placed.
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * Specifies that the audio *can* be routed to the local device.
     * @type {Integer (Int32)}
     */
    static CanRouteToLocalDevice => 1

    /**
     * Specifies that the audio *can't* be routed to the local device. You can use the remote device (Phone) instead for the outgoing call being placed.
     * @type {Integer (Int32)}
     */
    static CannotRouteToLocalDevice => 2
}
