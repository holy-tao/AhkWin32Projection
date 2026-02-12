#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32Enum.ahk

/**
 * Describes the various states that the [AppResourceGroupInfoWatcher](appresourcegroupinfowatcher.md) may be in.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.appresourcegroupinfowatcherstatus
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class AppResourceGroupInfoWatcherStatus extends Win32Enum{

    /**
     * The watcher has been created.
     * @type {Integer (Int32)}
     */
    static Created => 0

    /**
     * The watcher has started monitoring changes.
     * @type {Integer (Int32)}
     */
    static Started => 1

    /**
     * The watcher has completed enumerating the resource groups that are available to monitor. After enumeration is complete, the watcher will report when items are added or removed.
     * @type {Integer (Int32)}
     */
    static EnumerationCompleted => 2

    /**
     * The watcher is in the process of stopping monitoring changes.
     * @type {Integer (Int32)}
     */
    static Stopping => 3

    /**
     * The watcher has stopped monitoring changes.
     * @type {Integer (Int32)}
     */
    static Stopped => 4

    /**
     * The watcher has been stopped by the system as the result of an internal error or other failure condition.
     * @type {Integer (Int32)}
     */
    static Aborted => 5
}
