#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUSTER_SHARED_VOLUME_SNAPSHOT_STATE{

    /**
     * @type {Integer (Int32)}
     */
    static ClusterSharedVolumeSnapshotStateUnknown => 0

    /**
     * @type {Integer (Int32)}
     */
    static ClusterSharedVolumePrepareForHWSnapshot => 1

    /**
     * @type {Integer (Int32)}
     */
    static ClusterSharedVolumeHWSnapshotCompleted => 2

    /**
     * @type {Integer (Int32)}
     */
    static ClusterSharedVolumePrepareForFreeze => 3
}
