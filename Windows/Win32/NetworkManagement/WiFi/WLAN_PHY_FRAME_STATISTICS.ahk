#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains information about sent and received PHY frames.
 * @see https://learn.microsoft.com/windows/win32/api/wlanapi/ns-wlanapi-wlan_phy_frame_statistics
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct WLAN_PHY_FRAME_STATISTICS {
    #StructPack 8

    /**
     * Contains the number of successfully transmitted MSDU/MMPDUs.
     */
    ullTransmittedFrameCount : Int64

    /**
     * Contains the number of successfully transmitted MSDU/MMPDUs in which the multicast bit is set as the destination MAC address.
     */
    ullMulticastTransmittedFrameCount : Int64

    /**
     * Contains the number of MSDU/MMPDUs transmission failures due to the number of transmit attempts exceeding the retry limit.
     */
    ullFailedCount : Int64

    /**
     * Contains the number of MSDU/MMPDUs successfully transmitted after one or more retransmissions.
     */
    ullRetryCount : Int64

    /**
     * Contains the number of MSDU/MMPDUs successfully transmitted after more than one retransmission.
     */
    ullMultipleRetryCount : Int64

    /**
     * Contains the number of fragmented MSDU/MMPDUs that failed to send due to timeout.
     */
    ullMaxTXLifetimeExceededCount : Int64

    /**
     * Contains the number of MPDUs with an individual address in the address 1 field and MPDUs that have a multicast address  with types Data or Management.
     */
    ullTransmittedFragmentCount : Int64

    /**
     * Contains the number of times a CTS has been received in response to an RTS.
     */
    ullRTSSuccessCount : Int64

    /**
     * Contains the number of times a CTS has not been received in response to an RTS.
     */
    ullRTSFailureCount : Int64

    /**
     * Contains the number of times an expected ACK has not been received.
     */
    ullACKFailureCount : Int64

    /**
     * Contains the number of MSDU/MMPDUs successfully received.
     */
    ullReceivedFrameCount : Int64

    /**
     * Contains the number of successfully received MSDU/MMPDUs with the multicast bit set in the MAC address.
     */
    ullMulticastReceivedFrameCount : Int64

    /**
     * Contains the number of MSDU/MMPDUs successfully received only because promiscuous mode is enabled.
     */
    ullPromiscuousReceivedFrameCount : Int64

    /**
     * Contains the number of fragmented MSDU/MMPDUs dropped due to timeout.
     */
    ullMaxRXLifetimeExceededCount : Int64

    /**
     * Contains the number of frames received that the Sequence Control field indicates as a duplicate.
     */
    ullFrameDuplicateCount : Int64

    /**
     * Contains the number of successfully received Data or Management MPDUs.
     */
    ullReceivedFragmentCount : Int64

    /**
     * Contains the number of MPDUs successfully received only because promiscuous mode is enabled.
     */
    ullPromiscuousReceivedFragmentCount : Int64

    /**
     * Contains the number of times an FCS error has been detected in a received MPDU.
     */
    ullFCSErrorCount : Int64

}
