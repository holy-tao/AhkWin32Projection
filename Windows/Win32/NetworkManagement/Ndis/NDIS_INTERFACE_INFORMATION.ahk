#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NET_IF_COMPARTMENT_ID.ahk" { NET_IF_COMPARTMENT_ID }
#Import ".\NET_IF_MEDIA_CONNECT_STATE.ahk" { NET_IF_MEDIA_CONNECT_STATE }
#Import ".\NET_IF_MEDIA_DUPLEX_STATE.ahk" { NET_IF_MEDIA_DUPLEX_STATE }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\NET_IF_OPER_STATUS.ahk" { NET_IF_OPER_STATUS }

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
 */
export default struct NDIS_INTERFACE_INFORMATION {
    #StructPack 8

    /**
     * The operational status of the interface. This status is the same as the value that the 
     *      <a href="https://docs.microsoft.com/windows-hardware/drivers/network/oid-gen-operational-status">OID_GEN_OPERATIONAL_STATUS</a> OID
     *      returns.
     */
    ifOperStatus : NET_IF_OPER_STATUS

    /**
     * The operational status flags of the interface. This field is reserved for the NDIS proxy interface
     *      provider. Other interface providers should set this member to zero.
     */
    ifOperStatusFlags : UInt32

    /**
     * The 
     *      <a href="https://docs.microsoft.com/windows/desktop/api/ifdef/ne-ifdef-net_if_media_connect_state">NET_IF_MEDIA_CONNECT_STATE</a> connection state type.
     */
    MediaConnectState : NET_IF_MEDIA_CONNECT_STATE

    /**
     * The media duplex state of the interface. This state is the same as the value that the 
     *      <a href="https://docs.microsoft.com/windows-hardware/drivers/network/oid-gen-media-duplex-state">OID_GEN_MEDIA_DUPLEX_STATE</a> OID
     *      returns.
     */
    MediaDuplexState : NET_IF_MEDIA_DUPLEX_STATE

    /**
     * The maximum transmission unit (MTU) of the interface. This MTU is the same as the value that the 
     *      <a href="https://docs.microsoft.com/windows-hardware/drivers/network/oid-gen-maximum-frame-size">OID_GEN_MAXIMUM_FRAME_SIZE</a> OID
     *      returns.
     */
    ifMtu : UInt32

    /**
     * A Boolean value that is <b>TRUE</b> if the interface is in promiscuous mode or <b>FALSE</b> if it is not. This
     *      value is the same as the value that 
     *      <a href="https://docs.microsoft.com/windows-hardware/drivers/network/oid-gen-promiscuous-mode">OID_GEN_PROMISCUOUS_MODE</a> OID query
     *      returns.
     */
    ifPromiscuousMode : BOOLEAN

    /**
     * A Boolean value that is <b>TRUE</b> if the interface supports wake-on-LAN capability and the capability is enabled, or <b>FALSE</b> if it does
     *      not.
     */
    ifDeviceWakeUpEnable : BOOLEAN

    /**
     * The transmit link speed, in bytes per second, of the interface. This speed is the same as the
     *      value that an 
     *      <a href="https://docs.microsoft.com/windows-hardware/drivers/network/oid-gen-xmit-link-speed">OID_GEN_XMIT_LINK_SPEED</a> OID query
     *      returns.
     */
    XmitLinkSpeed : Int64

    /**
     * The receive link speed, in bytes per second, of the interface. This speed is the same as the value
     *      that an 
     *      <a href="https://docs.microsoft.com/windows-hardware/drivers/network/oid-gen-rcv-link-speed">OID_GEN_RCV_LINK_SPEED</a> OID query
     *      returns.
     */
    RcvLinkSpeed : Int64

    /**
     * The time that the interface entered its current operational state. This time is the same as the
     *      value that an 
     *      <a href="https://docs.microsoft.com/windows-hardware/drivers/network/oid-gen-last-change">OID_GEN_LAST_CHANGE</a> OID query
     *      returns.
     */
    ifLastChange : Int64

