#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IPSEC_AUTH_TRANSFORM_ID0.ahk" { IPSEC_AUTH_TRANSFORM_ID0 }
#Import ".\IPSEC_AUTH_TRANSFORM0.ahk" { IPSEC_AUTH_TRANSFORM0 }
#Import ".\IPSEC_CIPHER_TYPE.ahk" { IPSEC_CIPHER_TYPE }
#Import ".\IPSEC_CIPHER_TRANSFORM_ID0.ahk" { IPSEC_CIPHER_TRANSFORM_ID0 }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IPSEC_AUTH_TYPE.ahk" { IPSEC_AUTH_TYPE }
#Import ".\IPSEC_CIPHER_TRANSFORM0.ahk" { IPSEC_CIPHER_TRANSFORM0 }

/**
 * Is used to store hash and encryption specific information together for an SA transform in an IPsec quick mode policy.
 * @remarks
 * <b>IPSEC_AUTH_AND_CIPHER_TRANSFORM0</b> is a specific implementation of IPSEC_AUTH_AND_CIPHER_TRANSFORM. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @see https://learn.microsoft.com/windows/win32/api/ipsectypes/ns-ipsectypes-ipsec_auth_and_cipher_transform0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct IPSEC_AUTH_AND_CIPHER_TRANSFORM0 {
    #StructPack 8

    /**
     * Hash specific information as specified by [IPSEC_AUTH_TRANSFORM0](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_auth_transform0).
     */
    authTransform : IPSEC_AUTH_TRANSFORM0

    /**
     * Encryption specific information as specified by [IPSEC_CIPHER_TRANSFORM0](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_cipher_transform0).
     */
    cipherTransform : IPSEC_CIPHER_TRANSFORM0

}
