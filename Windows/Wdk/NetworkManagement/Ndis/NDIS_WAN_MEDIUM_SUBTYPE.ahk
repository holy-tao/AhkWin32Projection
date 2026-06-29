#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct NDIS_WAN_MEDIUM_SUBTYPE {
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
    static NdisWanMediumHub => 0

    /**
     * @type {Integer (Int32)}
     */
    static NdisWanMediumX_25 => 1

    /**
     * @type {Integer (Int32)}
     */
    static NdisWanMediumIsdn => 2

    /**
     * @type {Integer (Int32)}
     */
    static NdisWanMediumSerial => 3

    /**
     * @type {Integer (Int32)}
     */
    static NdisWanMediumFrameRelay => 4

    /**
     * @type {Integer (Int32)}
     */
    static NdisWanMediumAtm => 5

    /**
     * @type {Integer (Int32)}
     */
    static NdisWanMediumSonet => 6

    /**
     * @type {Integer (Int32)}
     */
    static NdisWanMediumSW56K => 7

    /**
     * @type {Integer (Int32)}
     */
    static NdisWanMediumPPTP => 8

    /**
     * @type {Integer (Int32)}
     */
    static NdisWanMediumL2TP => 9

    /**
     * @type {Integer (Int32)}
     */
    static NdisWanMediumIrda => 10

    /**
     * @type {Integer (Int32)}
     */
    static NdisWanMediumParallel => 11

    /**
     * @type {Integer (Int32)}
     */
    static NdisWanMediumPppoe => 12

    /**
     * @type {Integer (Int32)}
     */
    static NdisWanMediumSSTP => 13

    /**
     * @type {Integer (Int32)}
     */
    static NdisWanMediumAgileVPN => 14

    /**
     * @type {Integer (Int32)}
     */
    static NdisWanMediumGre => 15

    /**
     * @type {Integer (Int32)}
     */
    static NdisWanMediumSubTypeMax => 16
}
