#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct NDIS_FDDI_LCONNECTION_STATE {
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
    static NdisFddiStateOff => 1

    /**
     * @type {Integer (Int32)}
     */
    static NdisFddiStateBreak => 2

    /**
     * @type {Integer (Int32)}
     */
    static NdisFddiStateTrace => 3

    /**
     * @type {Integer (Int32)}
     */
    static NdisFddiStateConnect => 4

    /**
     * @type {Integer (Int32)}
     */
    static NdisFddiStateNext => 5

    /**
     * @type {Integer (Int32)}
     */
    static NdisFddiStateSignal => 6

    /**
     * @type {Integer (Int32)}
     */
    static NdisFddiStateJoin => 7

    /**
     * @type {Integer (Int32)}
     */
    static NdisFddiStateVerify => 8

    /**
     * @type {Integer (Int32)}
     */
    static NdisFddiStateActive => 9

    /**
     * @type {Integer (Int32)}
     */
    static NdisFddiStateMaintenance => 10
}
