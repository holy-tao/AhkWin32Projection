#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the various snapshot states for a shared volume.
 * @see https://docs.microsoft.com/windows/win32/api//msclus/ne-msclus-cluster_shared_volume_snapshot_state
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUSTER_SHARED_VOLUME_SNAPSHOT_STATE extends Win32Enum{

    /**
     * Indicates that the snapshot state is unknow.
     * @type {Integer (Int32)}
     */
    static ClusterSharedVolumeSnapshotStateUnknown => 0

    /**
     * Indicates that the snapshot is being created.
     * @type {Integer (Int32)}
     */
    static ClusterSharedVolumePrepareForHWSnapshot => 1

    /**
     * Indicates that the snapshot is completed.
     * @type {Integer (Int32)}
     */
    static ClusterSharedVolumeHWSnapshotCompleted => 2

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static ClusterSharedVolumePrepareForFreeze => 3
}
