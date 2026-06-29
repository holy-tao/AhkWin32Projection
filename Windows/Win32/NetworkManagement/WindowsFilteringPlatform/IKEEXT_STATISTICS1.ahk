#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IKEEXT_IP_VERSION_SPECIFIC_KEYMODULE_STATISTICS1.ahk" { IKEEXT_IP_VERSION_SPECIFIC_KEYMODULE_STATISTICS1 }
#Import ".\IKEEXT_COMMON_STATISTICS1.ahk" { IKEEXT_COMMON_STATISTICS1 }
#Import ".\IKEEXT_KEYMODULE_STATISTICS1.ahk" { IKEEXT_KEYMODULE_STATISTICS1 }
#Import ".\IKEEXT_IP_VERSION_SPECIFIC_COMMON_STATISTICS1.ahk" { IKEEXT_IP_VERSION_SPECIFIC_COMMON_STATISTICS1 }

/**
 * Stores various IKE, AuthIP, and IKEv2 statistics.
 * @see https://learn.microsoft.com/windows/win32/api/iketypes/ns-iketypes-ikeext_statistics1
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct IKEEXT_STATISTICS1 {
    #StructPack 4

    /**
     * Statistics specific to IKE.
     * 
     * See [IKEEXT_KEYMODULE_STATISTICS1](/windows/desktop/api/iketypes/ns-iketypes-ikeext_keymodule_statistics1) for more information.
     */
    ikeStatistics : IKEEXT_KEYMODULE_STATISTICS1

    /**
     * Statistics specific to AuthIP.
     * 
     * See [IKEEXT_KEYMODULE_STATISTICS1](/windows/desktop/api/iketypes/ns-iketypes-ikeext_keymodule_statistics1) for more information.
     */
    authipStatistics : IKEEXT_KEYMODULE_STATISTICS1

    /**
     * Statistics specific to IKEv2.
     * 
     * See [IKEEXT_KEYMODULE_STATISTICS1](/windows/desktop/api/iketypes/ns-iketypes-ikeext_keymodule_statistics1) for more information.
     */
    ikeV2Statistics : IKEEXT_KEYMODULE_STATISTICS1

    /**
     * Statistics common to IKE, AuthIP, and IKEv2.
     * 
     * See [IKEEXT_COMMON_STATISTICS1](/windows/desktop/api/iketypes/ns-iketypes-ikeext_common_statistics1) for more information.
     */
    commonStatistics : IKEEXT_COMMON_STATISTICS1

}
