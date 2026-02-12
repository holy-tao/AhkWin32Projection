#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32Enum.ahk

/**
 * Represents the status of a user watcher.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.userwatcherstatus
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class UserWatcherStatus extends Win32Enum{

    /**
     * The watcher has been created.
     * @type {Integer (Int32)}
     */
    static Created => 0

    /**
     * The watcher has started.
     * @type {Integer (Int32)}
     */
    static Started => 1

    /**
     * The watcher's enumeration has completed.
     * @type {Integer (Int32)}
     */
    static EnumerationCompleted => 2

    /**
     * The watcher is stopping.
     * @type {Integer (Int32)}
     */
    static Stopping => 3

    /**
     * The watcher has stopped.
     * @type {Integer (Int32)}
     */
    static Stopped => 4

    /**
     * The watcher was aborted.
     * @type {Integer (Int32)}
     */
    static Aborted => 5
}
