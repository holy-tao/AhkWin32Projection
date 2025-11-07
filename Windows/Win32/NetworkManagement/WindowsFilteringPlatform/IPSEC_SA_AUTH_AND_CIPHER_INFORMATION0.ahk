#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\IPSEC_CIPHER_TRANSFORM_ID0.ahk
#Include .\IPSEC_CIPHER_TRANSFORM0.ahk
#Include .\FWP_BYTE_BLOB.ahk
#Include .\IPSEC_SA_CIPHER_INFORMATION0.ahk
#Include .\IPSEC_AUTH_TRANSFORM_ID0.ahk
#Include .\IPSEC_AUTH_TRANSFORM0.ahk
#Include .\IPSEC_SA_AUTH_INFORMATION0.ahk

/**
 * Stores information about the authentication and encryption algorithms of an IPsec security association (SA).
 * @remarks
 * 
 * <b>IPSEC_SA_AUTH_AND_CIPHER_INFORMATION0</b> is a specific implementation of IPSEC_SA_AUTH_AND_CIPHER_INFORMATION. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//ipsectypes/ns-ipsectypes-ipsec_sa_auth_and_cipher_information0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class IPSEC_SA_AUTH_AND_CIPHER_INFORMATION0 extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * Encryption algorithm information as specified by [IPSEC_SA_CIPHER_INFORMATION0](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_sa_cipher_information0).
     * @type {IPSEC_SA_CIPHER_INFORMATION0}
     */
    saCipherInformation{
        get {
            if(!this.HasProp("__saCipherInformation"))
                this.__saCipherInformation := IPSEC_SA_CIPHER_INFORMATION0(0, this)
            return this.__saCipherInformation
        }
    }

    /**
     * Authentication algorithm information as specified by [IPSEC_SA_AUTH_INFORMATION0](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_sa_auth_information0).
     * @type {IPSEC_SA_AUTH_INFORMATION0}
     */
    saAuthInformation{
        get {
            if(!this.HasProp("__saAuthInformation"))
                this.__saAuthInformation := IPSEC_SA_AUTH_INFORMATION0(32, this)
            return this.__saAuthInformation
        }
    }
}
