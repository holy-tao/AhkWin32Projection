#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\MIB_IPNETROW_LH.ahk

/**
 * Contains a table of Address Resolution Protocol (ARP) entries for IPv4 addresses.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getipnettable">GetIpNetTable</a> function retrieves the IPv4-to-physical address mapping table.
  * 
  * 
  * on a local system and returns this information in a <b>MIB_IPNETTABLE</b> structure. 
  * 
  * 
  * 
  * The <b>dwNumEntries</b> member in this structure may be zero if there are no ARP entries in the table.
  * 
  * The <b>MIB_IPNETTABLE</b> structure may contain padding for alignment between the <b>dwNumEntries</b> member and the first <a href="https://docs.microsoft.com/windows/desktop/api/ipmib/ns-ipmib-mib_ipnetrow_lh">MIB_IPNETROW</a> array entry in the <b>table</b> member. Padding for alignment may also be present between the <b>MIB_IPNETROW</b> array entries in the <b>table</b> member. Any access to a <b>MIB_IPNETROW</b> array entry should assume  padding may exist. 
  * 
  * 
  * 
  * On the Microsoft Windows Software Development Kit (SDK) released for Windows Vista and later, the organization of header files has changed and the <b>MIB_IPNETTABLE</b> structure is defined in the <i>Ipmib.h</i> header file not in the <i>Iprtrmib.h</i> header file. Note that the <i>Ipmib.h</i> header file is automatically included in <i>Iprtrmib.h</i> which is automatically included in the <i>Iphlpapi.h</i> header file. The  <i>Ipmib.h</i> and <i>Iprtrmib.h</i> header files should never be used directly.
 * @see https://learn.microsoft.com/windows/win32/api/ipmib/ns-ipmib-mib_ipnettable
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class MIB_IPNETTABLE extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The number of ARP entries in the table.
     * @type {Integer}
     */
    dwNumEntries {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A pointer to a table of ARP entries implemented as an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ipmib/ns-ipmib-mib_ipnetrow_lh">MIB_IPNETROW</a> structures.
     * @type {Array<MIB_IPNETROW_LH>}
     */
    table{
        get {
            if(!this.HasProp("__tableProxyArray"))
                this.__tableProxyArray := Win32FixedArray(this.ptr + 8, 8, MIB_IPNETROW_LH, "")
            return this.__tableProxyArray
        }
    }
}
