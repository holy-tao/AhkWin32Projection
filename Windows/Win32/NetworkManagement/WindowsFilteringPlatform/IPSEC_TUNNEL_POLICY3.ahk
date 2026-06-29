#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IPSEC_TUNNEL_ENDPOINT0.ahk" { IPSEC_TUNNEL_ENDPOINT0 }
#Import ".\IKEEXT_EM_POLICY2.ahk" { IKEEXT_EM_POLICY2 }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IPSEC_TRAFFIC_SELECTOR_POLICY0.ahk" { IPSEC_TRAFFIC_SELECTOR_POLICY0 }
#Import ".\IPSEC_TUNNEL_ENDPOINTS2.ahk" { IPSEC_TUNNEL_ENDPOINTS2 }
#Import ".\IPSEC_SA_IDLE_TIMEOUT0.ahk" { IPSEC_SA_IDLE_TIMEOUT0 }
#Import ".\FWP_IP_VERSION.ahk" { FWP_IP_VERSION }
#Import ".\IPSEC_PROPOSAL0.ahk" { IPSEC_PROPOSAL0 }

/**
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct IPSEC_TUNNEL_POLICY3 {
    #StructPack 8

    flags : UInt32

    numIpsecProposals : UInt32

    ipsecProposals : IPSEC_PROPOSAL0.Ptr

    tunnelEndpoints : IPSEC_TUNNEL_ENDPOINTS2

    saIdleTimeout : IPSEC_SA_IDLE_TIMEOUT0

    emPolicy : IKEEXT_EM_POLICY2.Ptr

    fwdPathSaLifetime : UInt32

    compartmentId : UInt32

    numTrafficSelectorPolicy : UInt32

    trafficSelectorPolicies : IPSEC_TRAFFIC_SELECTOR_POLICY0.Ptr

}
