#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\MIB_IPMCAST_OIF_XP.ahk

/**
 * Stores the information for an Internet Protocol (IP) Multicast Forwarding Entry (MFE).
 * @remarks
 * 
 * The 
 * <b>MIB_IPMCAST_MFE</b> structure does not have a fixed size. Use the <b>SIZEOF_MIB_MFE(X)</b> macro to determine the size of this structure. This macro is defined in the Iprtrmib.h header file.
 * 
 * The <b>dwRouteProtocol</b>, <b>dwRouteNetwork</b>, and <b>dwRouteMask</b> members uniquely identify the route to which this MFE is related.
 * 
 * The <b>MIB_IPMCAST_MFE</b> structure is used by the <a href="https://docs.microsoft.com/windows/desktop/RRAS/multicast-group-manager-functions">Multicast Group Manager functions</a>. The <b>MIB_IPMCAST_MFE</b> structure is retrieved using the <a href="https://docs.microsoft.com/windows/desktop/api/mgm/nf-mgm-mgmgetmfe">MgmGetMfe</a> function. An existing <b>MIB_IPMCAST_MFE</b> structure can be modified using the <a href="https://docs.microsoft.com/windows/desktop/api/mgm/nf-mgm-mgmsetmfe">MgmSetMfe</a>function.
 * 
 * On the Microsoft Windows Software Development Kit (SDK) released for Windows Vistaand later, the organization of header files has changed. This  structure is defined in the <i>Ipmib.h</i> header file, not in the <i>Iprtrmib.h</i> header file. Note that the <i>Ipmib.h</i> header file is automatically included in <i>Iprtrmib.h</i>, which is automatically included in the <i>Iphlpapi.h</i> header file. The  <i>Ipmib.h</i> and <i>Iprtrmib.h</i> header files should never be used directly.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//ipmib/ns-ipmib-mib_ipmcast_mfe
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class MIB_IPMCAST_MFE extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * Type: <b>DWORD</b>
     * 
     * The range of IPv4 multicast groups for this MFE. A value of zero indicates a wildcard group.
     * @type {Integer}
     */
    dwGroup {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The range of IPv4 source addresses for this MFE. A value of zero indicates a wildcard source.
     * @type {Integer}
     */
    dwSource {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The IPv4 subnet mask that corresponds to <b>dwSourceAddr</b>. The <b>dwSourceAddr</b> and <b>dwSourceMask</b> members are used together to define a range of sources.
     * @type {Integer}
     */
    dwSrcMask {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The upstream neighbor that is related to this MFE.
     * @type {Integer}
     */
    dwUpStrmNgbr {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The index of the interface to which this MFE is related.
     * @type {Integer}
     */
    dwInIfIndex {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The routing protocol that owns the incoming interface to which this MFE is related.
     * @type {Integer}
     */
    dwInIfProtocol {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The client that created the route.
     * @type {Integer}
     */
    dwRouteProtocol {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The IPv4 address associated with the route referred to by <b>dwRouteProtocol</b>.
     * @type {Integer}
     */
    dwRouteNetwork {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The IPv4 mask associated with the route referred to by <b>dwRouteProtocol</b>.
     * @type {Integer}
     */
    dwRouteMask {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * The time, in seconds, this MFE has been valid. This value starts from zero and is incremented until it reaches the <b>ulTimeOut</b> value, at which time the MFE is deleted.
     * @type {Integer}
     */
    ulUpTime {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * The time, in seconds, that remains before the MFE expires and is deleted. This value starts from <b>ulTimeOut</b> and is decremented until it reaches zero, at which time the MFE is deleted.
     * @type {Integer}
     */
    ulExpiryTime {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * The total length of time, in seconds, that this MFE should remain valid. After the time-out value is exceeded, the MFE is deleted. This value is static.
     * @type {Integer}
     */
    ulTimeOut {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * The number of outgoing interfaces that are associated with this MFE.
     * @type {Integer}
     */
    ulNumOutIf {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * Reserved. This member should be <b>NULL</b>.
     * @type {Integer}
     */
    fFlags {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * Reserved. This member should be <b>NULL</b>.
     * @type {Integer}
     */
    dwReserved {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * Type: <b>MIB_IPMCAST_OIF[ANY_SIZE]</b>
     * 
     * A pointer to a table of outgoing interface statistics that are implemented as an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ipmib/ns-ipmib-mib_ipmcast_oif_w2k">MIB_IPMCAST_OIF</a> structures.
     * @type {Array<MIB_IPMCAST_OIF_XP>}
     */
    rgmioOutInfo{
        get {
            if(!this.HasProp("__rgmioOutInfoProxyArray"))
                this.__rgmioOutInfoProxyArray := Win32FixedArray(this.ptr + 64, 1, MIB_IPMCAST_OIF_XP, "")
            return this.__rgmioOutInfoProxyArray
        }
    }
}
