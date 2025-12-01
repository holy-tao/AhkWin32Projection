#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the states of a cluster shared volume.
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ne-clusapi-cluster_shared_volume_state
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUSTER_SHARED_VOLUME_STATE extends Win32Enum{

    /**
     * The shared volume is unavailable.
     * @type {Integer (Int32)}
     */
    static SharedVolumeStateUnavailable => 0

    /**
     * The shared volume is paused.
     * @type {Integer (Int32)}
     */
    static SharedVolumeStatePaused => 1

    /**
     * The shared volume is active.
     * @type {Integer (Int32)}
     */
    static SharedVolumeStateActive => 2

    /**
     * 
     * @type {Integer (Int32)}
     */
    static SharedVolumeStateActiveRedirected => 3

    /**
     * 
     * @type {Integer (Int32)}
     */
    static SharedVolumeStateActiveVolumeRedirected => 4
}
