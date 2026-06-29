#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IPSEC_AUTH_TRANSFORM_ID0.ahk" { IPSEC_AUTH_TRANSFORM_ID0 }
#Import ".\IPSEC_AUTH_TRANSFORM0.ahk" { IPSEC_AUTH_TRANSFORM0 }
#Import ".\FWP_BYTE_BLOB.ahk" { FWP_BYTE_BLOB }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IPSEC_AUTH_TYPE.ahk" { IPSEC_AUTH_TYPE }

/**
 * Stores information about the authentication algorithm of an IPsec security association (SA).
 * @remarks
 * <b>IPSEC_SA_AUTH_INFORMATION0</b> is a specific implementation of IPSEC_SA_AUTH_INFORMATION. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @see https://learn.microsoft.com/windows/win32/api/ipsectypes/ns-ipsectypes-ipsec_sa_auth_information0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct IPSEC_SA_AUTH_INFORMATION0 {
    #StructPack 8

    /**
     * Authentication algorithm details as specified by [IPSEC_AUTH_TRANSFORM0](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_auth_transform0).
     */
    authTransform : IPSEC_AUTH_TRANSFORM0

    /**
     * Key used for the authentication algorithm stored in a [FWP_BYTE_BLOB](/windows/desktop/api/fwptypes/ns-fwptypes-fwp_byte_blob) structure.
     */
    authKey : FWP_BYTE_BLOB

}
