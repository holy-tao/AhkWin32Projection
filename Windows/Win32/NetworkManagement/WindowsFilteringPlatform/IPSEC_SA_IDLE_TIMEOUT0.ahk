#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The security association (SA) idle timeout in IPsec policy.
 * @remarks
 * <b>IPSEC_SA_IDLE_TIMEOUT0</b> is a specific implementation of IPSEC_SA_IDLE_TIMEOUT. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @see https://learn.microsoft.com/windows/win32/api/ipsectypes/ns-ipsectypes-ipsec_sa_idle_timeout0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct IPSEC_SA_IDLE_TIMEOUT0 {
    #StructPack 4

    /**
     * Specifies the amount of time in seconds after which IPsec SAs should become  idle.
     */
    idleTimeoutSeconds : UInt32

    /**
     * Specifies the amount of time in seconds after which IPsec SAs should become idle if the peer machine supports fail over.
     */
    idleTimeoutSecondsFailOver : UInt32

}
