#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\FWP_BYTE_ARRAY16.ahk

/**
 * Is used to specify various parameters for IPV6 cryptographically generated address (CGA) authentication.
 * @remarks
 * <b>IKEEXT_IPV6_CGA_AUTHENTICATION0</b> is a specific implementation of IKEEXT_IPV6_CGA_AUTHENTICATION. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @see https://learn.microsoft.com/windows/win32/api/iketypes/ns-iketypes-ikeext_ipv6_cga_authentication0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class IKEEXT_IPV6_CGA_AUTHENTICATION0 extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * Key container name of the public key/private key pair that was used to generate the CGA.
     * 
     * Same semantics as the <b>pwszContainerName</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_key_prov_info">CRYPT_KEY_PROV_INFO</a> structure.
     * @type {Pointer<Ptr>}
     */
    keyContainerName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Name of the CSP that stores the key container. If <b>NULL</b>, default provider will be used.
     * 
     * Same semantics as the <b>pwszProvName</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_key_prov_info">CRYPT_KEY_PROV_INFO</a> structure.
     * @type {Pointer<Ptr>}
     */
    cspName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type of the CSP that stores the key container.
     * 
     * Same semantics as the <b>dwProvType</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_key_prov_info">CRYPT_KEY_PROV_INFO</a> structure.
     * @type {Integer}
     */
    cspType {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * A [FWP_BYTE_ARRAY16](/windows/desktop/api/fwptypes/ns-fwptypes-fwp_byte_array16) structure containing a modifier used during CGA generation.
     * 
     * See CGA RFC for more information.
     * @type {FWP_BYTE_ARRAY16}
     */
    cgaModifier{
        get {
            if(!this.HasProp("__cgaModifier"))
                this.__cgaModifier := FWP_BYTE_ARRAY16(this.ptr + 24)
            return this.__cgaModifier
        }
    }

    /**
     * Collision count used during CGA generation.
     * 
     * See CGA RFC for more information.
     * @type {Integer}
     */
    cgaCollisionCount {
        get => NumGet(this, 40, "char")
        set => NumPut("char", value, this, 40)
    }
}
