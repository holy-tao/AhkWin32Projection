#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
class NDIS_PER_PACKET_INFO extends Win32Enum {

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
     * Native name: NdisReserved
     * @type {Integer (Int32)}
     */
    static Reserved => 4

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
     * Native name: PacketCancelId
     * @type {Integer (Int32)}
     */
    static CancelId => 8

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
