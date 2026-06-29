#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 */
export default struct NDIS_FDDI_RING_MGT_STATE {
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
    static NdisFddiRingIsolated => 1

    /**
     * @type {Integer (Int32)}
     */
    static NdisFddiRingNonOperational => 2

    /**
     * @type {Integer (Int32)}
     */
    static NdisFddiRingOperational => 3

    /**
     * @type {Integer (Int32)}
     */
    static NdisFddiRingDetect => 4

    /**
     * @type {Integer (Int32)}
     */
    static NdisFddiRingNonOperationalDup => 5

    /**
     * @type {Integer (Int32)}
     */
    static NdisFddiRingOperationalDup => 6

    /**
     * @type {Integer (Int32)}
     */
    static NdisFddiRingDirected => 7

    /**
     * @type {Integer (Int32)}
     */
    static NdisFddiRingTrace => 8
}
