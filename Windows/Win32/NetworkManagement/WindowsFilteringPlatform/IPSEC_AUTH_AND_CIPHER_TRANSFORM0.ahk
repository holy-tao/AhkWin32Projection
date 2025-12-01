#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\IPSEC_AUTH_TRANSFORM_ID0.ahk
#Include .\IPSEC_AUTH_TRANSFORM0.ahk
#Include .\IPSEC_CIPHER_TRANSFORM_ID0.ahk
#Include .\IPSEC_CIPHER_TRANSFORM0.ahk

/**
 * Is used to store hash and encryption specific information together for an SA transform in an IPsec quick mode policy.
 * @remarks
 * <b>IPSEC_AUTH_AND_CIPHER_TRANSFORM0</b> is a specific implementation of IPSEC_AUTH_AND_CIPHER_TRANSFORM. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @see https://learn.microsoft.com/windows/win32/api/ipsectypes/ns-ipsectypes-ipsec_auth_and_cipher_transform0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class IPSEC_AUTH_AND_CIPHER_TRANSFORM0 extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Hash specific information as specified by [IPSEC_AUTH_TRANSFORM0](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_auth_transform0).
     * @type {IPSEC_AUTH_TRANSFORM0}
     */
    authTransform{
        get {
            if(!this.HasProp("__authTransform"))
                this.__authTransform := IPSEC_AUTH_TRANSFORM0(0, this)
            return this.__authTransform
        }
    }

    /**
     * Encryption specific information as specified by [IPSEC_CIPHER_TRANSFORM0](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_cipher_transform0).
     * @type {IPSEC_CIPHER_TRANSFORM0}
     */
    cipherTransform{
        get {
            if(!this.HasProp("__cipherTransform"))
                this.__cipherTransform := IPSEC_CIPHER_TRANSFORM0(16, this)
            return this.__cipherTransform
        }
    }
}
