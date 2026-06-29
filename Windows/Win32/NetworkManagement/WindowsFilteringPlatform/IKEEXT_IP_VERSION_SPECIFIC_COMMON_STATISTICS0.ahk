#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Various statistics common to IKE and Authip. (IKEEXT_IP_VERSION_SPECIFIC_COMMON_STATISTICS0)
 * @see https://learn.microsoft.com/windows/win32/api/iketypes/ns-iketypes-ikeext_ip_version_specific_common_statistics0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct IKEEXT_IP_VERSION_SPECIFIC_COMMON_STATISTICS0 {
    #StructPack 4

    /**
     * Total number of UDP 500/4500 socket receive failures.
     */
    totalSocketReceiveFailures : UInt32

    /**
     * Total number of UDP 500/4500 socket send failures.
     */
    totalSocketSendFailures : UInt32

}