    /**
     * The time of the last discontinuity of the interface's counters. This time is the same as the value
     *      that an 
     *      <a href="https://docs.microsoft.com/windows-hardware/drivers/network/oid-gen-discontinuity-time">OID_GEN_DISCONTINUITY_TIME</a> OID
     *      query returns.
     */
    ifCounterDiscontinuityTime : Int64

    /**
     * The number of packets that were received through the interface and that were discarded because of
     *      an unknown or unsupported protocol. This number is the same as the value that an 
     *      <a href="https://docs.microsoft.com/windows-hardware/drivers/network/oid-gen-unknown-protos">OID_GEN_UNKNOWN_PROTOS</a> OID query
     *      returns.
     */
    ifInUnknownProtos : Int64

    /**
     * The number of inbound packets that were discarded even though no errors had been detected to
     *      prevent them from being deliverable to a higher-layer protocol. This number is the same as the value
     *      that an 
     *      <a href="https://docs.microsoft.com/windows-hardware/drivers/network/oid-gen-rcv-discards">OID_GEN_RCV_DISCARDS</a> OID query
     *      returns.
     */
    ifInDiscards : Int64

    /**
     * The number of inbound packets that contained errors that prevented them from being deliverable to
     *      a higher layer protocol. This number is the same as the value that an 
     *      <a href="https://docs.microsoft.com/windows-hardware/drivers/network/oid-gen-rcv-error">OID_GEN_RCV_ERROR</a> OID query returns.
     */
    ifInErrors : Int64

    /**
     * The total number of bytes that are received on this interface. This number is the same as the
     *      value that an 
     *      <a href="https://docs.microsoft.com/windows-hardware/drivers/network/oid-gen-bytes-rcv">OID_GEN_BYTES_RCV</a> OID returns.
     */
    ifHCInOctets : Int64

    /**
     * The number of directed packets that are received without errors on the interface. This number is
     *      the same as the value that an 
     *      <a href="https://docs.microsoft.com/windows-hardware/drivers/network/oid-gen-directed-frames-rcv">OID_GEN_DIRECTED_FRAMES_RCV</a> OID
     *      query returns.
     */
    ifHCInUcastPkts : Int64

    /**
     * The number of multicast/functional packets that are received without errors on the interface. This
     *      number is the same as the value that an 
     *      <a href="https://docs.microsoft.com/windows-hardware/drivers/network/oid-gen-multicast-frames-rcv">OID_GEN_MULTICAST_FRAMES_RCV</a> OID
     *      query returns.
     */
    ifHCInMulticastPkts : Int64

    /**
     * The number of broadcast packets that are received without errors on the interface. This number is
     *      the same as the value that an 
     *      <a href="https://docs.microsoft.com/windows-hardware/drivers/network/oid-gen-broadcast-frames-rcv">OID_GEN_BROADCAST_FRAMES_RCV</a> OID
     *      query returns.
     */
    ifHCInBroadcastPkts : Int64

    /**
     * The number of bytes that are transmitted without errors on the interface. This number is the same
     *      as the value that an 
     *      <a href="https://docs.microsoft.com/windows-hardware/drivers/network/oid-gen-bytes-xmit">OID_GEN_BYTES_XMIT</a> OID query
     *      returns.
     */
    ifHCOutOctets : Int64

    /**
     * The number of directed packets that are transmitted without errors on the interface. This number
     *      is the same as the value that an 
     *      <a href="https://docs.microsoft.com/windows-hardware/drivers/network/oid-gen-directed-frames-xmit">OID_GEN_DIRECTED_FRAMES_XMIT</a> OID
     *      query returns.
     */
    ifHCOutUcastPkts : Int64

    /**
     * The number of multicast/functional packets that are transmitted without errors on the interface.
     *      This number is the same as the value that an 
     *      <a href="https://docs.microsoft.com/windows-hardware/drivers/network/oid-gen-multicast-frames-xmit">OID_GEN_MULTICAST_FRAMES_XMIT</a> OID query returns.
     */
    ifHCOutMulticastPkts : Int64

