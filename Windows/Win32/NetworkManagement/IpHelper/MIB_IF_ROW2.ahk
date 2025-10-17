#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\Ndis\NET_LUID_LH.ahk

/**
 * Stores information about a particular interface.
 * @remarks
 * 
  * The <b>MIB_IF_ROW2</b> structure is defined on Windows Vista and later. 
  * 
  * The values for the <b>Type</b> field are defined in the <i>Ipifcons.h</i> header file. Only the possible values listed in the description of the <b>Type</b> member are currently supported.
  * 
  * Note that the <i>Netioapi.h</i> header file is automatically included in the <i>Iphlpapi.h</i> header file. The  <i>Netioapi.h</i> header file should never be used directly.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//netioapi/ns-netioapi-mib_if_row2
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class MIB_IF_ROW2 extends Win32Struct
{
    static sizeof => 1352

    static packingSize => 8

    class _InterfaceAndOperStatusFlags extends Win32Struct {
        static sizeof => 1352
        static packingSize => 8

        /**
         * This bitfield backs the following members:
         * - HardwareInterface
         * - FilterInterface
         * - ConnectorPresent
         * - NotAuthenticated
         * - NotMediaConnected
         * - Paused
         * - LowPower
         * - EndPointInterface
         * @type {Integer}
         */
        _bitfield {
            get => NumGet(this, 0, "char")
            set => NumPut("char", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        HardwareInterface {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }
    
        /**
         * @type {Integer}
         */
        FilterInterface {
            get => (this._bitfield >> 1) & 0x1
            set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
        }
    
        /**
         * @type {Integer}
         */
        ConnectorPresent {
            get => (this._bitfield >> 2) & 0x1
            set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
        }
    
        /**
         * @type {Integer}
         */
        NotAuthenticated {
            get => (this._bitfield >> 3) & 0x1
            set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
        }
    
        /**
         * @type {Integer}
         */
        NotMediaConnected {
            get => (this._bitfield >> 4) & 0x1
            set => this._bitfield := ((value & 0x1) << 4) | (this._bitfield & ~(0x1 << 4))
        }
    
        /**
         * @type {Integer}
         */
        Paused {
            get => (this._bitfield >> 5) & 0x1
            set => this._bitfield := ((value & 0x1) << 5) | (this._bitfield & ~(0x1 << 5))
        }
    
        /**
         * @type {Integer}
         */
        LowPower {
            get => (this._bitfield >> 6) & 0x1
            set => this._bitfield := ((value & 0x1) << 6) | (this._bitfield & ~(0x1 << 6))
        }
    
        /**
         * @type {Integer}
         */
        EndPointInterface {
            get => (this._bitfield >> 7) & 0x1
            set => this._bitfield := ((value & 0x1) << 7) | (this._bitfield & ~(0x1 << 7))
        }
    
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/ifdef/ns-ifdef-net_luid_lh">NET_LUID</a></b>
     * 
     * The locally unique identifier (LUID) for the network interface.
     * @type {NET_LUID_LH}
     */
    InterfaceLuid{
        get {
            if(!this.HasProp("__InterfaceLuid"))
                this.__InterfaceLuid := NET_LUID_LH(0, this)
            return this.__InterfaceLuid
        }
    }

    /**
     * Type: <b>NET_IFINDEX</b>
     * 
     * The index that identifies the network interface. This index value may change when a network adapter is disabled and then enabled, and should not be considered persistent.
     * @type {Integer}
     */
    InterfaceIndex {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: <b>GUID</b>
     * 
     * The GUID for the network interface.
     * @type {Pointer<Guid>}
     */
    InterfaceGuid {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Type: <b>WCHAR[IF_MAX_STRING_SIZE + 1]</b>
     * 
     * A NULL-terminated Unicode string that  contains the alias name of the network interface.
     * @type {String}
     */
    Alias {
        get => StrGet(this.ptr + 32, 256, "UTF-16")
        set => StrPut(value, this.ptr + 32, 256, "UTF-16")
    }

    /**
     * Type: <b>WCHAR[IF_MAX_STRING_SIZE + 1]</b>
     * 
     * A NULL-terminated Unicode string that contains a description of the network interface.
     * @type {String}
     */
    Description {
        get => StrGet(this.ptr + 546, 256, "UTF-16")
        set => StrPut(value, this.ptr + 546, 256, "UTF-16")
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * The length, in bytes, of the physical hardware address specified by the <b>PhysicalAddress</b> member.
     * @type {Integer}
     */
    PhysicalAddressLength {
        get => NumGet(this, 1060, "uint")
        set => NumPut("uint", value, this, 1060)
    }

    /**
     * Type: <b> UCHAR[IF_MAX_PHYS_ADDRESS_LENGTH]</b>
     * 
     * The physical hardware address of the adapter for this network interface.
     * @type {Array<Byte>}
     */
    PhysicalAddress{
        get {
            if(!this.HasProp("__PhysicalAddressProxyArray"))
                this.__PhysicalAddressProxyArray := Win32FixedArray(this.ptr + 1064, 32, Primitive, "char")
            return this.__PhysicalAddressProxyArray
        }
    }

    /**
     * Type: <b> UCHAR[IF_MAX_PHYS_ADDRESS_LENGTH]</b>
     * 
     * The permanent physical hardware address of the adapter for this network interface.
     * @type {Array<Byte>}
     */
    PermanentPhysicalAddress{
        get {
            if(!this.HasProp("__PermanentPhysicalAddressProxyArray"))
                this.__PermanentPhysicalAddressProxyArray := Win32FixedArray(this.ptr + 1096, 32, Primitive, "char")
            return this.__PermanentPhysicalAddressProxyArray
        }
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * The maximum transmission unit (MTU) size, in bytes, for this network interface.
     * @type {Integer}
     */
    Mtu {
        get => NumGet(this, 1128, "uint")
        set => NumPut("uint", value, this, 1128)
    }

    /**
     * Type: <b>IFTYPE</b>
     * 
     * The interface type as defined by the Internet Assigned Names Authority (IANA). For more information, see <a href="https://www.iana.org/assignments/ianaiftype-mib">http://www.iana.org/assignments/ianaiftype-mib</a>. Possible values for the interface type are listed in the <i>Ipifcons.h</i> header file.
     * 
     * The table below lists common values for the interface type although many other values are possible. 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IF_TYPE_OTHER"></a><a id="if_type_other"></a><dl>
     * <dt><b>IF_TYPE_OTHER</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Some other type of network interface.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IF_TYPE_ETHERNET_CSMACD"></a><a id="if_type_ethernet_csmacd"></a><dl>
     * <dt><b>IF_TYPE_ETHERNET_CSMACD</b></dt>
     * <dt>6</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An Ethernet network interface.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IF_TYPE_ISO88025_TOKENRING"></a><a id="if_type_iso88025_tokenring"></a><dl>
     * <dt><b>IF_TYPE_ISO88025_TOKENRING</b></dt>
     * <dt>9</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A token ring network interface.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IF_TYPE_FDDI"></a><a id="if_type_fddi"></a><dl>
     * <dt><b>IF_TYPE_FDDI</b></dt>
     * <dt>15</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Fiber Distributed Data Interface (FDDI) network interface.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IF_TYPE_PPP"></a><a id="if_type_ppp"></a><dl>
     * <dt><b>IF_TYPE_PPP</b></dt>
     * <dt>23</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A PPP network interface.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IF_TYPE_SOFTWARE_LOOPBACK"></a><a id="if_type_software_loopback"></a><dl>
     * <dt><b>IF_TYPE_SOFTWARE_LOOPBACK</b></dt>
     * <dt>24</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A software loopback network interface.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IF_TYPE_ATM"></a><a id="if_type_atm"></a><dl>
     * <dt><b>IF_TYPE_ATM</b></dt>
     * <dt>37</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An ATM network interface.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IF_TYPE_IEEE80211"></a><a id="if_type_ieee80211"></a><dl>
     * <dt><b>IF_TYPE_IEEE80211</b></dt>
     * <dt>71</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An IEEE 802.11 wireless network interface.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IF_TYPE_TUNNEL"></a><a id="if_type_tunnel"></a><dl>
     * <dt><b>IF_TYPE_TUNNEL</b></dt>
     * <dt>131</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A tunnel type encapsulation network interface.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IF_TYPE_IEEE1394"></a><a id="if_type_ieee1394"></a><dl>
     * <dt><b>IF_TYPE_IEEE1394</b></dt>
     * <dt>144</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An IEEE 1394 (Firewire) high performance serial bus network interface.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="_IF_TYPE_IEEE80216_WMAN"></a><a id="_if_type_ieee80216_wman"></a><dl>
     * <dt><b> IF_TYPE_IEEE80216_WMAN</b></dt>
     * <dt>237</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A mobile broadband interface for WiMax devices.
     * 
     * <div class="alert"><b>Note</b>  This interface type is supported on Windows 7,   Windows Server 2008 R2, and later.</div>
     * <div> </div>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IF_TYPE_WWANPP"></a><a id="if_type_wwanpp"></a><dl>
     * <dt><b>IF_TYPE_WWANPP</b></dt>
     * <dt>243</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A mobile broadband interface for GSM-based devices.
     * 
     * <div class="alert"><b>Note</b>  This interface type is supported on Windows 7,   Windows Server 2008 R2, and later.</div>
     * <div> </div>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IF_TYPE_WWANPP2"></a><a id="if_type_wwanpp2"></a><dl>
     * <dt><b>IF_TYPE_WWANPP2</b></dt>
     * <dt>244</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A mobile broadband interface for CDMA-based devices.
     * 
     * <div class="alert"><b>Note</b>  This interface type is supported on Windows 7,   Windows Server 2008 R2, and later.</div>
     * <div> </div>
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 1132, "uint")
        set => NumPut("uint", value, this, 1132)
    }

    /**
     * Type: <b>TUNNEL_TYPE</b>
     * 
     * The encapsulation method used by a tunnel if the <b>Type</b> member is <b>IF_TYPE_TUNNEL</b>. The tunnel type is defined by the Internet Assigned Names Authority (IANA). For more information, see <a href="https://www.iana.org/assignments/ianaiftype-mib">http://www.iana.org/assignments/ianaiftype-mib</a>. This member can be one of the values from the <b>TUNNEL_TYPE</b> enumeration type defined in the <i>Ifdef.h</i> header file.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TUNNEL_TYPE_NONE"></a><a id="tunnel_type_none"></a><dl>
     * <dt><b>TUNNEL_TYPE_NONE</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not a tunnel.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TUNNEL_TYPE_OTHER"></a><a id="tunnel_type_other"></a><dl>
     * <dt><b>TUNNEL_TYPE_OTHER</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * None of the following tunnel types.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TUNNEL_TYPE_DIRECT"></a><a id="tunnel_type_direct"></a><dl>
     * <dt><b>TUNNEL_TYPE_DIRECT</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A packet is encapsulated
     *             directly within a normal IP header, with no
     *             intermediate header, and unicast to the remote tunnel
     *             endpoint.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TUNNEL_TYPE_6TO4"></a><a id="tunnel_type_6to4"></a><dl>
     * <dt><b>TUNNEL_TYPE_6TO4</b></dt>
     * <dt>11</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An IPv6 packet is encapsulated directly
     *             within an IPv4 header, with no intermediate header,
     *             and unicast to the destination determined by the 6to4 protocol.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TUNNEL_TYPE_ISATAP"></a><a id="tunnel_type_isatap"></a><dl>
     * <dt><b>TUNNEL_TYPE_ISATAP</b></dt>
     * <dt>13</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An IPv6 packet is encapsulated directly
     *             within an IPv4 header, with no intermediate header,
     *             and unicast to the destination determined by the ISATAP protocol.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TUNNEL_TYPE_TEREDO"></a><a id="tunnel_type_teredo"></a><dl>
     * <dt><b>TUNNEL_TYPE_TEREDO</b></dt>
     * <dt>14</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Teredo encapsulation.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    TunnelType {
        get => NumGet(this, 1136, "int")
        set => NumPut("int", value, this, 1136)
    }

    /**
     * Type: <b>NDIS_MEDIUM</b>
     * 
     * The NDIS media type for the interface. This member can be one of the values from the <b>NDIS_MEDIUM</b> enumeration type defined in the <i>Ntddndis.h</i> header file.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NdisMedium802_3"></a><a id="ndismedium802_3"></a><a id="NDISMEDIUM802_3"></a><dl>
     * <dt><b>NdisMedium802_3</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An Ethernet (802.3) network.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NdisMedium802_5"></a><a id="ndismedium802_5"></a><a id="NDISMEDIUM802_5"></a><dl>
     * <dt><b>NdisMedium802_5</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Token Ring (802.5) network.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NdisMediumFddi"></a><a id="ndismediumfddi"></a><a id="NDISMEDIUMFDDI"></a><dl>
     * <dt><b>NdisMediumFddi</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Fiber Distributed Data Interface (FDDI) network.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NdisMediumWan"></a><a id="ndismediumwan"></a><a id="NDISMEDIUMWAN"></a><dl>
     * <dt><b>NdisMediumWan</b></dt>
     * <dt>3</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A wide area network (WAN). This type covers various forms of point-to-point and WAN NICs, as well as variant address/header formats that must be negotiated between the protocol driver and the underlying driver after the binding is established.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NdisMediumLocalTalk"></a><a id="ndismediumlocaltalk"></a><a id="NDISMEDIUMLOCALTALK"></a><dl>
     * <dt><b>NdisMediumLocalTalk</b></dt>
     * <dt>4</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A LocalTalk network.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NdisMediumDix"></a><a id="ndismediumdix"></a><a id="NDISMEDIUMDIX"></a><dl>
     * <dt><b>NdisMediumDix</b></dt>
     * <dt>5</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An Ethernet network for which the drivers use the DIX Ethernet header format.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NdisMediumArcnetRaw"></a><a id="ndismediumarcnetraw"></a><a id="NDISMEDIUMARCNETRAW"></a><dl>
     * <dt><b>NdisMediumArcnetRaw</b></dt>
     * <dt>6</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An ARCNET network.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NdisMediumArcnet878_2"></a><a id="ndismediumarcnet878_2"></a><a id="NDISMEDIUMARCNET878_2"></a><dl>
     * <dt><b>NdisMediumArcnet878_2</b></dt>
     * <dt>7</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An ARCNET (878.2) network.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NdisMediumAtm"></a><a id="ndismediumatm"></a><a id="NDISMEDIUMATM"></a><dl>
     * <dt><b>NdisMediumAtm</b></dt>
     * <dt>8</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An ATM network. Connection-oriented client protocol drivers can bind themselves to an underlying miniport driver that returns this value. Otherwise, legacy protocol drivers bind themselves to the system-supplied LanE intermediate driver, which reports its medium type as either NdisMedium802_3 or NdisMedium802_5, depending on how the LanE driver is configured by the network administrator.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NdisMediumWirelessWan"></a><a id="ndismediumwirelesswan"></a><a id="NDISMEDIUMWIRELESSWAN"></a><dl>
     * <dt><b>NdisMediumWirelessWan</b></dt>
     * <dt>9</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A wireless network. NDIS 5.X miniport drivers that support wireless LAN (WLAN) or wireless WAN (WWAN) packets do not use this NDIS media type, but declare their media type as NdisMedium802_3 and emulate Ethernet to higher-level NDIS drivers.
     * 
     * <div class="alert"><b>Note</b>  This media type is supported and can be used for Mobile Broadband only on Windows 7,  Windows Server 2008 R2, and later.</div>
     * <div> </div>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NdisMediumIrda"></a><a id="ndismediumirda"></a><a id="NDISMEDIUMIRDA"></a><dl>
     * <dt><b>NdisMediumIrda</b></dt>
     * <dt>10</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An infrared (IrDA) network.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NdisMediumBpc"></a><a id="ndismediumbpc"></a><a id="NDISMEDIUMBPC"></a><dl>
     * <dt><b>NdisMediumBpc</b></dt>
     * <dt>11</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A broadcast PC network.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NdisMediumCoWan"></a><a id="ndismediumcowan"></a><a id="NDISMEDIUMCOWAN"></a><dl>
     * <dt><b>NdisMediumCoWan</b></dt>
     * <dt>12</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A wide area network in a connection-oriented environment.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NdisMedium1394"></a><a id="ndismedium1394"></a><a id="NDISMEDIUM1394"></a><dl>
     * <dt><b>NdisMedium1394</b></dt>
     * <dt>13</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An IEEE 1394 (fire wire) network.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NdisMediumInfiniBand"></a><a id="ndismediuminfiniband"></a><a id="NDISMEDIUMINFINIBAND"></a><dl>
     * <dt><b>NdisMediumInfiniBand</b></dt>
     * <dt>14</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An InfiniBand network.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NdisMediumTunnel"></a><a id="ndismediumtunnel"></a><a id="NDISMEDIUMTUNNEL"></a><dl>
     * <dt><b>NdisMediumTunnel</b></dt>
     * <dt>15</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A tunnel network.
     * 
     * <div class="alert"><b>Note</b>  This media type is supported on Windows Vista,   Windows Server 2008, and later.</div>
     * <div> </div>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NdisMediumNative802_11"></a><a id="ndismediumnative802_11"></a><a id="NDISMEDIUMNATIVE802_11"></a><dl>
     * <dt><b>NdisMediumNative802_11</b></dt>
     * <dt>16</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A native IEEE 802.11 network.
     * 
     * <div class="alert"><b>Note</b>  This media type is supported on Windows Vista,   Windows Server 2008, and later.</div>
     * <div> </div>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NdisMediumLoopback"></a><a id="ndismediumloopback"></a><a id="NDISMEDIUMLOOPBACK"></a><dl>
     * <dt><b>NdisMediumLoopback</b></dt>
     * <dt>17</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An NDIS loopback network.
     * 
     * <div class="alert"><b>Note</b>  This media type is supported on Windows Vista,   Windows Server 2008, and later.</div>
     * <div> </div>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NdisMediumWiMax"></a><a id="ndismediumwimax"></a><a id="NDISMEDIUMWIMAX"></a><dl>
     * <dt><b>NdisMediumWiMax</b></dt>
     * <dt>18</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An WiMax network.
     * 
     * <div class="alert"><b>Note</b>  This media type is supported on Windows 7,   Windows Server 2008 R2, and later.</div>
     * <div> </div>
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    MediaType {
        get => NumGet(this, 1140, "int")
        set => NumPut("int", value, this, 1140)
    }

    /**
     * Type: <b>NDIS_PHYSICAL_MEDIUM</b>
     * 
     * The NDIS physical medium type. This member can be one of the values from the <b>NDIS_PHYSICAL_MEDIUM</b> enumeration type defined in the <i>Ntddndis.h</i> header file.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NdisPhysicalMediumUnspecified"></a><a id="ndisphysicalmediumunspecified"></a><a id="NDISPHYSICALMEDIUMUNSPECIFIED"></a><dl>
     * <dt><b>NdisPhysicalMediumUnspecified</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The physical medium is none of the below values. For example, a one-way satellite feed is an unspecified physical medium.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NdisPhysicalMediumWirelessLan"></a><a id="ndisphysicalmediumwirelesslan"></a><a id="NDISPHYSICALMEDIUMWIRELESSLAN"></a><dl>
     * <dt><b>NdisPhysicalMediumWirelessLan</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Packets are transferred over a wireless LAN network through a miniport driver that conforms to the 802.11 interface.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NdisPhysicalMediumCableModem"></a><a id="ndisphysicalmediumcablemodem"></a><a id="NDISPHYSICALMEDIUMCABLEMODEM"></a><dl>
     * <dt><b>NdisPhysicalMediumCableModem</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Packets are transferred over a DOCSIS-based cable network.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NdisPhysicalMediumPhoneLine"></a><a id="ndisphysicalmediumphoneline"></a><a id="NDISPHYSICALMEDIUMPHONELINE"></a><dl>
     * <dt><b>NdisPhysicalMediumPhoneLine</b></dt>
     * <dt>3</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Packets are transferred over standard phone lines. This includes HomePNA media, for example.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NdisPhysicalMediumPowerLine"></a><a id="ndisphysicalmediumpowerline"></a><a id="NDISPHYSICALMEDIUMPOWERLINE"></a><dl>
     * <dt><b>NdisPhysicalMediumPowerLine</b></dt>
     * <dt>4</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Packets are transferred over wiring that is connected to a power distribution system.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NdisPhysicalMediumDSL"></a><a id="ndisphysicalmediumdsl"></a><a id="NDISPHYSICALMEDIUMDSL"></a><dl>
     * <dt><b>NdisPhysicalMediumDSL</b></dt>
     * <dt>5</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Packets are transferred over a Digital Subscriber Line (DSL) network. This includes ADSL, UADSL (G.Lite), and SDSL, for example.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NdisPhysicalMediumFibreChannel"></a><a id="ndisphysicalmediumfibrechannel"></a><a id="NDISPHYSICALMEDIUMFIBRECHANNEL"></a><dl>
     * <dt><b>NdisPhysicalMediumFibreChannel</b></dt>
     * <dt>6</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Packets are transferred over a Fibre Channel interconnect.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NdisPhysicalMedium1394"></a><a id="ndisphysicalmedium1394"></a><a id="NDISPHYSICALMEDIUM1394"></a><dl>
     * <dt><b>NdisPhysicalMedium1394</b></dt>
     * <dt>7</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Packets are transferred over an IEEE 1394 bus.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NdisPhysicalMediumWirelessWan"></a><a id="ndisphysicalmediumwirelesswan"></a><a id="NDISPHYSICALMEDIUMWIRELESSWAN"></a><dl>
     * <dt><b>NdisPhysicalMediumWirelessWan</b></dt>
     * <dt>8</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Packets are transferred over a Wireless WAN link. This includes mobile broadband devices that support CDPD, CDMA, GSM, and GPRS, for example.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NdisPhysicalMediumNative802_11"></a><a id="ndisphysicalmediumnative802_11"></a><a id="NDISPHYSICALMEDIUMNATIVE802_11"></a><dl>
     * <dt><b>NdisPhysicalMediumNative802_11</b></dt>
     * <dt>9</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Packets are transferred over a wireless LAN network through a miniport driver that conforms to the Native 802.11 interface.
     * 
     * <div class="alert"><b>Note</b>  The Native 802.11 interface is supported in NDIS 6.0 and later versions.</div>
     * <div> </div>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NdisPhysicalMediumBluetooth"></a><a id="ndisphysicalmediumbluetooth"></a><a id="NDISPHYSICALMEDIUMBLUETOOTH"></a><dl>
     * <dt><b>NdisPhysicalMediumBluetooth</b></dt>
     * <dt>10</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Packets are transferred over a Bluetooth network. Bluetooth is a short-range wireless technology that uses the 2.4 GHz spectrum.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NdisPhysicalMediumInfiniband"></a><a id="ndisphysicalmediuminfiniband"></a><a id="NDISPHYSICALMEDIUMINFINIBAND"></a><dl>
     * <dt><b>NdisPhysicalMediumInfiniband</b></dt>
     * <dt>11</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Packets are transferred over an Infiniband interconnect.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NdisPhysicalMediumWiMax"></a><a id="ndisphysicalmediumwimax"></a><a id="NDISPHYSICALMEDIUMWIMAX"></a><dl>
     * <dt><b>NdisPhysicalMediumWiMax</b></dt>
     * <dt>12</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Packets are transferred over a WiMax network.  
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NdisPhysicalMediumUWB"></a><a id="ndisphysicalmediumuwb"></a><a id="NDISPHYSICALMEDIUMUWB"></a><dl>
     * <dt><b>NdisPhysicalMediumUWB</b></dt>
     * <dt>13</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Packets are transferred over an ultra wide band network. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NdisPhysicalMedium802_3"></a><a id="ndisphysicalmedium802_3"></a><a id="NDISPHYSICALMEDIUM802_3"></a><dl>
     * <dt><b>NdisPhysicalMedium802_3</b></dt>
     * <dt>14</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Packets are transferred over an Ethernet (802.3) network. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NdisPhysicalMedium802_5"></a><a id="ndisphysicalmedium802_5"></a><a id="NDISPHYSICALMEDIUM802_5"></a><dl>
     * <dt><b>NdisPhysicalMedium802_5</b></dt>
     * <dt>15</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Packets are transferred over a Token Ring (802.5) network. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NdisPhysicalMediumIrda"></a><a id="ndisphysicalmediumirda"></a><a id="NDISPHYSICALMEDIUMIRDA"></a><dl>
     * <dt><b>NdisPhysicalMediumIrda</b></dt>
     * <dt>16</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Packets are transferred over an infrared (IrDA) network.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NdisPhysicalMediumWiredWAN"></a><a id="ndisphysicalmediumwiredwan"></a><a id="NDISPHYSICALMEDIUMWIREDWAN"></a><dl>
     * <dt><b>NdisPhysicalMediumWiredWAN</b></dt>
     * <dt>17</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Packets are transferred over a wired WAN network.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NdisPhysicalMediumWiredCoWan"></a><a id="ndisphysicalmediumwiredcowan"></a><a id="NDISPHYSICALMEDIUMWIREDCOWAN"></a><dl>
     * <dt><b>NdisPhysicalMediumWiredCoWan</b></dt>
     * <dt>18</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Packets are transferred over a wide area network in a connection-oriented environment.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NdisPhysicalMediumOther"></a><a id="ndisphysicalmediumother"></a><a id="NDISPHYSICALMEDIUMOTHER"></a><dl>
     * <dt><b>NdisPhysicalMediumOther</b></dt>
     * <dt>19</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Packets are transferred over a network that is not described by other possible values.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    PhysicalMediumType {
        get => NumGet(this, 1144, "int")
        set => NumPut("int", value, this, 1144)
    }

    /**
     * Type: <b>NET_IF_ACCESS_TYPE</b>
     * 
     * The interface access type. This member can be one of the values from the <b>NET_IF_ACCESS_TYPE</b> enumeration type defined in the <i>Ifdef.h</i> header file.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NET_IF_ACCESS_LOOPBACK"></a><a id="net_if_access_loopback"></a><dl>
     * <dt><b>NET_IF_ACCESS_LOOPBACK</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Loopback access type. This access type indicates that the interface loops back transmit data as receive data.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NET_IF_ACCESS_BROADCAST"></a><a id="net_if_access_broadcast"></a><dl>
     * <dt><b>NET_IF_ACCESS_BROADCAST</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The LAN access type which includes Ethernet. This access type indicates that the interface provides native support for multicast or broadcast services.
     * 
     * <div class="alert"><b>Note</b>  Mobile broadband interfaces with a <b>MediaType</b> of  <b>NdisMedium802_3</b> use this access type.</div>
     * <div> </div>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NET_IF_ACCESS_POINT_TO_POINT"></a><a id="net_if_access_point_to_point"></a><dl>
     * <dt><b>NET_IF_ACCESS_POINT_TO_POINT</b></dt>
     * <dt>3</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Point-to-point access that supports CoNDIS/WAN, except for non-broadcast multi-access (NBMA) interfaces.
     * 
     * <div class="alert"><b>Note</b>  Mobile broadband interfaces with a <b>MediaType</b> of  <b>NdisMediumWirelessWan</b> use this access type.</div>
     * <div> </div>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NET_IF_ACCESS_POINT_TO_MULTI_POINT"></a><a id="net_if_access_point_to_multi_point"></a><dl>
     * <dt><b>NET_IF_ACCESS_POINT_TO_MULTI_POINT</b></dt>
     * <dt>4</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Point-to-multipoint access that supports non-broadcast multi-access (NBMA) media, including the "RAS Internal" interface, and native (non-LANE) ATM.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NET_IF_ACCESS_MAXIMUM"></a><a id="net_if_access_maximum"></a><dl>
     * <dt><b>NET_IF_ACCESS_MAXIMUM</b></dt>
     * <dt>5</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The maximum possible value for the <b>NET_IF_ACCESS_TYPE</b> enumeration type. This is not a legal value for <i>AccessType</i> member.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    AccessType {
        get => NumGet(this, 1148, "int")
        set => NumPut("int", value, this, 1148)
    }

    /**
     * Type: <b>NET_IF_DIRECTION_TYPE</b>
     * 
     * The interface direction type. This member can be one of the values from the <b>NET_IF_DIRECTION_TYPE</b> enumeration type defined in the <i>Ifdef.h</i> header file. 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NET_IF_DIRECTION_SENDRECEIVE"></a><a id="net_if_direction_sendreceive"></a><dl>
     * <dt><b>NET_IF_DIRECTION_SENDRECEIVE</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The send and receive  direction type. This direction type indicates that the NDIS network interface can send and receive data. 
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NET_IF_DIRECTION_SENDONLY"></a><a id="net_if_direction_sendonly"></a><dl>
     * <dt><b>NET_IF_DIRECTION_SENDONLY</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The send only direction type. This direction type indicates that the NDIS network interface can only send data. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NET_IF_DIRECTION_RECEIVEONLY"></a><a id="net_if_direction_receiveonly"></a><dl>
     * <dt><b>NET_IF_DIRECTION_RECEIVEONLY</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The receive only direction type. This direction type indicates that the NDIS network interface can only receive data.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NET_IF_DIRECTION_MAXIMUM"></a><a id="net_if_direction_maximum"></a><dl>
     * <dt><b>NET_IF_DIRECTION_MAXIMUM</b></dt>
     * <dt>3</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The maximum possible value for the <b>NET_IF_DIRECTION_TYPE</b> enumeration type. This is not a legal value for <i>DirectionType</i> member.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    DirectionType {
        get => NumGet(this, 1152, "int")
        set => NumPut("int", value, this, 1152)
    }

    /**
     * A set of flags that provide information about the interface. These flags are combined with a bitwise OR operation. If none of the flags applies, then this member is set to zero.
     * @type {_InterfaceAndOperStatusFlags}
     */
    InterfaceAndOperStatusFlags{
        get {
            if(!this.HasProp("__InterfaceAndOperStatusFlags"))
                this.__InterfaceAndOperStatusFlags := %this.__Class%._InterfaceAndOperStatusFlags(1156, this)
            return this.__InterfaceAndOperStatusFlags
        }
    }

    /**
     * Type: <b>IF_OPER_STATUS</b>
     * 
     * The operational status for the interface as defined in RFC 2863 as  IfOperStatus.  For more information, see <a href="https://www.ietf.org/rfc/rfc2863.txt">http://www.ietf.org/rfc/rfc2863.txt</a>. This member can be one of the values from the <b>IF_OPER_STATUS</b> enumeration type defined in the <i>Ifdef.h</i> header file.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IfOperStatusUp"></a><a id="ifoperstatusup"></a><a id="IFOPERSTATUSUP"></a><dl>
     * <dt><b>IfOperStatusUp</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The interface is up and able to pass packets.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IfOperStatusDown"></a><a id="ifoperstatusdown"></a><a id="IFOPERSTATUSDOWN"></a><dl>
     * <dt><b>IfOperStatusDown</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The interface is down and not in a condition to pass packets. The <b>IfOperStatusDown</b> state has two meanings, depending on the
     *    value of <b>AdminStatus</b> member.
     * 
     *    If <b>AdminStatus</b> is not set to <b>NET_IF_ADMIN_STATUS_DOWN</b> and <b>ifOperStatus</b> is set to <b>IfOperStatusDown</b> then a
     *          fault condition is presumed to exist on the interface.
     * 
     *    If <b>AdminStatus</b> is set to <b>IfOperStatusDown</b>, then <b>ifOperStatus</b> will normally also
     *          be set to <b>IfOperStatusDown</b> or <b>IfOperStatusNotPresent</b> and there is not necessarily a
     *          fault condition on the interface.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IfOperStatusTesting"></a><a id="ifoperstatustesting"></a><a id="IFOPERSTATUSTESTING"></a><dl>
     * <dt><b>IfOperStatusTesting</b></dt>
     * <dt>3</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The interface is in testing mode.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IfOperStatusUnknown"></a><a id="ifoperstatusunknown"></a><a id="IFOPERSTATUSUNKNOWN"></a><dl>
     * <dt><b>IfOperStatusUnknown</b></dt>
     * <dt>4</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operational status of the interface is unknown.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IfOperStatusDormant"></a><a id="ifoperstatusdormant"></a><a id="IFOPERSTATUSDORMANT"></a><dl>
     * <dt><b>IfOperStatusDormant</b></dt>
     * <dt>5</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The interface is not
     *    actually in a condition to pass packets (it is not up), but is
     *    in a pending state, waiting for some external event.  For on-demand interfaces, this new state identifies the situation where the
     *    interface is waiting for events to place it in the <b>IfOperStatusUp</b> state.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IfOperStatusNotPresent"></a><a id="ifoperstatusnotpresent"></a><a id="IFOPERSTATUSNOTPRESENT"></a><dl>
     * <dt><b>IfOperStatusNotPresent</b></dt>
     * <dt>6</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A refinement on the <b>IfOperStatusDown</b> state which
     *    indicates that the relevant interface is down specifically because
     *    some component (typically, a hardware device) is not present in
     *    the managed system.  
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IfOperStatusLowerLayerDown"></a><a id="ifoperstatuslowerlayerdown"></a><a id="IFOPERSTATUSLOWERLAYERDOWN"></a><dl>
     * <dt><b>IfOperStatusLowerLayerDown</b></dt>
     * <dt>7</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A refinement on the <b>IfOperStatusDown</b> state.
     *    This new state indicates that this interface runs on top of one or
     *    more other interfaces and that this interface is
     *    down specifically because one or more of these lower-layer interfaces
     *    are down.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    OperStatus {
        get => NumGet(this, 1160, "int")
        set => NumPut("int", value, this, 1160)
    }

    /**
     * Type: <b>NET_IF_ADMIN_STATUS</b>
     * 
     * The administrative status for the interface as defined in RFC 2863. For more information, see <a href="https://www.ietf.org/rfc/rfc2863.txt">http://www.ietf.org/rfc/rfc2863.txt</a>. This member can be one of the values from the <b>NET_IF_ADMIN_STATUS</b> enumeration type defined in the <i>Ifdef.h</i> header file.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NET_IF_ADMIN_STATUS_UP"></a><a id="net_if_admin_status_up"></a><dl>
     * <dt><b>NET_IF_ADMIN_STATUS_UP</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The interface is initialized and enabled. But the interface is not necessarily ready to transmit and receive network data because that depends on the operational status of the interface. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NET_IF_ADMIN_STATUS_DOWN"></a><a id="net_if_admin_status_down"></a><dl>
     * <dt><b>NET_IF_ADMIN_STATUS_DOWN</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The interface is down, and this interface cannot be used to transmit or receive network data. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NET_IF_ADMIN_STATUS_TESTING"></a><a id="net_if_admin_status_testing"></a><dl>
     * <dt><b>NET_IF_ADMIN_STATUS_TESTING</b></dt>
     * <dt>3</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The interface is in a test mode, and no network data can be transmitted or received.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    AdminStatus {
        get => NumGet(this, 1164, "int")
        set => NumPut("int", value, this, 1164)
    }

    /**
     * Type: <b>NET_IF_MEDIA_CONNECT_STATE</b>
     * 
     * The connection state of the interface. This member can be one of the values from the <b>NET_IF_MEDIA_CONNECT_STATE</b> enumeration type defined in the <i>Ifdef.h</i> header file.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MediaConnectStateUnknown"></a><a id="mediaconnectstateunknown"></a><a id="MEDIACONNECTSTATEUNKNOWN"></a><dl>
     * <dt><b>MediaConnectStateUnknown</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The connection state of the interface is unknown. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MediaConnectStateConnected"></a><a id="mediaconnectstateconnected"></a><a id="MEDIACONNECTSTATECONNECTED"></a><dl>
     * <dt><b>MediaConnectStateConnected</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The interface is connected to the network. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MediaConnectStateDisconnected"></a><a id="mediaconnectstatedisconnected"></a><a id="MEDIACONNECTSTATEDISCONNECTED"></a><dl>
     * <dt><b>MediaConnectStateDisconnected</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The interface is not connected to the network. 
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    MediaConnectState {
        get => NumGet(this, 1168, "int")
        set => NumPut("int", value, this, 1168)
    }

    /**
     * Type: <b>NET_IF_NETWORK_GUID</b>
     * 
     * The GUID that is associated with the network that the interface belongs to.
     * @type {Pointer<Guid>}
     */
    NetworkGuid {
        get => NumGet(this, 1176, "ptr")
        set => NumPut("ptr", value, this, 1176)
    }

    /**
     * Type: <b>NET_IF_CONNECTION_TYPE</b>
     * 
     * The NDIS network interface connection type. This member can be one of the values from the <b>NET_IF_CONNECTION_TYPE</b> enumeration type defined in the <i>Ifdef.h</i> header file.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NET_IF_CONNECTION_DEDICATED"></a><a id="net_if_connection_dedicated"></a><dl>
     * <dt><b>NET_IF_CONNECTION_DEDICATED</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The connection type is dedicated. The connection comes up automatically when media sense is TRUE. For example, an Ethernet connection is dedicated.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NET_IF_CONNECTION_PASSIVE"></a><a id="net_if_connection_passive"></a><dl>
     * <dt><b>NET_IF_CONNECTION_PASSIVE</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The connection type is passive. The remote end must bring up the connection to the local station. For example, a RAS interface is passive. 
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NET_IF_CONNECTION_DEMAND"></a><a id="net_if_connection_demand"></a><dl>
     * <dt><b>NET_IF_CONNECTION_DEMAND</b></dt>
     * <dt>3</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The connection type is demand-dial. A connection of this type comes up in response to a local action (sending a packet, for example). 
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NET_IF_CONNECTION_MAXIMUM"></a><a id="net_if_connection_maximum"></a><dl>
     * <dt><b>NET_IF_CONNECTION_MAXIMUM</b></dt>
     * <dt>4</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The maximum possible value for the <b>NET_IF_CONNECTION_TYPE</b> enumeration type. This is not a legal value for <b>ConnectionType</b> member.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    ConnectionType {
        get => NumGet(this, 1184, "int")
        set => NumPut("int", value, this, 1184)
    }

    /**
     * Type: <b>ULONG64</b>
     * 
     * The speed in bits per second of the transmit link.
     * @type {Integer}
     */
    TransmitLinkSpeed {
        get => NumGet(this, 1192, "uint")
        set => NumPut("uint", value, this, 1192)
    }

    /**
     * Type: <b>ULONG64</b>
     * 
     * The speed in bits per second of the receive link.
     * @type {Integer}
     */
    ReceiveLinkSpeed {
        get => NumGet(this, 1200, "uint")
        set => NumPut("uint", value, this, 1200)
    }

    /**
     * Type: <b>ULONG64</b>
     * 
     * The number of octets of data received without errors through this interface. This value includes octets in unicast, broadcast, and multicast packets.
     * @type {Integer}
     */
    InOctets {
        get => NumGet(this, 1208, "uint")
        set => NumPut("uint", value, this, 1208)
    }

    /**
     * Type: <b>ULONG64</b>
     * 
     * The number of unicast packets received without errors through this interface.
     * @type {Integer}
     */
    InUcastPkts {
        get => NumGet(this, 1216, "uint")
        set => NumPut("uint", value, this, 1216)
    }

    /**
     * Type: <b>ULONG64</b>
     * 
     * The number of non-unicast packets received without errors through this interface. This value includes broadcast and multicast packets.
     * @type {Integer}
     */
    InNUcastPkts {
        get => NumGet(this, 1224, "uint")
        set => NumPut("uint", value, this, 1224)
    }

    /**
     * Type: <b>ULONG64</b>
     * 
     * The number of inbound packets which were chosen to be discarded even though no errors were detected to prevent the packets from being deliverable to a higher-layer protocol.
     * @type {Integer}
     */
    InDiscards {
        get => NumGet(this, 1232, "uint")
        set => NumPut("uint", value, this, 1232)
    }

    /**
     * Type: <b>ULONG64</b>
     * 
     * The number of incoming packets that were discarded because of errors.
     * @type {Integer}
     */
    InErrors {
        get => NumGet(this, 1240, "uint")
        set => NumPut("uint", value, this, 1240)
    }

    /**
     * Type: <b>ULONG64</b>
     * 
     * The number of incoming packets that were discarded because the protocol was unknown.
     * @type {Integer}
     */
    InUnknownProtos {
        get => NumGet(this, 1248, "uint")
        set => NumPut("uint", value, this, 1248)
    }

    /**
     * Type: <b>ULONG64</b>
     * 
     * The number of octets of data received without errors in unicast packets through this interface.
     * @type {Integer}
     */
    InUcastOctets {
        get => NumGet(this, 1256, "uint")
        set => NumPut("uint", value, this, 1256)
    }

    /**
     * Type: <b>ULONG64</b>
     * 
     * The number of octets of data received without errors in multicast packets through this interface.
     * @type {Integer}
     */
    InMulticastOctets {
        get => NumGet(this, 1264, "uint")
        set => NumPut("uint", value, this, 1264)
    }

    /**
     * Type: <b>ULONG64</b>
     * 
     * The number of octets of data received without errors in broadcast packets through this interface.
     * @type {Integer}
     */
    InBroadcastOctets {
        get => NumGet(this, 1272, "uint")
        set => NumPut("uint", value, this, 1272)
    }

    /**
     * Type: <b>ULONG64</b>
     * 
     * The number of octets of data transmitted without errors through this interface. This value includes octets in unicast, broadcast, and multicast packets.
     * @type {Integer}
     */
    OutOctets {
        get => NumGet(this, 1280, "uint")
        set => NumPut("uint", value, this, 1280)
    }

    /**
     * Type: <b>ULONG64</b>
     * 
     * The number of unicast packets transmitted without errors through this interface.
     * @type {Integer}
     */
    OutUcastPkts {
        get => NumGet(this, 1288, "uint")
        set => NumPut("uint", value, this, 1288)
    }

    /**
     * Type: <b>ULONG64</b>
     * 
     * The number of non-unicast packets transmitted without errors through this interface. This value includes broadcast and multicast packets.
     * @type {Integer}
     */
    OutNUcastPkts {
        get => NumGet(this, 1296, "uint")
        set => NumPut("uint", value, this, 1296)
    }

    /**
     * Type: <b>ULONG64</b>
     * 
     * The number of outgoing packets that were discarded even though they did not have errors.
     * @type {Integer}
     */
    OutDiscards {
        get => NumGet(this, 1304, "uint")
        set => NumPut("uint", value, this, 1304)
    }

    /**
     * Type: <b>ULONG64</b>
     * 
     * The number of outgoing packets that were discarded because of errors.
     * @type {Integer}
     */
    OutErrors {
        get => NumGet(this, 1312, "uint")
        set => NumPut("uint", value, this, 1312)
    }

    /**
     * Type: <b>ULONG64</b>
     * 
     * The number of octets of data transmitted without errors  in unicast packets through this interface.
     * @type {Integer}
     */
    OutUcastOctets {
        get => NumGet(this, 1320, "uint")
        set => NumPut("uint", value, this, 1320)
    }

    /**
     * Type: <b>ULONG64</b>
     * 
     * The number of octets of data transmitted without errors in multicast packets through this interface.
     * @type {Integer}
     */
    OutMulticastOctets {
        get => NumGet(this, 1328, "uint")
        set => NumPut("uint", value, this, 1328)
    }

    /**
     * Type: <b>ULONG64</b>
     * 
     * The number of octets of data transmitted without errors in broadcast packets through this interface.
     * @type {Integer}
     */
    OutBroadcastOctets {
        get => NumGet(this, 1336, "uint")
        set => NumPut("uint", value, this, 1336)
    }

    /**
     * Type: <b>ULONG64</b>
     * 
     * The transmit queue length. This field is not currently used.
     * @type {Integer}
     */
    OutQLen {
        get => NumGet(this, 1344, "uint")
        set => NumPut("uint", value, this, 1344)
    }
}
