#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IKEEXT_IP_VERSION_SPECIFIC_COMMON_STATISTICS0.ahk" { IKEEXT_IP_VERSION_SPECIFIC_COMMON_STATISTICS0 }

/**
 * Various statistics common to IKE and Authip. (IKEEXT_COMMON_STATISTICS0)
 * @see https://learn.microsoft.com/windows/win32/api/iketypes/ns-iketypes-ikeext_common_statistics0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct IKEEXT_COMMON_STATISTICS0 {
    #StructPack 4

    /**
     * IPv4 common statistics.
     * 
     * See <a href="https://docs.microsoft.com/windows/win32/api/iketypes/ns-iketypes-ikeext_ip_version_specific_common_statistics0">IKEEXT_IP_VERSION_SPECIFIC_COMMON_STATISTICS0</a> for more information.
     */
    v4Statistics : IKEEXT_IP_VERSION_SPECIFIC_COMMON_STATISTICS0

    /**
     * IPv6 common statistics.
     * 
     * See <a href="https://docs.microsoft.com/windows/win32/api/iketypes/ns-iketypes-ikeext_ip_version_specific_common_statistics0">IKEEXT_IP_VERSION_SPECIFIC_COMMON_STATISTICS0</a> for more information.
     */
    v6Statistics : IKEEXT_IP_VERSION_SPECIFIC_COMMON_STATISTICS0

    /**
     * Total number of packets received.
     */
    totalPacketsReceived : UInt32

    /**
     * Total number of invalid packets received.
     */
    totalInvalidPacketsReceived : UInt32

    /**
     * Current number of work items that are queued and waiting to be processed.
     */
    currentQueuedWorkitems : UInt32

}
