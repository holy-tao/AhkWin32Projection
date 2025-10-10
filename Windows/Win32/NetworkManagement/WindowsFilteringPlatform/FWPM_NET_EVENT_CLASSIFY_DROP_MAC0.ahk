#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\FWP_BYTE_ARRAY6.ahk
#Include .\FWP_BYTE_BLOB.ahk

/**
 * Contains information that describes a MAC layer drop failure.
 * @see https://docs.microsoft.com/windows/win32/api//fwpmtypes/ns-fwpmtypes-fwpm_net_event_classify_drop_mac0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class FWPM_NET_EVENT_CLASSIFY_DROP_MAC0 extends Win32Struct
{
    static sizeof => 104

    static packingSize => 8

    /**
     * The local MAC address.
     * @type {FWP_BYTE_ARRAY6}
     */
    localMacAddr{
        get {
            if(!this.HasProp("__localMacAddr"))
                this.__localMacAddr := FWP_BYTE_ARRAY6(this.ptr + 0)
            return this.__localMacAddr
        }
    }

    /**
     * The remote MAC address.
     * @type {FWP_BYTE_ARRAY6}
     */
    remoteMacAddr{
        get {
            if(!this.HasProp("__remoteMacAddr"))
                this.__remoteMacAddr := FWP_BYTE_ARRAY6(this.ptr + 6)
            return this.__remoteMacAddr
        }
    }

    /**
     * The media type of the NDIS port.
     * @type {Integer}
     */
    mediaType {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * The interface type, as defined by the Internet Assigned Names Authority (IANA). Possible values for the interface type are listed in the Ipifcons.h include file.
     * @type {Integer}
     */
    ifType {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Indicates which protocol is encapsulated in the frame data. The values used for this field comes from the Ethernet V2 specification's numbering space.
     * @type {Integer}
     */
    etherType {
        get => NumGet(this, 20, "ushort")
        set => NumPut("ushort", value, this, 20)
    }

    /**
     * The number assigned to the NDIS port.
     * @type {Integer}
     */
    ndisPortNumber {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Reserved for internal use.
     * @type {Integer}
     */
    reserved {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * The VLAN (802.1p/q) VID, CFI, and Priority fields marshaled into a 16-bit value. (See VLAN_TAG in netiodef.h.)
     * @type {Integer}
     */
    vlanTag {
        get => NumGet(this, 32, "ushort")
        set => NumPut("ushort", value, this, 32)
    }

    /**
     * The interface LUID corresponding to the network interface with which this packet is associated.
     * @type {Integer}
     */
    ifLuid {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * The LUID identifying the filter where the failure occured.
     * @type {Integer}
     */
    filterId {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * The identifier of the filtering layer where the failure occurred. For more information, see <a href="https://docs.microsoft.com/windows/desktop/FWP/management-filtering-layer-identifiers-">Filtering Layer Identifiers</a>
     * @type {Integer}
     */
    layerId {
        get => NumGet(this, 56, "ushort")
        set => NumPut("ushort", value, this, 56)
    }

    /**
     * Indicates the reason for reauthorizing a previously authorized connection.
     * @type {Integer}
     */
    reauthReason {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * Indicates the identifier of the profile to which  the  packet was received (or from which the packet was sent).
     * @type {Integer}
     */
    originalProfile {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * Indicates the identifier of the profile where the packet was when the failure occurred.
     * @type {Integer}
     */
    currentProfile {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

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
     * @type {Integer}
     */
    msFwpDirection {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * Indicates whether the packet originated from (or was heading to) the loopback adapter.
     * @type {Integer}
     */
    isLoopback {
        get => NumGet(this, 76, "int")
        set => NumPut("int", value, this, 76)
    }

    /**
     * GUID identifier of a vSwitch.
     * @type {FWP_BYTE_BLOB}
     */
    vSwitchId{
        get {
            if(!this.HasProp("__vSwitchId"))
                this.__vSwitchId := FWP_BYTE_BLOB(this.ptr + 80)
            return this.__vSwitchId
        }
    }

    /**
     * Transient source port of a packet within the vSwitch.
     * @type {Integer}
     */
    vSwitchSourcePort {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * Transient destination port of a packet within the vSwitch.
     * @type {Integer}
     */
    vSwitchDestinationPort {
        get => NumGet(this, 100, "uint")
        set => NumPut("uint", value, this, 100)
    }
}
