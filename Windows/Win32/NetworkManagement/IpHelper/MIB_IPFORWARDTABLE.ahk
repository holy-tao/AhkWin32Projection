#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\MIB_IPFORWARDROW.ahk

/**
 * Contains a table of IPv4 route entries.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getipforwardtable">GetIpForwardTable</a> function enumerates the IPv4 route entries on a local system and returns this information in a <b>MIB_IPFORWARDTABLE</b> structure. 
  * 
  * 
  * 
  * The <b>MIB_IPFORWARDTABLE</b> structure may contain padding for alignment between the <b>dwNumEntries</b> member and the first <a href="https://docs.microsoft.com/windows/desktop/api/ipmib/ns-ipmib-mib_ipforwardrow">MIB_IPFORWARDROW</a> array entry in the <b>table</b> member. Padding for alignment may also be present between the <b>MIB_IPFORWARDROW</b> array entries in the <b>table</b> member. Any access to a <b>MIB_IPFORWARDROW</b> array entry should assume  padding may exist. 
  * 
  * 
  * 
  * On the Microsoft Windows Software Development Kit (SDK) released for Windows Vista and later, the organization of header files has changed. This  structure is defined in the <i>Ipmib.h</i> header file, not in the <i>Iprtrmib.h</i> header file. Note that the <i>Ipmib.h</i> header file is automatically included in <i>Iprtrmib.h</i>, which is automatically included in the <i>Iphlpapi.h</i> header file. The  <i>Ipmib.h</i> and <i>Iprtrmib.h</i> header files should never be used directly.
 * @see https://learn.microsoft.com/windows/win32/api/ipmib/ns-ipmib-mib_ipforwardtable
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class MIB_IPFORWARDTABLE extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The number of route entries in the table.
     * @type {Integer}
     */
    dwNumEntries {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A pointer to a table of route entries implemented as an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ipmib/ns-ipmib-mib_ipforwardrow">MIB_IPFORWARDROW</a> structures.
     * @type {Array<MIB_IPFORWARDROW>}
     */
    table{
        get {
            if(!this.HasProp("__tableProxyArray"))
                this.__tableProxyArray := Win32FixedArray(this.ptr + 8, 1, MIB_IPFORWARDROW, "")
            return this.__tableProxyArray
        }
    }
}
