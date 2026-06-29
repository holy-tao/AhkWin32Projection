#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FWPM_APPC_NETWORK_CAPABILITY_TYPE.ahk" { FWPM_APPC_NETWORK_CAPABILITY_TYPE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Contains information about network traffic allowed in relation to an app container network capability.
 * @see https://learn.microsoft.com/windows/win32/api/fwpmtypes/ns-fwpmtypes-fwpm_net_event_capability_allow0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct FWPM_NET_EVENT_CAPABILITY_ALLOW0 {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/fwpmtypes/ne-fwpmtypes-fwpm_appc_network_capability_type">FWPM_APPC_NETWORK_CAPABILITY_TYPE</a></b>
     * 
     * The specific app container network capability allowing this traffic.
     */
    networkCapabilityId : FWPM_APPC_NETWORK_CAPABILITY_TYPE

    /**
     * Type: <b>UINT64</b>
     * 
     * A LUID identifying the WFP filter enforcing the allowed access intended by the capability in <b>networkCapabilityId</b>.
     */
    filterId : Int64

    /**
     * Type: <b>BOOL</b>
     * 
     * True if the packet originated from (or was heading to) the loopback adapter; otherwise, false.
     */
    isLoopback : BOOL

}
