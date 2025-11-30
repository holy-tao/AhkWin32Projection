#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUSTER_SHARED_VOLUME_RENAME_INPUT_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static ClusterSharedVolumeRenameInputTypeNone => 0

    /**
     * @type {Integer (Int32)}
     */
    static ClusterSharedVolumeRenameInputTypeVolumeOffset => 1

    /**
     * @type {Integer (Int32)}
     */
    static ClusterSharedVolumeRenameInputTypeVolumeId => 2

    /**
     * @type {Integer (Int32)}
     */
    static ClusterSharedVolumeRenameInputTypeVolumeName => 3

    /**
     * @type {Integer (Int32)}
     */
    static ClusterSharedVolumeRenameInputTypeVolumeGuid => 4
}
