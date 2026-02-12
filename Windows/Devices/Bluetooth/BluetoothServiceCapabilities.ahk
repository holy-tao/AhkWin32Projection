#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Indicates the service capabilities of a device.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothservicecapabilities
 * @namespace Windows.Devices.Bluetooth
 * @version WindowsRuntime 1.4
 */
class BluetoothServiceCapabilities extends Win32BitflagEnum{

    /**
     * None.
     * @type {Integer (UInt32)}
     */
    static None => 0

    /**
     * Limited Discoverable Mode.
     * @type {Integer (UInt32)}
     */
    static LimitedDiscoverableMode => 1

    /**
     * Positioning or location identification.
     * @type {Integer (UInt32)}
     */
    static PositioningService => 8

    /**
     * Networking, for example, LAN, Ad hoc.
     * @type {Integer (UInt32)}
     */
    static NetworkingService => 16

    /**
     * Rendering, for example, printer, speakers.
     * @type {Integer (UInt32)}
     */
    static RenderingService => 32

    /**
     * Capturing, for example, scanner, microphone.
     * @type {Integer (UInt32)}
     */
    static CapturingService => 64

    /**
     * Object Transfer, for example, v-Inbox, v-folder.
     * @type {Integer (UInt32)}
     */
    static ObjectTransferService => 128

    /**
     * Audio, for example, speaker, microphone, headset service.
     * @type {Integer (UInt32)}
     */
    static AudioService => 256

    /**
     * Telephony, for example cordless, modem, headset service.
     * @type {Integer (UInt32)}
     */
    static TelephoneService => 512

    /**
     * Information, for example, web server, WAP server.
     * @type {Integer (UInt32)}
     */
    static InformationService => 1024
}
