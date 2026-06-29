#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FWP_IP_VERSION.ahk" { FWP_IP_VERSION }

/**
 * Is used to store end points of a tunnel mode SA. (IPSEC_TUNNEL_ENDPOINTS1)
 * @remarks
 * For the unnamed union containing the local tunnel end point address, switch_type(FWP_IP_VERSION), switch_is(ipVersion).
 * @see https://learn.microsoft.com/windows/win32/api/ipsectypes/ns-ipsectypes-ipsec_tunnel_endpoints1
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct IPSEC_TUNNEL_ENDPOINTS1 {
    #StructPack 8

    /**
     * An [FWP_IP_VERSION](/windows/desktop/api/fwptypes/ne-fwptypes-fwp_ip_version) value that specifies the IP version. In tunnel mode, this is the version of the outer header.
     */
    ipVersion : FWP_IP_VERSION

    localV4Address : UInt32

    remoteV4Address : UInt32

    /**
     * Optional LUID of the local interface corresponding to the local address specified above.
     */
    localIfLuid : Int64

    static __New() {
        DefineProp(this.Prototype, 'localV6Address', { type: Int8[16], offset: 4 })
        DefineProp(this.Prototype, 'remoteV6Address', { type: Int8[16], offset: 20 })
        this.DeleteProp("__New")
    }
}
