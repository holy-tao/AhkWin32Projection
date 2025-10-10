#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\IPSEC_AUTH_TRANSFORM_ID0.ahk
#Include .\IPSEC_AUTH_TRANSFORM0.ahk
#Include .\FWP_BYTE_BLOB.ahk

/**
 * Stores information about the authentication algorithm of an IPsec security association (SA).
 * @remarks
 * 
  * <b>IPSEC_SA_AUTH_INFORMATION0</b> is a specific implementation of IPSEC_SA_AUTH_INFORMATION. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//ipsectypes/ns-ipsectypes-ipsec_sa_auth_information0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class IPSEC_SA_AUTH_INFORMATION0 extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Authentication algorithm details as specified by [IPSEC_AUTH_TRANSFORM0](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_auth_transform0).
     * @type {IPSEC_AUTH_TRANSFORM0}
     */
    authTransform{
        get {
            if(!this.HasProp("__authTransform"))
                this.__authTransform := IPSEC_AUTH_TRANSFORM0(this.ptr + 0)
            return this.__authTransform
        }
    }

    /**
     * Key used for the authentication algorithm stored in a [FWP_BYTE_BLOB](/windows/desktop/api/fwptypes/ns-fwptypes-fwp_byte_blob) structure.
     * @type {FWP_BYTE_BLOB}
     */
    authKey{
        get {
            if(!this.HasProp("__authKey"))
                this.__authKey := FWP_BYTE_BLOB(this.ptr + 16)
            return this.__authKey
        }
    }
}
