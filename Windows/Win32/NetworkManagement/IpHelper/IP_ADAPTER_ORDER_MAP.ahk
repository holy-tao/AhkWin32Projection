#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The IP_ADAPTER_ORDER_MAP structure stores an array of information about adapters and their relative priority on the local computer.
 * @remarks
 * This structure is returned by the GetAdapterOrderMap function, and is used as a tie breaker for otherwise equal interfaces during network operations. The GetAdapterOrderMap function should not be called directly; use the GetAdaptersInfo function instead.
 * 
 * The <b>IP_ADAPTER_ORDER_MAP</b> structure contains at least one <b>AdapterOrder</b> member even if the <b>NumAdapters</b> member of the <b>IP_ADAPTER_ORDER_MAP</b> structure indicates no network adapters. When the <b>NumAdapters</b> member of the <b>IP_ADAPTER_ORDER_MAP</b> structure is zero, the value of the single  <b>AdapterOrder</b> member is undefined. 
 * 
 * This structure is defined in the <i>Ipexport.h</i> header file which is automatically included in the <i>Iphlpapi.h</i> header file. The <i>Ipexport.h</i> header file should never be used directly.
 * @see https://learn.microsoft.com/windows/win32/api/ipexport/ns-ipexport-ip_adapter_order_map
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 */
export default struct IP_ADAPTER_ORDER_MAP {
    #StructPack 4

    /**
     * The number of network adapters in the <b>AdapterOrder</b> member.
     */
    NumAdapters : UInt32

    /**
     * An array of adapter indexes  on the local computer, provided in the order specified in the <b>Adapters and Bindings</b> dialog box for <b>Network Connections</b>.
     */
    AdapterOrder : UInt32[1]

}
