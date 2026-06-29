#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Defines an unordered set of keying modules that will be tried for IPsec. (IPSEC_KEYING_POLICY0)
 * @remarks
 * <b>IPSEC_KEYING_POLICY0</b> is a specific implementation of IPSEC_KEYING_POLICY. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @see https://learn.microsoft.com/windows/win32/api/ipsectypes/ns-ipsectypes-ipsec_keying_policy0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct IPSEC_KEYING_POLICY0 {
    #StructPack 8

    /**
     * Number of keying modules in the array.
     */
    numKeyMods : UInt32

    /**
     * Array of distinct keying modules.
     */
    keyModKeys : Guid.Ptr

}
