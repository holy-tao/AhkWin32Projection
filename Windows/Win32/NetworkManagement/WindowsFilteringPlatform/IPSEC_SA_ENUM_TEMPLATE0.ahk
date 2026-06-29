#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FWP_DIRECTION.ahk" { FWP_DIRECTION }

/**
 * Specifies a template used for restricting the enumeration of IPsec security associations (SAs).
 * @remarks
 * <b>IPSEC_SA_ENUM_TEMPLATE0</b> is a specific implementation of IPSEC_SA_ENUM_TEMPLATE. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @see https://learn.microsoft.com/windows/win32/api/ipsectypes/ns-ipsectypes-ipsec_sa_enum_template0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct IPSEC_SA_ENUM_TEMPLATE0 {
    #StructPack 4

    /**
     * Direction of the SA.
     * 
     * See [FWP_DIRECTION](/windows/desktop/api/fwptypes/ne-fwptypes-fwp_direction) for more information.
     */
    saDirection : FWP_DIRECTION

}
