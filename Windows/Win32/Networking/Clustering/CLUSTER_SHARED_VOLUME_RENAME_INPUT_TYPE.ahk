#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
class CLUSTER_SHARED_VOLUME_RENAME_INPUT_TYPE extends Win32Enum {

    /**
     * Native name: ClusterSharedVolumeRenameInputTypeNone
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Native name: ClusterSharedVolumeRenameInputTypeVolumeOffset
     * @type {Integer (Int32)}
     */
    static VolumeOffset => 1

    /**
     * Native name: ClusterSharedVolumeRenameInputTypeVolumeId
     * @type {Integer (Int32)}
     */
    static VolumeId => 2

    /**
     * Native name: ClusterSharedVolumeRenameInputTypeVolumeName
     * @type {Integer (Int32)}
     */
    static VolumeName => 3

    /**
     * Native name: ClusterSharedVolumeRenameInputTypeVolumeGuid
     * @type {Integer (Int32)}
     */
    static VolumeGuid => 4
}
