#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IPSEC_TOKEN_PRINCIPAL.ahk" { IPSEC_TOKEN_PRINCIPAL }
#Import ".\IPSEC_TOKEN_TYPE.ahk" { IPSEC_TOKEN_TYPE }
#Import ".\IPSEC_TOKEN_MODE.ahk" { IPSEC_TOKEN_MODE }

/**
 * Various information about an IPsec-specific access token.
 * @remarks
 * <b>IPSEC_TOKEN0</b> is a specific implementation of IPSEC_TOKEN. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @see https://learn.microsoft.com/windows/win32/api/ipsectypes/ns-ipsectypes-ipsec_token0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct IPSEC_TOKEN0 {
    #StructPack 8

    /**
     * An [IPSEC_TOKEN_TYPE](/windows/desktop/api/ipsectypes/ne-ipsectypes-ipsec_token_type) value that specifies the type of token.
     */
    type : IPSEC_TOKEN_TYPE

    /**
     * An [IPSEC_TOKEN_PRINCIPAL](/windows/desktop/api/ipsectypes/ne-ipsectypes-ipsec_token_principal) value that specifies the token principal.
     */
    principal : IPSEC_TOKEN_PRINCIPAL

    /**
     * An [IPSEC_TOKEN_MODE](/windows/desktop/api/ipsectypes/ne-ipsectypes-ipsec_token_mode) value that indicates in which mode the token was obtained.
     */
    mode : IPSEC_TOKEN_MODE

    /**
     * Handle to the access token.  An <b>IPSEC_TOKEN_HANDLE</b> is of type <b>UINT64</b>.
     */
    token : Int64

}
