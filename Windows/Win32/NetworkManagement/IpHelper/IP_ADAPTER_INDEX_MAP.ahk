#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The IP_ADAPTER_INDEX_MAP structure stores the interface index associated with a network adapter with IPv4 enabled together with the name of the network adapter.
 * @remarks
 * 
 * The 
 * <b>IP_ADAPTER_INDEX_MAP</b> structure is specific to network adapters with IPv4 enabled. 
 * 
 * An adapter index  may change when the adapter is disabled and then enabled, or under other circumstances, and should not be considered persistent.
 * 
 * On Windows Vista and later, the <b>Name</b> member of the <b>IP_ADAPTER_INDEX_MAP</b> structure may be a Unicode string of the GUID for the network interface (the string begins with the '{' character). 
 * 
 * This structure is defined in the <i>Ipexport.h</i> header file which is automatically included in the <i>Iphlpapi.h</i> header file. The <i>Ipexport.h</i> header file should never be used directly.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//ipexport/ns-ipexport-ip_adapter_index_map
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class IP_ADAPTER_INDEX_MAP extends Win32Struct
{
    static sizeof => 260

    static packingSize => 4

    /**
     * The interface index associated with the network adapter.
     * @type {Integer}
     */
    Index {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A pointer to a Unicode string that contains the name of the adapter.
     * @type {String}
     */
    Name {
        get => StrGet(this.ptr + 4, 127, "UTF-16")
        set => StrPut(value, this.ptr + 4, 127, "UTF-16")
    }
}
