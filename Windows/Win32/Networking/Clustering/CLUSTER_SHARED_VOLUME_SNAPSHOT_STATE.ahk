#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
class CLUSTER_SHARED_VOLUME_SNAPSHOT_STATE extends Win32Enum {

    /**
     * Native name: ClusterSharedVolumeSnapshotStateUnknown
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * Native name: ClusterSharedVolumePrepareForHWSnapshot
     * @type {Integer (Int32)}
     */
    static PrepareForHWSnapshot => 1

    /**
     * Native name: ClusterSharedVolumeHWSnapshotCompleted
     * @type {Integer (Int32)}
     */
    static VolumeHWSnapshotCompleted => 2

    /**
     * Native name: ClusterSharedVolumePrepareForFreeze
     * @type {Integer (Int32)}
     */
    static PrepareForFreeze => 3
}
