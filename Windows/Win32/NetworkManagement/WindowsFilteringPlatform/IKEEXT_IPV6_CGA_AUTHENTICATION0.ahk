#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\FWP_BYTE_ARRAY16.ahk" { FWP_BYTE_ARRAY16 }

/**
 * Is used to specify various parameters for IPV6 cryptographically generated address (CGA) authentication.
 * @remarks
 * <b>IKEEXT_IPV6_CGA_AUTHENTICATION0</b> is a specific implementation of IKEEXT_IPV6_CGA_AUTHENTICATION. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @see https://learn.microsoft.com/windows/win32/api/iketypes/ns-iketypes-ikeext_ipv6_cga_authentication0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct IKEEXT_IPV6_CGA_AUTHENTICATION0 {
    #StructPack 8

    /**
     * Key container name of the public key/private key pair that was used to generate the CGA.
     * 
     * Same semantics as the <b>pwszContainerName</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_key_prov_info">CRYPT_KEY_PROV_INFO</a> structure.
     */
    keyContainerName : PWSTR

    /**
     * Name of the CSP that stores the key container. If <b>NULL</b>, default provider will be used.
     * 
     * Same semantics as the <b>pwszProvName</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_key_prov_info">CRYPT_KEY_PROV_INFO</a> structure.
     */
    cspName : PWSTR

    /**
     * Type of the CSP that stores the key container.
     * 
     * Same semantics as the <b>dwProvType</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_key_prov_info">CRYPT_KEY_PROV_INFO</a> structure.
     */
    cspType : UInt32

    /**
     * A [FWP_BYTE_ARRAY16](/windows/desktop/api/fwptypes/ns-fwptypes-fwp_byte_array16) structure containing a modifier used during CGA generation.
     * 
     * See CGA RFC for more information.
     */
    cgaModifier : FWP_BYTE_ARRAY16

    /**
     * Collision count used during CGA generation.
     * 
     * See CGA RFC for more information.
     */
    cgaCollisionCount : Int8

}
