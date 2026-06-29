#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IPSEC_AUTH_TRANSFORM_ID0.ahk" { IPSEC_AUTH_TRANSFORM_ID0 }
#Import ".\IPSEC_AUTH_TRANSFORM0.ahk" { IPSEC_AUTH_TRANSFORM0 }
#Import ".\IPSEC_CIPHER_TYPE.ahk" { IPSEC_CIPHER_TYPE }
#Import ".\IPSEC_CIPHER_TRANSFORM_ID0.ahk" { IPSEC_CIPHER_TRANSFORM_ID0 }
#Import ".\FWP_BYTE_BLOB.ahk" { FWP_BYTE_BLOB }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IPSEC_SA_CIPHER_INFORMATION0.ahk" { IPSEC_SA_CIPHER_INFORMATION0 }
#Import ".\IPSEC_AUTH_TYPE.ahk" { IPSEC_AUTH_TYPE }
#Import ".\IPSEC_SA_AUTH_INFORMATION0.ahk" { IPSEC_SA_AUTH_INFORMATION0 }
#Import ".\IPSEC_CIPHER_TRANSFORM0.ahk" { IPSEC_CIPHER_TRANSFORM0 }

/**
 * Stores information about the authentication and encryption algorithms of an IPsec security association (SA).
 * @remarks
 * <b>IPSEC_SA_AUTH_AND_CIPHER_INFORMATION0</b> is a specific implementation of IPSEC_SA_AUTH_AND_CIPHER_INFORMATION. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @see https://learn.microsoft.com/windows/win32/api/ipsectypes/ns-ipsectypes-ipsec_sa_auth_and_cipher_information0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct IPSEC_SA_AUTH_AND_CIPHER_INFORMATION0 {
    #StructPack 8

    /**
     * Encryption algorithm information as specified by [IPSEC_SA_CIPHER_INFORMATION0](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_sa_cipher_information0).
     */
    saCipherInformation : IPSEC_SA_CIPHER_INFORMATION0

    /**
     * Authentication algorithm information as specified by [IPSEC_SA_AUTH_INFORMATION0](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_sa_auth_information0).
     */
    saAuthInformation : IPSEC_SA_AUTH_INFORMATION0

}
