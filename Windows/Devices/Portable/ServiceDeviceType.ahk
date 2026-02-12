#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Indicates the type of a portable device service.
 * @remarks
 * To access the device services, you must declare the device service in the capabilities section of the app manifest file. For a list of the GUIDs representing the device services, see [Windows.Devices.Portable](windows_devices_portable.md).
 * @see https://learn.microsoft.com/uwp/api/windows.devices.portable.servicedevicetype
 * @namespace Windows.Devices.Portable
 * @version WindowsRuntime 1.4
 */
class ServiceDeviceType extends Win32Enum{

    /**
     * A service that provides calendar information.
     * @type {Integer (Int32)}
     */
    static CalendarService => 0

    /**
     * A service that tracks contacts.
     * @type {Integer (Int32)}
     */
    static ContactsService => 1

    /**
     * A device status service.
     * @type {Integer (Int32)}
     */
    static DeviceStatusService => 2

    /**
     * A note-taking service.
     * @type {Integer (Int32)}
     */
    static NotesService => 3

    /**
     * A service that provides ringtones for a phone.
     * @type {Integer (Int32)}
     */
    static RingtonesService => 4

    /**
     * An short message service (SMS) messaging service.
     * @type {Integer (Int32)}
     */
    static SmsService => 5

    /**
     * A service for tracking tasks.
     * @type {Integer (Int32)}
     */
    static TasksService => 6
}
