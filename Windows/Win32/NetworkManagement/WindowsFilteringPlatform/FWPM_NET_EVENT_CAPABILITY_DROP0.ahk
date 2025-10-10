#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about network traffic dropped in relation to an app container network capability.
 * @see https://docs.microsoft.com/windows/win32/api//fwpmtypes/ns-fwpmtypes-fwpm_net_event_capability_drop0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class FWPM_NET_EVENT_CAPABILITY_DROP0 extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/fwpmtypes/ne-fwpmtypes-fwpm_appc_network_capability_type">FWPM_APPC_NETWORK_CAPABILITY_TYPE</a></b>
     * 
     * The specific app container network capability which was missing, therefore causing this traffic to be denied.
     * @type {Integer}
     */
    networkCapabilityId {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: <b>UINT64</b>
     * 
     * A LUID identifying the WFP filter where the traffic drop occurred.
     * @type {Integer}
     */
    filterId {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * True if the packet originated from (or was heading to) the loopback adapter; otherwise, false.
     * @type {Integer}
     */
    isLoopback {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }
}
