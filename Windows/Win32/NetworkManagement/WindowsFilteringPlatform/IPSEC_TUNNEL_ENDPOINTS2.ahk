#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IPSEC_TUNNEL_ENDPOINT0.ahk" { IPSEC_TUNNEL_ENDPOINT0 }
#Import ".\FWP_IP_VERSION.ahk" { FWP_IP_VERSION }

/**
 * Is used to store end points of a tunnel mode SA. (IPSEC_TUNNEL_ENDPOINTS2)
 * @remarks
 * For the unnamed union containing the local tunnel end point address, switch_type(FWP_IP_VERSION), switch_is(ipVersion).
 * @see https://learn.microsoft.com/windows/win32/api/ipsectypes/ns-ipsectypes-ipsec_tunnel_endpoints2
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct IPSEC_TUNNEL_ENDPOINTS2 {
    #StructPack 8

    /**
     * Type: [FWP_IP_VERSION](/windows/desktop/api/fwptypes/ne-fwptypes-fwp_ip_version)</b>
     * 
     * Specifies the IP version. In tunnel mode, this is the version of the outer header.
     */
    ipVersion : FWP_IP_VERSION

    localV4Address : UInt32

    remoteV4Address : UInt32

    /**
     * Type: <b>UINT64</b>
     * 
     * Optional LUID of the local interface corresponding to the local address specified above.
     */
    localIfLuid : Int64

    /**
     * Type: <b>wchar_t*</b>
     * 
     * Configuration of multiple remote addresses and fully qualified domain names  for asymmetric tunneling support.
     */
    remoteFqdn : PWSTR

    /**
     * Type: <b>UINT32</b>
     * 
     * The number of remote tunnel addresses.
     */
    numAddresses : UInt32

    /**
     * Type: [IPSEC_TUNNEL_ENDPOINT0](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_tunnel_endpoint0)*</b>
     * 
     * [size_is(numAddresses)]
     * 
     * The remote tunnel end point address information.
     */
    remoteAddresses : IPSEC_TUNNEL_ENDPOINT0.Ptr

    static __New() {
        DefineProp(this.Prototype, 'localV6Address', { type: Int8[16], offset: 4 })
        DefineProp(this.Prototype, 'remoteV6Address', { type: Int8[16], offset: 20 })
        this.DeleteProp("__New")
    }
}
