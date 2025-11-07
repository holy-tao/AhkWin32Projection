#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Various information about an IPsec-specific access token.
 * @remarks
 * 
 * <b>IPSEC_TOKEN0</b> is a specific implementation of IPSEC_TOKEN. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//ipsectypes/ns-ipsectypes-ipsec_token0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class IPSEC_TOKEN0 extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * An [IPSEC_TOKEN_TYPE](/windows/desktop/api/ipsectypes/ne-ipsectypes-ipsec_token_type) value that specifies the type of token.
     * @type {Integer}
     */
    type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * An [IPSEC_TOKEN_PRINCIPAL](/windows/desktop/api/ipsectypes/ne-ipsectypes-ipsec_token_principal) value that specifies the token principal.
     * @type {Integer}
     */
    principal {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * An [IPSEC_TOKEN_MODE](/windows/desktop/api/ipsectypes/ne-ipsectypes-ipsec_token_mode) value that indicates in which mode the token was obtained.
     * @type {Integer}
     */
    mode {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Handle to the access token.  An <b>IPSEC_TOKEN_HANDLE</b> is of type <b>UINT64</b>.
     * @type {Integer}
     */
    token {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
