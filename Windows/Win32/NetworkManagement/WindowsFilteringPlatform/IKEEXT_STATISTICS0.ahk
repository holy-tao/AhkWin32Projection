#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IKEEXT_KEYMODULE_STATISTICS0.ahk" { IKEEXT_KEYMODULE_STATISTICS0 }
#Import ".\IKEEXT_IP_VERSION_SPECIFIC_KEYMODULE_STATISTICS0.ahk" { IKEEXT_IP_VERSION_SPECIFIC_KEYMODULE_STATISTICS0 }
#Import ".\IKEEXT_COMMON_STATISTICS0.ahk" { IKEEXT_COMMON_STATISTICS0 }
#Import ".\IKEEXT_IP_VERSION_SPECIFIC_COMMON_STATISTICS0.ahk" { IKEEXT_IP_VERSION_SPECIFIC_COMMON_STATISTICS0 }

/**
 * Stores various IKE/AuthIP statistics.
 * @see https://learn.microsoft.com/windows/win32/api/iketypes/ns-iketypes-ikeext_statistics0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct IKEEXT_STATISTICS0 {
    #StructPack 4

    /**
     * Statistics specific to IKE.
     * 
     * See [IKEEXT_KEYMODULE_STATISTICS0](/windows/desktop/api/iketypes/ns-iketypes-ikeext_keymodule_statistics0) for more information.
     */
    ikeStatistics : IKEEXT_KEYMODULE_STATISTICS0

    /**
     * Statistics specific to AuthIP.
     * 
     * See [IKEEXT_KEYMODULE_STATISTICS0](/windows/desktop/api/iketypes/ns-iketypes-ikeext_keymodule_statistics0) for more information.
     */
    authipStatistics : IKEEXT_KEYMODULE_STATISTICS0

    /**
     * Statistics common to IKE and AuthIP.
     * 
     * See [IKEEXT_COMMON_STATISTICS0](/windows/desktop/api/iketypes/ns-iketypes-ikeext_common_statistics0) for more information.
     */
    commonStatistics : IKEEXT_COMMON_STATISTICS0

}
