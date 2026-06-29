#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains information about sent and received MAC frames.
 * @see https://learn.microsoft.com/windows/win32/api/wlanapi/ns-wlanapi-wlan_mac_frame_statistics
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct WLAN_MAC_FRAME_STATISTICS {
    #StructPack 8

    /**
     * Contains the number of successfully transmitted MSDU/MMPDUs.
     */
    ullTransmittedFrameCount : Int64

    /**
     * Contains the number of successfully received MSDU/MMPDUs.
     */
    ullReceivedFrameCount : Int64

    /**
     * Contains the number of frames discarded due to having a "Protected" status indicated in the frame control field.
     */
    ullWEPExcludedCount : Int64

    /**
     * Contains the number of MIC failures encountered while checking the integrity of packets received from the AP or peer station.
     */
    ullTKIPLocalMICFailures : Int64

    /**
     * Contains the number of TKIP replay errors detected.
     */
    ullTKIPReplays : Int64

    /**
     * Contains the number of TKIP protected packets that the NIC failed to decrypt.
     */
    ullTKIPICVErrorCount : Int64

    /**
     * Contains the number of received unicast fragments discarded by the replay mechanism.
     */
    ullCCMPReplays : Int64

    /**
     * Contains the number of received fragments discarded by the CCMP decryption algorithm.
     */
    ullCCMPDecryptErrors : Int64

    /**
     * Contains the number of WEP protected packets received for which a decryption key was not available on the NIC.
     */
    ullWEPUndecryptableCount : Int64

    /**
     * Contains the number of WEP protected packets the NIC failed to decrypt.
     */
    ullWEPICVErrorCount : Int64

    /**
     * Contains the number of encrypted packets that the NIC has successfully decrypted.
     */
    ullDecryptSuccessCount : Int64

    /**
     * Contains the number of encrypted packets that the NIC has failed to decrypt.
     */
    ullDecryptFailureCount : Int64

}
