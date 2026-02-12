#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Indicates the Major Class code of the device, which is the general family of device with which the device is associated.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothmajorclass
 * @namespace Windows.Devices.Bluetooth
 * @version WindowsRuntime 1.4
 */
class BluetoothMajorClass extends Win32Enum{

    /**
     * Used when a more specific Major Class code is not suitable.
     * @type {Integer (Int32)}
     */
    static Miscellaneous => 0

    /**
     * A computer. Example devices are desktop, notebook, PDA and organizer.
     * @type {Integer (Int32)}
     */
    static Computer => 1

    /**
     * A phone. Example devices are cellular, cordless, pay phone and modem.
     * @type {Integer (Int32)}
     */
    static Phone => 2

    /**
     * A LAN or network Access Point.
     * @type {Integer (Int32)}
     */
    static NetworkAccessPoint => 3

    /**
     * An audio or video device. Example devices are headset, speaker, stereo, video display and VCR.
     * @type {Integer (Int32)}
     */
    static AudioVideo => 4

    /**
     * A peripheral device. Examples are mouse, joystick and keyboard.
     * @type {Integer (Int32)}
     */
    static Peripheral => 5

    /**
     * An imaging device. Examples are printer, scanner, camera and display.
     * @type {Integer (Int32)}
     */
    static Imaging => 6

    /**
     * A wearable device.
     * @type {Integer (Int32)}
     */
    static Wearable => 7

    /**
     * A toy.
     * @type {Integer (Int32)}
     */
    static Toy => 8

    /**
     * A health device. An example is a heart rate monitor.
     * @type {Integer (Int32)}
     */
    static Health => 9
}
