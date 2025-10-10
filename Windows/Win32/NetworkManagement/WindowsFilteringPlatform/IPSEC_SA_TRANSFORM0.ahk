#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Is used to store an IPsec security association (SA) transform in an IPsec quick mode policy.
 * @remarks
 * 
  * <b>IPSEC_SA_TRANSFORM0</b> is a specific implementation of IPSEC_SA_TRANSFORM. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//ipsectypes/ns-ipsectypes-ipsec_sa_transform0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class IPSEC_SA_TRANSFORM0 extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Type of the SA transform.
     * 
     * See [IPSEC_TRANSFORM_TYPE](/windows/desktop/api/ipsectypes/ne-ipsectypes-ipsec_transform_type) for more information.
     * @type {Integer}
     */
    ipsecTransformType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Pointer<IPSEC_AUTH_TRANSFORM0>}
     */
    ahTransform {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<IPSEC_AUTH_TRANSFORM0>}
     */
    espAuthTransform {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<IPSEC_CIPHER_TRANSFORM0>}
     */
    espCipherTransform {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<IPSEC_AUTH_AND_CIPHER_TRANSFORM0>}
     */
    espAuthAndCipherTransform {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<IPSEC_AUTH_TRANSFORM0>}
     */
    espAuthFwTransform {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
