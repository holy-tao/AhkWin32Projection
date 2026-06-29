#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * MIB_IPMCAST_OIF_XP (ipmib.h) stores the information required to send an outgoing IP multicast packet.
 * @remarks
 * The <b>MIB_IPMCAST_MFE</b> structure is used by the <a href="https://docs.microsoft.com/windows/desktop/RRAS/multicast-group-manager-functions">Multicast Group Manager functions</a>. The <b>MIB_IPMCAST_OIF</b> structure is retrieved as a member of the <b>MIB_IPMCAST_MFE</b> structure  using the <a href="https://docs.microsoft.com/windows/desktop/api/mgm/nf-mgm-mgmgetmfe">MgmGetMfe</a> function.
 * 
 * On the Microsoft Windows Software Development Kit (SDK) released for Windows Server 2008and later, the organization of header files has changed. This  structure is defined in the <i>Ipmib.h</i> header file, not in the <i>Iprtrmib.h</i> header file. Note that the <i>Ipmib.h</i> header file is automatically included in <i>Iprtrmib.h</i>, which is automatically included in the <i>Iphlpapi.h</i> header file. The  <i>Ipmib.h</i> and <i>Iprtrmib.h</i> header files should never be used directly.
 * @see https://learn.microsoft.com/windows/win32/api/ipmib/ns-ipmib-mib_ipmcast_oif_xp
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 */
export default struct MIB_IPMCAST_OIF_XP {
    #StructPack 4

    /**
     * The index of the interface on which to send the outgoing IP multicast packet.
     */
    dwOutIfIndex : UInt32

    /**
     * The destination address for the outgoing IPv4 multicast packet.
     */
    dwNextHopAddr : UInt32

    /**
     * Reserved. This member should be zero.
     */
    dwReserved : UInt32

    /**
     * Reserved. This member should be zero.
     */
    dwReserved1 : UInt32

}
