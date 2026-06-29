#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FWP_BYTE_ARRAY6.ahk" { FWP_BYTE_ARRAY6 }
#Import ".\FWP_BYTE_BLOB.ahk" { FWP_BYTE_BLOB }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Contains information that describes a MAC layer drop failure.
 * @see https://learn.microsoft.com/windows/win32/api/fwpmtypes/ns-fwpmtypes-fwpm_net_event_classify_drop_mac0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct FWPM_NET_EVENT_CLASSIFY_DROP_MAC0 {
    #StructPack 8

    /**
     * The local MAC address.
     */
    localMacAddr : FWP_BYTE_ARRAY6

    /**
     * The remote MAC address.
     */
    remoteMacAddr : FWP_BYTE_ARRAY6

    /**
     * The media type of the NDIS port.
     */
    mediaType : UInt32

    /**
     * The interface type, as defined by the Internet Assigned Names Authority (IANA). Possible values for the interface type are listed in the Ipifcons.h include file.
     */
    ifType : UInt32

    /**
     * Indicates which protocol is encapsulated in the frame data. The values used for this field comes from the Ethernet V2 specification's numbering space.
     */
    etherType : UInt16

    /**
     * The number assigned to the NDIS port.
     */
    ndisPortNumber : UInt32

    /**
     * Reserved for internal use.
     */
    reserved : UInt32

    /**
     * The VLAN (802.1p/q) VID, CFI, and Priority fields marshaled into a 16-bit value. (See VLAN_TAG in netiodef.h.)
     */
    vlanTag : UInt16

    /**
     * The interface LUID corresponding to the network interface with which this packet is associated.
     */
    ifLuid : Int64

    /**
     * The LUID identifying the filter where the failure occurred.
     */
    filterId : Int64

    /**
     * The identifier of the filtering layer where the failure occurred. For more information, see <a href="https://docs.microsoft.com/windows/desktop/FWP/management-filtering-layer-identifiers-">Filtering Layer Identifiers</a>
     */
    layerId : UInt16

    /**
     * Indicates the reason for reauthorizing a previously authorized connection.
     */
    reauthReason : UInt32

    /**
     * Indicates the identifier of the profile to which  the  packet was received (or from which the packet was sent).
     */
    originalProfile : UInt32

    /**
     * Indicates the identifier of the profile where the packet was when the failure occurred.
     */
    currentProfile : UInt32

    /**
     * Indicates the direction of the packet transmission.
     * 
     * Possible values:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FWP_DIRECTION_IN"></a><a id="fwp_direction_in"></a><dl>
     * <dt><b>FWP_DIRECTION_IN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The packet is inbound.
     * 
     * 0x00003900L
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FWP_DIRECTION_OUT"></a><a id="fwp_direction_out"></a><dl>
     * <dt><b>FWP_DIRECTION_OUT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The packet is outbound.
     * 
     * 0x00003901L
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FWP_DIRECTION_FORWARD"></a><a id="fwp_direction_forward"></a><dl>
     * <dt><b>FWP_DIRECTION_FORWARD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The packet is traversing an interface which it must pass through on the way to its destination.
     * 
     * 0x00003902L
     * 
     * </td>
     * </tr>
     * </table>
     */
    msFwpDirection : UInt32

    /**
     * Indicates whether the packet originated from (or was heading to) the loopback adapter.
     */
    isLoopback : BOOL

    /**
     * GUID identifier of a vSwitch.
     */
    vSwitchId : FWP_BYTE_BLOB

    /**
     * Transient source port of a packet within the vSwitch.
     */
    vSwitchSourcePort : UInt32

    /**
     * Transient destination port of a packet within the vSwitch.
     */
    vSwitchDestinationPort : UInt32

}
