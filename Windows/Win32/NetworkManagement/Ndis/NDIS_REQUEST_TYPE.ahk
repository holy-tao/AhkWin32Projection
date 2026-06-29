#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 */
export default struct NDIS_REQUEST_TYPE {
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
    static NdisRequestQueryInformation => 0

    /**
     * @type {Integer (Int32)}
     */
    static NdisRequestSetInformation => 1

    /**
     * @type {Integer (Int32)}
     */
    static NdisRequestQueryStatistics => 2

    /**
     * @type {Integer (Int32)}
     */
    static NdisRequestOpen => 3

    /**
     * @type {Integer (Int32)}
     */
    static NdisRequestClose => 4

    /**
     * @type {Integer (Int32)}
     */
    static NdisRequestSend => 5

    /**
     * @type {Integer (Int32)}
     */
    static NdisRequestTransferData => 6

    /**
     * @type {Integer (Int32)}
     */
    static NdisRequestReset => 7

    /**
     * @type {Integer (Int32)}
     */
    static NdisRequestGeneric1 => 8

    /**
     * @type {Integer (Int32)}
     */
    static NdisRequestGeneric2 => 9

    /**
     * @type {Integer (Int32)}
     */
    static NdisRequestGeneric3 => 10

    /**
     * @type {Integer (Int32)}
     */
    static NdisRequestGeneric4 => 11
}
