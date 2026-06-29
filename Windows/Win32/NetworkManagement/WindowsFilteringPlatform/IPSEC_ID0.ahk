#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IPSEC_TOKEN0.ahk" { IPSEC_TOKEN0 }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Contains information corresponding to identities that are authenticated by IPsec.
 * @remarks
 * <b>IPSEC_ID0</b> is a specific implementation of IPSEC_ID. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @see https://learn.microsoft.com/windows/win32/api/ipsectypes/ns-ipsectypes-ipsec_id0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct IPSEC_ID0 {
    #StructPack 8

    /**
     * Optional main mode target service principal name (SPN).  This is often the machine name.
     */
    mmTargetName : PWSTR

    /**
     * Optional extended mode target SPN.
     */
    emTargetName : PWSTR

    /**
     * Optional.  Number of [IPSEC_TOKEN0](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_token0) structures present in the <b>tokens</b> member.
     */
    numTokens : UInt32

    /**
     * Optional array of [IPSEC_TOKEN0](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_token0) structures.
     */
    tokens : IPSEC_TOKEN0.Ptr

    /**
     * Optional handle to explicit credentials.
     */
    explicitCredentials : Int64

    /**
     * Unused parameter. This should always be 0.
     */
    logonId : Int64

}
