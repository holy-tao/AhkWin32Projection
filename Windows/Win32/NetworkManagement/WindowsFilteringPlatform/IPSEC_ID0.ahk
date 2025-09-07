#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information corresponding to identities that are authenticated by IPsec.
 * @remarks
 * <b>IPSEC_ID0</b> is a specific implementation of IPSEC_ID. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @see https://learn.microsoft.com/windows/win32/api/ipsectypes/ns-ipsectypes-ipsec_id0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class IPSEC_ID0 extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * Optional main mode target service principal name (SPN).  This is often the machine name.
     * @type {Pointer<Ptr>}
     */
    mmTargetName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Optional extended mode target SPN.
     * @type {Pointer<Ptr>}
     */
    emTargetName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Optional.  Number of [IPSEC_TOKEN0](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_token0) structures present in the <b>tokens</b> member.
     * @type {Integer}
     */
    numTokens {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Optional array of [IPSEC_TOKEN0](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_token0) structures.
     * @type {Pointer<IPSEC_TOKEN0>}
     */
    tokens {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Optional handle to explicit credentials.
     * @type {Integer}
     */
    explicitCredentials {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Unused parameter. This should always be 0.
     * @type {Integer}
     */
    logonId {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }
}
