#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The NDIS_INTERFACE_INFORMATION structure provides information about a network interface for the OID_GEN_INTERFACE_INFO OID.
 * @remarks
 * NDIS interface providers populate an NDIS_INTERFACE_INFORMATION structure in response to a query of
  *     the 
  *     <a href="https://docs.microsoft.com/windows-hardware/drivers/network/oid-gen-interface-info">OID_GEN_INTERFACE_INFO</a> OID. This
  *     structure contains information that changes during the lifetime of the interface.
  * 
  * To register as an interface provider, an NDIS driver calls the 
  *     <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/ndis/nf-ndis-ndisifregisterprovider">NdisIfRegisterProvider</a> function.
 * @see https://learn.microsoft.com/windows/win32/api/ifdef/ns-ifdef-ndis_interface_information
 * @namespace Windows.Win32.NetworkManagement.Ndis
 * @version v4.0.30319
 */
class NDIS_INTERFACE_INFORMATION extends Win32Struct
{
    static sizeof => 216

    static packingSize => 8

    /**
     * The operational status of the interface. This status is the same as the value that the 
     *      <a href="https://docs.microsoft.com/windows-hardware/drivers/network/oid-gen-operational-status">OID_GEN_OPERATIONAL_STATUS</a> OID
     *      returns.
     * @type {Integer}
     */
    ifOperStatus {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The operational status flags of the interface. This field is reserved for the NDIS proxy interface
     *      provider. Other interface providers should set this member to zero.
     * @type {Integer}
     */
    ifOperStatusFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The 
     *      <a href="https://docs.microsoft.com/windows/desktop/api/ifdef/ne-ifdef-net_if_media_connect_state">NET_IF_MEDIA_CONNECT_STATE</a> connection state type.
     * @type {Integer}
     */
    MediaConnectState {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * The media duplex state of the interface. This state is the same as the value that the 
     *      <a href="https://docs.microsoft.com/windows-hardware/drivers/network/oid-gen-media-duplex-state">OID_GEN_MEDIA_DUPLEX_STATE</a> OID
     *      returns.
     * @type {Integer}
     */
    MediaDuplexState {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * The maximum transmission unit (MTU) of the interface. This MTU is the same as the value that the 
     *      <a href="https://docs.microsoft.com/windows-hardware/drivers/network/oid-gen-maximum-frame-size">OID_GEN_MAXIMUM_FRAME_SIZE</a> OID
     *      returns.
     * @type {Integer}
     */
    ifMtu {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * A Boolean value that is <b>TRUE</b> if the interface is in promiscuous mode or <b>FALSE</b> if it is not. This
     *      value is the same as the value that 
     *      <a href="https://docs.microsoft.com/windows-hardware/drivers/network/oid-gen-promiscuous-mode">OID_GEN_PROMISCUOUS_MODE</a> OID query
     *      returns.
     * @type {Integer}
     */
    ifPromiscuousMode {
        get => NumGet(this, 20, "char")
        set => NumPut("char", value, this, 20)
    }

    /**
     * A Boolean value that is <b>TRUE</b> if the interface supports wake-on-LAN capability and the capability is enabled, or <b>FALSE</b> if it does
     *      not.
     * @type {Integer}
     */
    ifDeviceWakeUpEnable {
        get => NumGet(this, 21, "char")
        set => NumPut("char", value, this, 21)
    }

    /**
     * The transmit link speed, in bytes per second, of the interface. This speed is the same as the
     *      value that an 
     *      <a href="https://docs.microsoft.com/windows-hardware/drivers/network/oid-gen-xmit-link-speed">OID_GEN_XMIT_LINK_SPEED</a> OID query
     *      returns.
     * @type {Integer}
     */
    XmitLinkSpeed {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * The receive link speed, in bytes per second, of the interface. This speed is the same as the value
     *      that an 
     *      <a href="https://docs.microsoft.com/windows-hardware/drivers/network/oid-gen-rcv-link-speed">OID_GEN_RCV_LINK_SPEED</a> OID query
     *      returns.
     * @type {Integer}
     */
    RcvLinkSpeed {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * The time that the interface entered its current operational state. This time is the same as the
     *      value that an 
     *      <a href="https://docs.microsoft.com/windows-hardware/drivers/network/oid-gen-last-change">OID_GEN_LAST_CHANGE</a> OID query
     *      returns.
     * @type {Integer}
     */
    ifLastChange {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * The time of the last discontinuity of the interface's counters. This time is the same as the value
     *      that an 
     *      <a href="https://docs.microsoft.com/windows-hardware/drivers/network/oid-gen-discontinuity-time">OID_GEN_DISCONTINUITY_TIME</a> OID
     *      query returns.
     * @type {Integer}
     */
    ifCounterDiscontinuityTime {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * The number of packets that were received through the interface and that were discarded because of
     *      an unknown or unsupported protocol. This number is the same as the value that an 
     *      <a href="https://docs.microsoft.com/windows-hardware/drivers/network/oid-gen-unknown-protos">OID_GEN_UNKNOWN_PROTOS</a> OID query
     *      returns.
     * @type {Integer}
     */
    ifInUnknownProtos {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * The number of inbound packets that were discarded even though no errors had been detected to
     *      prevent them from being deliverable to a higher-layer protocol. This number is the same as the value
     *      that an 
     *      <a href="https://docs.microsoft.com/windows-hardware/drivers/network/oid-gen-rcv-discards">OID_GEN_RCV_DISCARDS</a> OID query
     *      returns.
     * @type {Integer}
     */
    ifInDiscards {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * The number of inbound packets that contained errors that prevented them from being deliverable to
     *      a higher layer protocol. This number is the same as the value that an 
     *      <a href="https://docs.microsoft.com/windows-hardware/drivers/network/oid-gen-rcv-error">OID_GEN_RCV_ERROR</a> OID query returns.
     * @type {Integer}
     */
    ifInErrors {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * The total number of bytes that are received on this interface. This number is the same as the
     *      value that an 
     *      <a href="https://docs.microsoft.com/windows-hardware/drivers/network/oid-gen-bytes-rcv">OID_GEN_BYTES_RCV</a> OID returns.
     * @type {Integer}
     */
    ifHCInOctets {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * The number of directed packets that are received without errors on the interface. This number is
     *      the same as the value that an 
     *      <a href="https://docs.microsoft.com/windows-hardware/drivers/network/oid-gen-directed-frames-rcv">OID_GEN_DIRECTED_FRAMES_RCV</a> OID
     *      query returns.
     * @type {Integer}
     */
    ifHCInUcastPkts {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * The number of multicast/functional packets that are received without errors on the interface. This
     *      number is the same as the value that an 
     *      <a href="https://docs.microsoft.com/windows-hardware/drivers/network/oid-gen-multicast-frames-rcv">OID_GEN_MULTICAST_FRAMES_RCV</a> OID
     *      query returns.
     * @type {Integer}
     */
    ifHCInMulticastPkts {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * The number of broadcast packets that are received without errors on the interface. This number is
     *      the same as the value that an 
     *      <a href="https://docs.microsoft.com/windows-hardware/drivers/network/oid-gen-broadcast-frames-rcv">OID_GEN_BROADCAST_FRAMES_RCV</a> OID
     *      query returns.
     * @type {Integer}
     */
    ifHCInBroadcastPkts {
        get => NumGet(this, 104, "uint")
        set => NumPut("uint", value, this, 104)
    }

    /**
     * The number of bytes that are transmitted without errors on the interface. This number is the same
     *      as the value that an 
     *      <a href="https://docs.microsoft.com/windows-hardware/drivers/network/oid-gen-bytes-xmit">OID_GEN_BYTES_XMIT</a> OID query
     *      returns.
     * @type {Integer}
     */
    ifHCOutOctets {
        get => NumGet(this, 112, "uint")
        set => NumPut("uint", value, this, 112)
    }

    /**
     * The number of directed packets that are transmitted without errors on the interface. This number
     *      is the same as the value that an 
     *      <a href="https://docs.microsoft.com/windows-hardware/drivers/network/oid-gen-directed-frames-xmit">OID_GEN_DIRECTED_FRAMES_XMIT</a> OID
     *      query returns.
     * @type {Integer}
     */
    ifHCOutUcastPkts {
        get => NumGet(this, 120, "uint")
        set => NumPut("uint", value, this, 120)
    }

    /**
     * The number of multicast/functional packets that are transmitted without errors on the interface.
     *      This number is the same as the value that an 
     *      <a href="https://docs.microsoft.com/windows-hardware/drivers/network/oid-gen-multicast-frames-xmit">OID_GEN_MULTICAST_FRAMES_XMIT</a> OID query returns.
     * @type {Integer}
     */
    ifHCOutMulticastPkts {
        get => NumGet(this, 128, "uint")
        set => NumPut("uint", value, this, 128)
    }

    /**
     * The number of broadcast packets that are transmitted without errors on the interface. This number
     *      is the same as the value that an 
     *      <a href="https://docs.microsoft.com/windows-hardware/drivers/network/oid-gen-broadcast-frames-xmit">OID_GEN_BROADCAST_FRAMES_XMIT</a> OID query returns.
     * @type {Integer}
     */
    ifHCOutBroadcastPkts {
        get => NumGet(this, 136, "uint")
        set => NumPut("uint", value, this, 136)
    }

    /**
     * The number of packets that the interface fails to transmit. This number is the same as the value
     *      that an 
     *      <a href="https://docs.microsoft.com/windows-hardware/drivers/network/oid-gen-xmit-error">OID_GEN_XMIT_ERROR</a> OID query
     *      returns.
     * @type {Integer}
     */
    ifOutErrors {
        get => NumGet(this, 144, "uint")
        set => NumPut("uint", value, this, 144)
    }

    /**
     * The number of packets that the interface discards. This number is the same as the value that an 
     *      <a href="https://docs.microsoft.com/windows-hardware/drivers/network/oid-gen-xmit-discards">OID_GEN_XMIT_DISCARDS</a> OID query
     *      returns.
     * @type {Integer}
     */
    ifOutDiscards {
        get => NumGet(this, 152, "uint")
        set => NumPut("uint", value, this, 152)
    }

    /**
     * The number of bytes in directed packets that are received without errors. This count is the same
     *      value that 
     *      <a href="https://docs.microsoft.com/windows-hardware/drivers/network/oid-gen-directed-bytes-rcv">OID_GEN_DIRECTED_BYTES_RCV</a> returns.
     * @type {Integer}
     */
    ifHCInUcastOctets {
        get => NumGet(this, 160, "uint")
        set => NumPut("uint", value, this, 160)
    }

    /**
     * The number of bytes in multicast/functional packets that are received without errors. This count
     *      is the same value that 
     *      <a href="https://docs.microsoft.com/windows-hardware/drivers/network/oid-gen-multicast-bytes-rcv">OID_GEN_MULTICAST_BYTES_RCV</a> returns.
     * @type {Integer}
     */
    ifHCInMulticastOctets {
        get => NumGet(this, 168, "uint")
        set => NumPut("uint", value, this, 168)
    }

    /**
     * The number of bytes in broadcast packets that are received without errors. This count is the same
     *      value that 
     *      <a href="https://docs.microsoft.com/windows-hardware/drivers/network/oid-gen-broadcast-bytes-rcv">OID_GEN_BROADCAST_BYTES_RCV</a> returns.
     * @type {Integer}
     */
    ifHCInBroadcastOctets {
        get => NumGet(this, 176, "uint")
        set => NumPut("uint", value, this, 176)
    }

    /**
     * The number of bytes in directed packets that are transmitted without errors. This count is the
     *      same value that 
     *      <a href="https://docs.microsoft.com/windows-hardware/drivers/network/oid-gen-directed-bytes-xmit">OID_GEN_DIRECTED_BYTES_XMIT</a> returns.
     * @type {Integer}
     */
    ifHCOutUcastOctets {
        get => NumGet(this, 184, "uint")
        set => NumPut("uint", value, this, 184)
    }

    /**
     * The number of bytes in multicast/functional packets that are transmitted without errors. This
     *      count is the same value that 
     *      <a href="https://docs.microsoft.com/windows-hardware/drivers/network/oid-gen-multicast-bytes-xmit">OID_GEN_MULTICAST_BYTES_XMIT</a> returns.
     * @type {Integer}
     */
    ifHCOutMulticastOctets {
        get => NumGet(this, 192, "uint")
        set => NumPut("uint", value, this, 192)
    }

    /**
     * The number of bytes in broadcast packets that are transmitted without errors. This count is the
     *      same value that 
     *      <a href="https://docs.microsoft.com/windows-hardware/drivers/network/oid-gen-broadcast-bytes-xmit">OID_GEN_BROADCAST_BYTES_XMIT</a> returns.
     * @type {Integer}
     */
    ifHCOutBroadcastOctets {
        get => NumGet(this, 200, "uint")
        set => NumPut("uint", value, this, 200)
    }

    /**
     * The compartment that the interface belongs to, if the interface provider can provide the ID of the
     *      compartment to which the interface belongs. Otherwise, it should return
     *      NET_IF_COMPARTMENT_ID_UNSPECIFIED. If the interface provider returns NET_IF_COMPARTMENT_ID_UNSPECIFIED
     *      for the compartment ID, NDIS will return the right compartment ID for this interface.
     * @type {Integer}
     */
    CompartmentId {
        get => NumGet(this, 208, "uint")
        set => NumPut("uint", value, this, 208)
    }

    /**
     * The supported statistics. For more information, see the 
     *      <b>SupportedStatistics</b> member of the 
     *      <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/ndis/ns-ndis-_ndis_miniport_adapter_general_attributes">NDIS_MINIPORT_ADAPTER_GENERAL_ATTRIBUTES</a> structure.
     * @type {Integer}
     */
    SupportedStatistics {
        get => NumGet(this, 212, "uint")
        set => NumPut("uint", value, this, 212)
    }
}
