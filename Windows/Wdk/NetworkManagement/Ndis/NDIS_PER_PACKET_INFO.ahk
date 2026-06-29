#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct NDIS_PER_PACKET_INFO {
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
    static TcpIpChecksumPacketInfo => 0

    /**
     * @type {Integer (Int32)}
     */
    static IpSecPacketInfo => 1

    /**
     * @type {Integer (Int32)}
     */
    static TcpLargeSendPacketInfo => 2

    /**
     * @type {Integer (Int32)}
     */
    static ClassificationHandlePacketInfo => 3

    /**
     * @type {Integer (Int32)}
     */
    static NdisReserved => 4

    /**
     * @type {Integer (Int32)}
     */
    static ScatterGatherListPacketInfo => 5

    /**
     * @type {Integer (Int32)}
     */
    static Ieee8021QInfo => 6

    /**
     * @type {Integer (Int32)}
     */
    static OriginalPacketInfo => 7

    /**
     * @type {Integer (Int32)}
     */
    static PacketCancelId => 8

    /**
     * @type {Integer (Int32)}
     */
    static OriginalNetBufferList => 9

    /**
     * @type {Integer (Int32)}
     */
    static CachedNetBufferList => 10

    /**
     * @type {Integer (Int32)}
     */
    static ShortPacketPaddingInfo => 11

    /**
     * @type {Integer (Int32)}
     */
    static MaxPerPacketInfo => 12
}
