#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * The possible statuses a DIAL device can have in the DIAL device picker. You can use these to adjust the sub-status and other visual attributes for a particular device in the picker.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.dialprotocol.dialdevicedisplaystatus
 * @namespace Windows.Media.DialProtocol
 * @version WindowsRuntime 1.4
 */
class DialDeviceDisplayStatus extends Win32Enum{

    /**
     * The device is not connected.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * The device is attempting to connect.
     * @type {Integer (Int32)}
     */
    static Connecting => 1

    /**
     * The device is connected.
     * @type {Integer (Int32)}
     */
    static Connected => 2

    /**
     * The device is attempting to disconnect.
     * @type {Integer (Int32)}
     */
    static Disconnecting => 3

    /**
     * The device is disconnected.
     * @type {Integer (Int32)}
     */
    static Disconnected => 4

    /**
     * The device shows an error.
     * @type {Integer (Int32)}
     */
    static Error => 5
}
