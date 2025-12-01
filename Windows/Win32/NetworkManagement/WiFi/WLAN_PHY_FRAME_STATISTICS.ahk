#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about sent and received PHY frames.
 * @see https://learn.microsoft.com/windows/win32/api/wlanapi/ns-wlanapi-wlan_phy_frame_statistics
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class WLAN_PHY_FRAME_STATISTICS extends Win32Struct
{
    static sizeof => 144

    static packingSize => 8

    /**
     * Contains the number of successfully transmitted MSDU/MMPDUs.
     * @type {Integer}
     */
    ullTransmittedFrameCount {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Contains the number of successfully transmitted MSDU/MMPDUs in which the multicast bit is set as the destination MAC address.
     * @type {Integer}
     */
    ullMulticastTransmittedFrameCount {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Contains the number of MSDU/MMPDUs transmission failures due to the number of transmit attempts exceeding the retry limit.
     * @type {Integer}
     */
    ullFailedCount {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Contains the number of MSDU/MMPDUs successfully transmitted after one or more retransmissions.
     * @type {Integer}
     */
    ullRetryCount {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Contains the number of MSDU/MMPDUs successfully transmitted after more than one retransmission.
     * @type {Integer}
     */
    ullMultipleRetryCount {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Contains the number of fragmented MSDU/MMPDUs that failed to send due to timeout.
     * @type {Integer}
     */
    ullMaxTXLifetimeExceededCount {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Contains the number of MPDUs with an individual address in the address 1 field and MPDUs that have a multicast address  with types Data or Management.
     * @type {Integer}
     */
    ullTransmittedFragmentCount {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Contains the number of times a CTS has been received in response to an RTS.
     * @type {Integer}
     */
    ullRTSSuccessCount {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * Contains the number of times a CTS has not been received in response to an RTS.
     * @type {Integer}
     */
    ullRTSFailureCount {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * Contains the number of times an expected ACK has not been received.
     * @type {Integer}
     */
    ullACKFailureCount {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * Contains the number of MSDU/MMPDUs successfully received.
     * @type {Integer}
     */
    ullReceivedFrameCount {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * Contains the number of successfully received MSDU/MMPDUs with the multicast bit set in the MAC address.
     * @type {Integer}
     */
    ullMulticastReceivedFrameCount {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * Contains the number of MSDU/MMPDUs successfully received only because promiscuous mode is enabled.
     * @type {Integer}
     */
    ullPromiscuousReceivedFrameCount {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * Contains the number of fragmented MSDU/MMPDUs dropped due to timeout.
     * @type {Integer}
     */
    ullMaxRXLifetimeExceededCount {
        get => NumGet(this, 104, "uint")
        set => NumPut("uint", value, this, 104)
    }

    /**
     * Contains the number of frames received that the Sequence Control field indicates as a duplicate.
     * @type {Integer}
     */
    ullFrameDuplicateCount {
        get => NumGet(this, 112, "uint")
        set => NumPut("uint", value, this, 112)
    }

    /**
     * Contains the number of successfully received Data or Management MPDUs.
     * @type {Integer}
     */
    ullReceivedFragmentCount {
        get => NumGet(this, 120, "uint")
        set => NumPut("uint", value, this, 120)
    }

    /**
     * Contains the number of MPDUs successfully received only because promiscuous mode is enabled.
     * @type {Integer}
     */
    ullPromiscuousReceivedFragmentCount {
        get => NumGet(this, 128, "uint")
        set => NumPut("uint", value, this, 128)
    }

    /**
     * Contains the number of times an FCS error has been detected in a received MPDU.
     * @type {Integer}
     */
    ullFCSErrorCount {
        get => NumGet(this, 136, "uint")
        set => NumPut("uint", value, this, 136)
    }
}
