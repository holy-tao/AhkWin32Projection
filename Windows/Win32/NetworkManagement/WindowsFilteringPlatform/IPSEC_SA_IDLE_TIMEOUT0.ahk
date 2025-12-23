#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The security association (SA) idle timeout in IPsec policy.
 * @remarks
 * <b>IPSEC_SA_IDLE_TIMEOUT0</b> is a specific implementation of IPSEC_SA_IDLE_TIMEOUT. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @see https://learn.microsoft.com/windows/win32/api/ipsectypes/ns-ipsectypes-ipsec_sa_idle_timeout0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class IPSEC_SA_IDLE_TIMEOUT0 extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Specifies the amount of time in seconds after which IPsec SAs should become  idle.
     * @type {Integer}
     */
    idleTimeoutSeconds {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies the amount of time in seconds after which IPsec SAs should become idle if the peer machine supports fail over.
     * @type {Integer}
     */
    idleTimeoutSecondsFailOver {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
