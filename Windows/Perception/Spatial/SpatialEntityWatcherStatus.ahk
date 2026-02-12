#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Describes the state of a [SpatialEntityWatcher](spatialentitywatcher.md) object.
 * @remarks
 * > [!IMPORTANT]
 * > The [SpatialEntityStore](spatialentitystore.md) approach of synchronizing spatial anchors between devices is not currently supported.  Consider using [Azure Spatial Anchors](/azure/spatial-anchors) instead.
 * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.spatialentitywatcherstatus
 * @namespace Windows.Perception.Spatial
 * @version WindowsRuntime 1.4
 */
class SpatialEntityWatcherStatus extends Win32Enum{

    /**
     * This is the initial state of a Watcher object. During this state clients can register event handlers.
     * @type {Integer (Int32)}
     */
    static Created => 0

    /**
     * The watcher transitions to the Started state once [Start](spatialentitywatcher_start_1587696324.md) is called. The watcher is enumerating the initial collection. Note that during this enumeration phase it is possible to receive [Updated](spatialentitywatcher_updated.md) and [Removed](spatialentitywatcher_removed.md) notifications but only to items that have already been [Added](spatialentitywatcher_added.md).
     * @type {Integer (Int32)}
     */
    static Started => 1

    /**
     * The watcher has completed enumerating the initial collection. Items can still be added, updated or removed from the collection.
     * @type {Integer (Int32)}
     */
    static EnumerationCompleted => 2

    /**
     * The client has called [Stop](spatialentitywatcher_stop_1201535524.md) and the watcher is still in the process of stopping. Events may still be raised.
     * @type {Integer (Int32)}
     */
    static Stopping => 3

    /**
     * The client has called [Stop](spatialentitywatcher_stop_1201535524.md) and the watcher has completed all outstanding events. No further events will be raised.
     * @type {Integer (Int32)}
     */
    static Stopped => 4

    /**
     * The watcher has aborted operation. No subsequent events will be raised.
     * @type {Integer (Int32)}
     */
    static Aborted => 5
}
