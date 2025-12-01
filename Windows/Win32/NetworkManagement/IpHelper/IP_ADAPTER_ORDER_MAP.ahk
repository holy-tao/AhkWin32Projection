#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

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
 * @version v4.0.30319
 */
class IP_ADAPTER_ORDER_MAP extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The number of network adapters in the <b>AdapterOrder</b> member.
     * @type {Integer}
     */
    NumAdapters {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * An array of adapter indexes  on the local computer, provided in the order specified in the <b>Adapters and Bindings</b> dialog box for <b>Network Connections</b>.
     * @type {Array<UInt32>}
     */
    AdapterOrder{
        get {
            if(!this.HasProp("__AdapterOrderProxyArray"))
                this.__AdapterOrderProxyArray := Win32FixedArray(this.ptr + 4, 1, Primitive, "uint")
            return this.__AdapterOrderProxyArray
        }
    }
}
