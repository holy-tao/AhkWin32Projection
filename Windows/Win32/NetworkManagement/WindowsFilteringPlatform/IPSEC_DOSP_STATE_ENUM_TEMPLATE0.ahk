#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FWP_V6_ADDR_AND_MASK.ahk" { FWP_V6_ADDR_AND_MASK }

/**
 * The IPSEC_DOSP_STATE_ENUM_TEMPLATE0 structure.
 * @remarks
 * <b>IPSEC_DOSP_STATE_ENUM_TEMPLATE0</b> is a specific implementation of IPSEC_DOSP_STATE_ENUM_TEMPLATE. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @see https://learn.microsoft.com/windows/win32/api/ipsectypes/ns-ipsectypes-ipsec_dosp_state_enum_template0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct IPSEC_DOSP_STATE_ENUM_TEMPLATE0 {
    #StructPack 1

    /**
     * An [FWP_V6_ADDR_AND_MASK](/windows/desktop/api/fwptypes/ns-fwptypes-fwp_v6_addr_and_mask) structure that specifies the public IPv6 address.
     */
    publicV6AddrMask : FWP_V6_ADDR_AND_MASK

    /**
     * An [FWP_V6_ADDR_AND_MASK](/windows/desktop/api/fwptypes/ns-fwptypes-fwp_v6_addr_and_mask) structure that specifies the internal IPv6 address.
     */
    internalV6AddrMask : FWP_V6_ADDR_AND_MASK

}
