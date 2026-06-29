#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IKEEXT_IP_VERSION_SPECIFIC_KEYMODULE_STATISTICS0.ahk" { IKEEXT_IP_VERSION_SPECIFIC_KEYMODULE_STATISTICS0 }

/**
 * Contains various statistics specific to the keying module. (IKEEXT_KEYMODULE_STATISTICS0)
 * @see https://learn.microsoft.com/windows/win32/api/iketypes/ns-iketypes-ikeext_keymodule_statistics0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct IKEEXT_KEYMODULE_STATISTICS0 {
    #StructPack 4

    /**
     * IPv4 common statistics.
     * 
     * See <a href="https://docs.microsoft.com/windows/win32/api/iketypes/ns-iketypes-ikeext_ip_version_specific_keymodule_statistics0">IKEEXT_IP_VERSION_SPECIFIC_KEYMODULE_STATISTICS0</a> for more information.
     */
    v4Statistics : IKEEXT_IP_VERSION_SPECIFIC_KEYMODULE_STATISTICS0

    /**
     * IPv6 common statistics.
     * 
     * See <a href="https://docs.microsoft.com/windows/win32/api/iketypes/ns-iketypes-ikeext_ip_version_specific_keymodule_statistics0">IKEEXT_IP_VERSION_SPECIFIC_KEYMODULE_STATISTICS0</a> for more information.
     */
    v6Statistics : IKEEXT_IP_VERSION_SPECIFIC_KEYMODULE_STATISTICS0

    /**
     * Table containing the frequencies of various IKE Win32 error codes encountered during negotiations. The error codes range from ERROR_IPSEC_IKE_NEG_STATUS_BEGIN to ERROR_IPSEC_IKE_NEG_STATUS_END. 
     * 
     * The table size, IKEEXT_ERROR_CODE_COUNT, is 84 (ERROR_IPSEC_IKE_NEG_STATUS_END - ERROR_IPSEC_IKE_NEG_STATUS_BEGIN).
     */
    errorFrequencyTable : UInt32[97]

    /**
     * Current Main Mode negotiation time.
     */
    mainModeNegotiationTime : UInt32

    /**
     * Current Quick Mode negotiation time.
     */
    quickModeNegotiationTime : UInt32

    /**
     * Current Extended Mode negotiation time.  This member is applicable for Authip only.
     */
    extendedModeNegotiationTime : UInt32

}
