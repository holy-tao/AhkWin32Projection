#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The CLUSTER_NOTIFICATIONS_VERSION enumeration (msclus.h) defines the various versions of cluster notification enumerations.
 * @see https://learn.microsoft.com/windows/win32/api/msclus/ne-msclus-cluster_notifications_version
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct CLUSTER_NOTIFICATIONS_VERSION {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Version 1 of the cluster notification enumeration.
     * @type {Integer (Int32)}
     */
    static CLUSTER_NOTIFICATIONS_V1 => 1

    /**
     * Version 2 of the cluster notification enumeration.
     * @type {Integer (Int32)}
     */
    static CLUSTER_NOTIFICATIONS_V2 => 2
}
