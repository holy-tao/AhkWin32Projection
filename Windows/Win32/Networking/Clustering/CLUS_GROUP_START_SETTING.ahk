#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * CLUS_GROUP_START_SETTING (msclus.h) enumerates the start settings for a cluster group.
 * @see https://learn.microsoft.com/windows/win32/api/msclus/ne-msclus-clus_group_start_setting
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct CLUS_GROUP_START_SETTING {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Always start the cluster.
     * @type {Integer (Int32)}
     */
    static CLUS_GROUP_START_ALWAYS => 0

    /**
     * Do not start the cluster.
     * @type {Integer (Int32)}
     */
    static CLUS_GROUP_DO_NOT_START => 1

    /**
     * The cluster can be started.
     * @type {Integer (Int32)}
     */
    static CLUS_GROUP_START_ALLOWED => 2
}
