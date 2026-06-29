#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct CLUSTER_SHARED_VOLUME_RENAME_INPUT_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