    /**
     * The number of broadcast packets that are transmitted without errors on the interface. This number
     *      is the same as the value that an 
     *      <a href="https://docs.microsoft.com/windows-hardware/drivers/network/oid-gen-broadcast-frames-xmit">OID_GEN_BROADCAST_FRAMES_XMIT</a> OID query returns.
     */
    ifHCOutBroadcastPkts : Int64

    /**
     * The number of packets that the interface fails to transmit. This number is the same as the value
     *      that an 
     *      <a href="https://docs.microsoft.com/windows-hardware/drivers/network/oid-gen-xmit-error">OID_GEN_XMIT_ERROR</a> OID query
     *      returns.
     */
    ifOutErrors : Int64

    /**
     * The number of packets that the interface discards. This number is the same as the value that an 
     *      <a href="https://docs.microsoft.com/windows-hardware/drivers/network/oid-gen-xmit-discards">OID_GEN_XMIT_DISCARDS</a> OID query
     *      returns.
     */
    ifOutDiscards : Int64

    /**
     * The number of bytes in directed packets that are received without errors. This count is the same
     *      value that 
     *      <a href="https://docs.microsoft.com/windows-hardware/drivers/network/oid-gen-directed-bytes-rcv">OID_GEN_DIRECTED_BYTES_RCV</a> returns.
     */
    ifHCInUcastOctets : Int64

    /**
     * The number of bytes in multicast/functional packets that are received without errors. This count
     *      is the same value that 
     *      <a href="https://docs.microsoft.com/windows-hardware/drivers/network/oid-gen-multicast-bytes-rcv">OID_GEN_MULTICAST_BYTES_RCV</a> returns.
     */
    ifHCInMulticastOctets : Int64

    /**
     * The number of bytes in broadcast packets that are received without errors. This count is the same
     *      value that 
     *      <a href="https://docs.microsoft.com/windows-hardware/drivers/network/oid-gen-broadcast-bytes-rcv">OID_GEN_BROADCAST_BYTES_RCV</a> returns.
     */
    ifHCInBroadcastOctets : Int64

    /**
     * The number of bytes in directed packets that are transmitted without errors. This count is the
     *      same value that 
     *      <a href="https://docs.microsoft.com/windows-hardware/drivers/network/oid-gen-directed-bytes-xmit">OID_GEN_DIRECTED_BYTES_XMIT</a> returns.
     */
    ifHCOutUcastOctets : Int64

    /**
     * The number of bytes in multicast/functional packets that are transmitted without errors. This
     *      count is the same value that 
     *      <a href="https://docs.microsoft.com/windows-hardware/drivers/network/oid-gen-multicast-bytes-xmit">OID_GEN_MULTICAST_BYTES_XMIT</a> returns.
     */
    ifHCOutMulticastOctets : Int64

    /**
     * The number of bytes in broadcast packets that are transmitted without errors. This count is the
     *      same value that 
     *      <a href="https://docs.microsoft.com/windows-hardware/drivers/network/oid-gen-broadcast-bytes-xmit">OID_GEN_BROADCAST_BYTES_XMIT</a> returns.
     */
    ifHCOutBroadcastOctets : Int64

    /**
     * The compartment that the interface belongs to, if the interface provider can provide the ID of the
     *      compartment to which the interface belongs. Otherwise, it should return
     *      NET_IF_COMPARTMENT_ID_UNSPECIFIED. If the interface provider returns NET_IF_COMPARTMENT_ID_UNSPECIFIED
     *      for the compartment ID, NDIS will return the right compartment ID for this interface.
     */
    CompartmentId : NET_IF_COMPARTMENT_ID

    /**
     * The supported statistics. For more information, see the 
     *      <b>SupportedStatistics</b> member of the 
     *      <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/ndis/ns-ndis-_ndis_miniport_adapter_general_attributes">NDIS_MINIPORT_ADAPTER_GENERAL_ATTRIBUTES</a> structure.
     */
    SupportedStatistics : UInt32

}
