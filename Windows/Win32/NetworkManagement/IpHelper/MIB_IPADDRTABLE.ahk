#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\MIB_IPADDRROW_XP.ahk

/**
 * Contains a table of IPv4 address entries.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getipaddrtable">GetIpAddrTable</a> function retrieves the interface–to–IPv4 address mapping table on a local computer and returns this information in an <b>MIB_IPADDRTABLE</b> structure.
  * 
  * The <b>MIB_IPADDRTABLE</b> structure may contain padding for alignment between the <b>dwNumEntries</b> member and the first <a href="https://docs.microsoft.com/windows/desktop/api/ipmib/ns-ipmib-mib_ipaddrrow_w2k">MIB_IPADDRROW</a> array entry in the <b>table</b> member. Padding for alignment may also be present between the <b>MIB_IPADDRROW</b> array entries in the <b>table</b> member. Any access to a <b>MIB_IPADDRROW</b> array entry should assume  padding may exist. 
  * 
  * 
  * 
  * On the Microsoft Windows Software Development Kit (SDK) released for Windows Vista and later, the organization of header files has changed and the <a href="https://docs.microsoft.com/windows/desktop/api/ipmib/ns-ipmib-mib_ipaddrrow_w2k">MIB_IPADDRROW</a> is defined in the <i>Ipmib.h</i> header file not in the <i>Iprtrmib.h</i> header file. Note that the <i>Ipmib.h</i> header file is automatically included in <i>Iprtrmib.h</i> which is automatically included in the <i>Iphlpapi.h</i> header file. The <i>Ipmib.h</i> and <i>Iprtrmib.h</i> header files should never be used directly.
 * @see https://learn.microsoft.com/windows/win32/api/ipmib/ns-ipmib-mib_ipaddrtable
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class MIB_IPADDRTABLE extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The number of IPv4 address entries in the table.
     * @type {Integer}
     */
    dwNumEntries {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A pointer to a table of IPv4 address entries implemented as an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ipmib/ns-ipmib-mib_ipaddrrow_w2k">MIB_IPADDRROW</a> structures.
     * @type {Array<MIB_IPADDRROW_XP>}
     */
    table{
        get {
            if(!this.HasProp("__tableProxyArray"))
                this.__tableProxyArray := Win32FixedArray(this.ptr + 8, 8, MIB_IPADDRROW_XP, "")
            return this.__tableProxyArray
        }
    }
}
