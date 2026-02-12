#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Indicates the type of devices that the user wants to enumerate.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.deviceclass
 * @namespace Windows.Devices.Enumeration
 * @version WindowsRuntime 1.4
 */
class DeviceClass extends Win32Enum{

    /**
     * Indicates that the user wants to enumerate all devices.
     * @type {Integer (Int32)}
     */
    static All => 0

    /**
     * Indicates that the user wants to enumerate all audio capture devices.
     * @type {Integer (Int32)}
     */
    static AudioCapture => 1

    /**
     * Indicates that the user wants to enumerate all audio rendering devices.
     * @type {Integer (Int32)}
     */
    static AudioRender => 2

    /**
     * Indicates that the user wants to enumerate all portable storage devices.
     * @type {Integer (Int32)}
     */
    static PortableStorageDevice => 3

    /**
     * Indicates that the user wants to enumerate all video capture devices.
     * @type {Integer (Int32)}
     */
    static VideoCapture => 4

    /**
     * Indicates that the user wants to enumerate all scanning devices.
     * @type {Integer (Int32)}
     */
    static ImageScanner => 5

    /**
     * Indicates that the user wants to enumerate all location aware devices.
     * @type {Integer (Int32)}
     */
    static Location => 6
}
