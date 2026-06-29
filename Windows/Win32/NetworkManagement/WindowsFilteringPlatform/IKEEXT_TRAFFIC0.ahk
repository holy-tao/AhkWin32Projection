#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FWP_IP_VERSION.ahk" { FWP_IP_VERSION }

/**
 * Specifies the IKE/Authip traffic.
 * @remarks
 * <b>IKEEXT_TRAFFIC0</b> is a specific implementation of IKEEXT_TRAFFIC. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @see https://learn.microsoft.com/windows/win32/api/iketypes/ns-iketypes-ikeext_traffic0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct IKEEXT_TRAFFIC0 {
    #StructPack 8

    /**
     * IP version specified by [FWP_IP_VERSION](/windows/desktop/api/fwptypes/ne-fwptypes-fwp_ip_version).
     */
    ipVersion : FWP_IP_VERSION

    localV4Address : UInt32

    remoteV4Address : UInt32

    /**
     * Filter ID from quick mode (QM) policy of matching extended mode (EM) filter.
     */
    authIpFilterId : Int64

    static __New() {
        DefineProp(this.Prototype, 'localV6Address', { type: Int8[16], offset: 4 })
        DefineProp(this.Prototype, 'remoteV6Address', { type: Int8[16], offset: 20 })
        this.DeleteProp("__New")
    }
}
