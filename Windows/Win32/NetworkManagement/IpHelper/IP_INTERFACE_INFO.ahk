#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\IP_ADAPTER_INDEX_MAP.ahk

/**
 * The IP_INTERFACE_INFO structure contains a list of the network interface adapters with IPv4 enabled on the local system.
 * @remarks
 * The 
 * <b>IP_INTERFACE_INFO</b> structure is specific to network adapters with IPv4 enabled. The <b>IP_INTERFACE_INFO</b> structure contains the number of network adapters with IPv4 enabled on the local system and an array of <a href="https://docs.microsoft.com/windows/desktop/api/ipexport/ns-ipexport-ip_adapter_index_map">IP_ADAPTER_INDEX_MAP</a> structures with information on each network adapter with IPv4 enabled. The <b>IP_INTERFACE_INFO</b> structure contains at least one <b>IP_ADAPTER_INDEX_MAP</b> structure even if the <b>NumAdapters</b> member of the <b>IP_INTERFACE_INFO</b> structure indicates that no network adapters with IPv4 are enabled. When the <b>NumAdapters</b> member of the <b>IP_INTERFACE_INFO</b> structure is zero, the value of the members of the single  <b>IP_ADAPTER_INDEX_MAP</b> structure returned in the <b>IP_INTERFACE_INFO</b> structure is undefined. 
 * 
 * The 
 * <b>IP_INTERFACE_INFO</b> structure can't be used to return information about the loopback interface.
 * 
 * On Windows Vista and later, the <b>Name</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/ipexport/ns-ipexport-ip_adapter_index_map">IP_ADAPTER_INDEX_MAP</a> structure in the <b>IP_INTERFACE_INFO</b> structure may be a Unicode string of the GUID for the network interface (the string begins with the '{' character). 
 * 
 * This structure is defined in the <i>Ipexport.h</i> header file which is automatically included in the <i>Iphlpapi.h</i> header file. The <i>Ipexport.h</i> header file should never be used directly.
 * @see https://learn.microsoft.com/windows/win32/api/ipexport/ns-ipexport-ip_interface_info
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class IP_INTERFACE_INFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The number of adapters listed in the array pointed to by the <b>Adapter</b> member.
     * @type {Integer}
     */
    NumAdapters {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * An array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ipexport/ns-ipexport-ip_adapter_index_map">IP_ADAPTER_INDEX_MAP</a> structures. Each structure maps an adapter index to that adapter's name.  The adapter index  may change when an adapter is disabled and then enabled, or under other circumstances, and should not be considered persistent.
     * @type {Array<IP_ADAPTER_INDEX_MAP>}
     */
    Adapter{
        get {
            if(!this.HasProp("__AdapterProxyArray"))
                this.__AdapterProxyArray := Win32FixedArray(this.ptr + 8, 1, IP_ADAPTER_INDEX_MAP, "")
            return this.__AdapterProxyArray
        }
    }
}
