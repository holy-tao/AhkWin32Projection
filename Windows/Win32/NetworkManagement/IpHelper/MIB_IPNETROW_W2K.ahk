#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * MIB_IPNETROW_W2K (ipmib.h) contains information for an Address Resolution Protocol (ARP) table entry for an IPv4 address.
 * @remarks
 * On the Windows SDK released for Windows Vista and later, the organization of header files has changed and the <b>MIB_IPNETROW</b> structure is defined in the <i>Ipmib.h</i> header file not in the <i>Iprtrmib.h</i> header file. Note that the <i>Ipmib.h</i> header file is automatically included in <i>Iprtrmib.h</i> which is automatically included in the <i>Iphlpapi.h</i> header file. The  <i>Ipmib.h</i> and <i>Iprtrmib.h</i> header files should never be used directly.
 * @see https://learn.microsoft.com/windows/win32/api/ipmib/ns-ipmib-mib_ipnetrow_w2k
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class MIB_IPNETROW_W2K extends Win32Struct
{
    static sizeof => 24

    static packingSize => 4

    /**
     * Type: <b>DWORD</b>
     * 
     * The index of the adapter.
     * @type {Integer}
     */
    dwIndex {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The length, in bytes, of the physical address.
     * @type {Integer}
     */
    dwPhysAddrLen {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b>BYTE[MAXLEN_PHYSADDR]</b>
     * 
     * The physical address.
     * @type {Array<Byte>}
     */
    bPhysAddr{
        get {
            if(!this.HasProp("__bPhysAddrProxyArray"))
                this.__bPhysAddrProxyArray := Win32FixedArray(this.ptr + 8, 1, Primitive, "char")
            return this.__bPhysAddrProxyArray
        }
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The IPv4 address.
     * @type {Integer}
     */
    dwAddr {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The type of ARP entry. 
     * 
     * This member can be one of the values from the <b>MIB_IPNET_TYPE</b> enumeration type defined in the <i>Ipmib.h</i> header file included in the Windows SDK released for Windows Vista and later. For use with versions of the earlier Platform SDK, this enumeration is not defined and the constants must be used. 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MIB_IPNET_TYPE_OTHER"></a><a id="mib_ipnet_type_other"></a><dl>
     * <dt><b>MIB_IPNET_TYPE_OTHER</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Other
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MIB_IPNET_TYPE_INVALID"></a><a id="mib_ipnet_type_invalid"></a><dl>
     * <dt><b>MIB_IPNET_TYPE_INVALID</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An invalid ARP type. This can indicate an unreachable or incomplete ARP entry.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MIB_IPNET_TYPE_DYNAMIC"></a><a id="mib_ipnet_type_dynamic"></a><dl>
     * <dt><b>MIB_IPNET_TYPE_DYNAMIC</b></dt>
     * <dt>3</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A dynamic ARP type.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MIB_IPNET_TYPE_STATIC"></a><a id="mib_ipnet_type_static"></a><dl>
     * <dt><b>MIB_IPNET_TYPE_STATIC</b></dt>
     * <dt>4</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A static ARP type.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwType {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}
