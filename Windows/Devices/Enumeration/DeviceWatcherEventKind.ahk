#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * The type of event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.devicewatchereventkind
 * @namespace Windows.Devices.Enumeration
 * @version WindowsRuntime 1.4
 */
class DeviceWatcherEventKind extends Win32Enum{

    /**
     * The event is an add action.
     * @type {Integer (Int32)}
     */
    static Add => 0

    /**
     * The event is an update action.
     * @type {Integer (Int32)}
     */
    static Update => 1

    /**
     * The event is a remove action.
     * @type {Integer (Int32)}
     */
    static Remove => 2
}
