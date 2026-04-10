#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
class CLUSTER_SHARED_VOLUME_SNAPSHOT_STATE extends Win32Enum {

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
