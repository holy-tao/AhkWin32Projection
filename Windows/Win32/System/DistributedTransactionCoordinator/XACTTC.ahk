#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 */
export default struct XACTTC {
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
    static XACTTC_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static XACTTC_SYNC_PHASEONE => 1

    /**
     * @type {Integer (Int32)}
     */
    static XACTTC_SYNC_PHASETWO => 2

    /**
     * @type {Integer (Int32)}
     */
    static XACTTC_SYNC => 2

    /**
     * @type {Integer (Int32)}
     */
    static XACTTC_ASYNC_PHASEONE => 4

    /**
     * @type {Integer (Int32)}
     */
    static XACTTC_ASYNC => 4
}
