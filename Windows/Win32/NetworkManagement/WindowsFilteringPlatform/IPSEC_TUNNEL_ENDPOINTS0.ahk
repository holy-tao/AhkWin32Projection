#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FWP_IP_VERSION.ahk" { FWP_IP_VERSION }

/**
 * Is used to store end points of a tunnel mode SA. (IPSEC_TUNNEL_ENDPOINTS0)
 * @remarks
 * For the unnamed union containing the local tunnel end point address, switch_type(FWP_IP_VERSION), switch_is(ipVersion).
 * @see https://learn.microsoft.com/windows/win32/api/ipsectypes/ns-ipsectypes-ipsec_tunnel_endpoints0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct IPSEC_TUNNEL_ENDPOINTS0 {
    #StructPack 4

    /**
     * IP version of the addresses.
     * 
     * See [FWP_IP_VERSION](/windows/desktop/api/fwptypes/ne-fwptypes-fwp_ip_version) for more information.
     */
    ipVersion : FWP_IP_VERSION

    localV4Address : UInt32

    remoteV4Address : UInt32

    static __New() {
        DefineProp(this.Prototype, 'localV6Address', { type: Int8[16], offset: 4 })
        DefineProp(this.Prototype, 'remoteV6Address', { type: Int8[16], offset: 20 })
        this.DeleteProp("__New")
    }
}
