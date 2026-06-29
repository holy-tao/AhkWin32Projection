#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MIB_IPMCAST_OIF_XP.ahk" { MIB_IPMCAST_OIF_XP }

/**
 * Stores the information for an Internet Protocol (IP) Multicast Forwarding Entry (MFE).
 * @remarks
 * The 
 * <b>MIB_IPMCAST_MFE</b> structure does not have a fixed size. Use the <b>SIZEOF_MIB_MFE(X)</b> macro to determine the size of this structure. This macro is defined in the Iprtrmib.h header file.
 * 
 * The <b>dwRouteProtocol</b>, <b>dwRouteNetwork</b>, and <b>dwRouteMask</b> members uniquely identify the route to which this MFE is related.
 * 
 * The <b>MIB_IPMCAST_MFE</b> structure is used by the <a href="https://docs.microsoft.com/windows/desktop/RRAS/multicast-group-manager-functions">Multicast Group Manager functions</a>. The <b>MIB_IPMCAST_MFE</b> structure is retrieved using the <a href="https://docs.microsoft.com/windows/desktop/api/mgm/nf-mgm-mgmgetmfe">MgmGetMfe</a> function. An existing <b>MIB_IPMCAST_MFE</b> structure can be modified using the <a href="https://docs.microsoft.com/windows/desktop/api/mgm/nf-mgm-mgmsetmfe">MgmSetMfe</a> function.
 * 
 * On the Microsoft Windows Software Development Kit (SDK) released for Windows Vista and later, the organization of header files has changed. This  structure is defined in the <i>Ipmib.h</i> header file, not in the <i>Iprtrmib.h</i> header file. Note that the <i>Ipmib.h</i> header file is automatically included in <i>Iprtrmib.h</i>, which is automatically included in the <i>Iphlpapi.h</i> header file. The  <i>Ipmib.h</i> and <i>Iprtrmib.h</i> header files should never be used directly.
 * @see https://learn.microsoft.com/windows/win32/api/ipmib/ns-ipmib-mib_ipmcast_mfe
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 */
export default struct MIB_IPMCAST_MFE {
    #StructPack 4

    /**
     * Type: <b>DWORD</b>
     * 
     * The range of IPv4 multicast groups for this MFE. A value of zero indicates a wildcard group.
     */
    dwGroup : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The range of IPv4 source addresses for this MFE. A value of zero indicates a wildcard source.
     */
    dwSource : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The IPv4 subnet mask that corresponds to <b>dwSourceAddr</b>. The <b>dwSourceAddr</b> and <b>dwSourceMask</b> members are used together to define a range of sources.
     */
    dwSrcMask : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The upstream neighbor that is related to this MFE.
     */
    dwUpStrmNgbr : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The index of the interface to which this MFE is related.
     */
    dwInIfIndex : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The routing protocol that owns the incoming interface to which this MFE is related.
     */
    dwInIfProtocol : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The client that created the route.
     */
    dwRouteProtocol : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The IPv4 address associated with the route referred to by <b>dwRouteProtocol</b>.
     */
    dwRouteNetwork : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The IPv4 mask associated with the route referred to by <b>dwRouteProtocol</b>.
     */
    dwRouteMask : UInt32

    /**
     * Type: <b>ULONG</b>
     * 
     * The time, in seconds, this MFE has been valid. This value starts from zero and is incremented until it reaches the <b>ulTimeOut</b> value, at which time the MFE is deleted.
     */
    ulUpTime : UInt32

    /**
     * Type: <b>ULONG</b>
     * 
     * The time, in seconds, that remains before the MFE expires and is deleted. This value starts from <b>ulTimeOut</b> and is decremented until it reaches zero, at which time the MFE is deleted.
     */
    ulExpiryTime : UInt32

    /**
     * Type: <b>ULONG</b>
     * 
     * The total length of time, in seconds, that this MFE should remain valid. After the time-out value is exceeded, the MFE is deleted. This value is static.
     */
    ulTimeOut : UInt32

    /**
     * Type: <b>ULONG</b>
     * 
     * The number of outgoing interfaces that are associated with this MFE.
     */
    ulNumOutIf : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * Reserved. This member should be <b>NULL</b>.
     */
    fFlags : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * Reserved. This member should be <b>NULL</b>.
     */
    dwReserved : UInt32

    /**
     * Type: <b>MIB_IPMCAST_OIF[ANY_SIZE]</b>
     * 
     * A pointer to a table of outgoing interface statistics that are implemented as an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ipmib/ns-ipmib-mib_ipmcast_oif_w2k">MIB_IPMCAST_OIF</a> structures.
     */
    rgmioOutInfo : MIB_IPMCAST_OIF_XP[1]

}
