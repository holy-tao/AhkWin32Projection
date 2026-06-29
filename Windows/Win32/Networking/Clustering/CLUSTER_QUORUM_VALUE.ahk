#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * CLUSTER_QUORUM_VALUE (msclus.h) enumerates values returned by the ClusterControl function with two specific control codes.
 * @see https://learn.microsoft.com/windows/win32/api/msclus/ne-msclus-cluster_quorum_value
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct CLUSTER_QUORUM_VALUE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The quorum will be maintained.
     * @type {Integer (Int32)}
     */
    static CLUSTER_QUORUM_MAINTAINED => 0

    /**
     * The quorum will be lost.
     * @type {Integer (Int32)}
     */
    static CLUSTER_QUORUM_LOST => 1
}
