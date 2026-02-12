#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * The current status of the [PhoneLineWatcher](phonelinewatcher.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonelinewatcherstatus
 * @namespace Windows.ApplicationModel.Calls
 * @version WindowsRuntime 1.4
 */
class PhoneLineWatcherStatus extends Win32Enum{

    /**
     * The phone line watcher class is created.
     * @type {Integer (Int32)}
     */
    static Created => 0

    /**
     * The phone line watcher class is started.
     * @type {Integer (Int32)}
     */
    static Started => 1

    /**
     * The phone line watcher class just completed an enumeration of the phone lines on the device.
     * @type {Integer (Int32)}
     */
    static EnumerationCompleted => 2

    /**
     * The phone line watcher class is stopped.
     * @type {Integer (Int32)}
     */
    static Stopped => 3
}
