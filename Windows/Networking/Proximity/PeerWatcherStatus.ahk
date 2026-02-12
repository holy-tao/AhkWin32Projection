#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Describes the status of a [PeerWatcher](peerwatcher.md) object.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.proximity.peerwatcherstatus
 * @namespace Windows.Networking.Proximity
 * @version WindowsRuntime 1.4
 */
class PeerWatcherStatus extends Win32Enum{

    /**
     * The peer watcher has been created and can start watching for peer apps within wireless range.
     * @type {Integer (Int32)}
     */
    static Created => 0

    /**
     * The peer watcher has started watching for peer apps within wireless range.
     * @type {Integer (Int32)}
     */
    static Started => 1

    /**
     * A scan operation is complete and all peer apps within wireless range have been found.
     * @type {Integer (Int32)}
     */
    static EnumerationCompleted => 2

    /**
     * The peer watcher is stopping.
     * @type {Integer (Int32)}
     */
    static Stopping => 3

    /**
     * The peer watcher has stopped watching for peer apps within wireless range.
     * @type {Integer (Int32)}
     */
    static Stopped => 4

    /**
     * Watching for peers has stopped due to a failure.
     * @type {Integer (Int32)}
     */
    static Aborted => 5
}
