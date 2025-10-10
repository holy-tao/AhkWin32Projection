#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\IPSEC_CIPHER_TRANSFORM_ID0.ahk
#Include .\IPSEC_CIPHER_TRANSFORM0.ahk
#Include .\FWP_BYTE_BLOB.ahk

/**
 * Stores information about the encryption algorithm of an IPsec security association (SA).
 * @remarks
 * 
  * <b>IPSEC_SA_CIPHER_INFORMATION0</b> is a specific implementation of IPSEC_SA_CIPHER_INFORMATION. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//ipsectypes/ns-ipsectypes-ipsec_sa_cipher_information0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class IPSEC_SA_CIPHER_INFORMATION0 extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Encryption algorithm specific details as specified by [IPSEC_CIPHER_TRANSFORM0](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_cipher_transform0).
     * @type {IPSEC_CIPHER_TRANSFORM0}
     */
    cipherTransform{
        get {
            if(!this.HasProp("__cipherTransform"))
                this.__cipherTransform := IPSEC_CIPHER_TRANSFORM0(this.ptr + 0)
            return this.__cipherTransform
        }
    }

    /**
     * Key used for the encryption algorithm as specified by [FWP_BYTE_BLOB](/windows/desktop/api/fwptypes/ns-fwptypes-fwp_byte_blob).
     * @type {FWP_BYTE_BLOB}
     */
    cipherKey{
        get {
            if(!this.HasProp("__cipherKey"))
                this.__cipherKey := FWP_BYTE_BLOB(this.ptr + 16)
            return this.__cipherKey
        }
    }
}
