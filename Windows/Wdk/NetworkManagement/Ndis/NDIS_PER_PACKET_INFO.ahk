#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 * @version v4.0.30319
 */
class NDIS_PER_PACKET_INFO extends Win32Enum{

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
