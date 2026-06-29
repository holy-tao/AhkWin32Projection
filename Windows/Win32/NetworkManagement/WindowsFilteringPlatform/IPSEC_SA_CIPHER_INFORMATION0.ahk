#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IPSEC_CIPHER_TYPE.ahk" { IPSEC_CIPHER_TYPE }
#Import ".\IPSEC_CIPHER_TRANSFORM_ID0.ahk" { IPSEC_CIPHER_TRANSFORM_ID0 }
#Import ".\FWP_BYTE_BLOB.ahk" { FWP_BYTE_BLOB }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IPSEC_CIPHER_TRANSFORM0.ahk" { IPSEC_CIPHER_TRANSFORM0 }

/**
 * Stores information about the encryption algorithm of an IPsec security association (SA).
 * @remarks
 * <b>IPSEC_SA_CIPHER_INFORMATION0</b> is a specific implementation of IPSEC_SA_CIPHER_INFORMATION. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @see https://learn.microsoft.com/windows/win32/api/ipsectypes/ns-ipsectypes-ipsec_sa_cipher_information0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct IPSEC_SA_CIPHER_INFORMATION0 {
    #StructPack 8

    /**
     * Encryption algorithm specific details as specified by [IPSEC_CIPHER_TRANSFORM0](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_cipher_transform0).
     */
    cipherTransform : IPSEC_CIPHER_TRANSFORM0

    /**
     * Key used for the encryption algorithm as specified by [FWP_BYTE_BLOB](/windows/desktop/api/fwptypes/ns-fwptypes-fwp_byte_blob).
     */
    cipherKey : FWP_BYTE_BLOB

}
