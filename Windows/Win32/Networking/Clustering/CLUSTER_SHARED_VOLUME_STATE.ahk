#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the states of a cluster shared volume.
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ne-clusapi-cluster_shared_volume_state
 * @namespace Windows.Win32.Networking.Clustering
 */
class CLUSTER_SHARED_VOLUME_STATE extends Win32Enum {

    /**
     * The shared volume is unavailable.
     * Native name: SharedVolumeStateUnavailable
     * @type {Integer (Int32)}
     */
    static Unavailable => 0

    /**
     * The shared volume is paused.
     * Native name: SharedVolumeStatePaused
     * @type {Integer (Int32)}
     */
    static Paused => 1

    /**
     * The shared volume is active.
     * Native name: SharedVolumeStateActive
     * @type {Integer (Int32)}
     */
    static Active => 2

    /**
     * Native name: SharedVolumeStateActiveRedirected
     * @type {Integer (Int32)}
     */
    static ActiveRedirected => 3

    /**
     * Native name: SharedVolumeStateActiveVolumeRedirected
     * @type {Integer (Int32)}
     */
    static ActiveVolumeRedirected => 4
}
