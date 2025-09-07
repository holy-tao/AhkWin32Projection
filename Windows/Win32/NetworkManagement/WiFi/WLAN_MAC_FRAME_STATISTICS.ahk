#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about sent and received MAC frames.
 * @see https://learn.microsoft.com/windows/win32/api/wlanapi/ns-wlanapi-wlan_mac_frame_statistics
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class WLAN_MAC_FRAME_STATISTICS extends Win32Struct
{
    static sizeof => 96

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
     * Contains the number of successfully received MSDU/MMPDUs.
     * @type {Integer}
     */
    ullReceivedFrameCount {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Contains the number of frames discarded due to having a "Protected" status indicated in the frame control field.
     * @type {Integer}
     */
    ullWEPExcludedCount {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Contains the number of MIC failures encountered while checking the integrity of packets received from the AP or peer station.
     * @type {Integer}
     */
    ullTKIPLocalMICFailures {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Contains the number of TKIP replay errors detected.
     * @type {Integer}
     */
    ullTKIPReplays {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Contains the number of TKIP protected packets that the NIC failed to decrypt.
     * @type {Integer}
     */
    ullTKIPICVErrorCount {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Contains the number of received unicast fragments discarded by the replay mechanism.
     * @type {Integer}
     */
    ullCCMPReplays {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Contains the number of received fragments discarded by the CCMP decryption algorithm.
     * @type {Integer}
     */
    ullCCMPDecryptErrors {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * Contains the number of WEP protected packets received for which a decryption key was not available on the NIC.
     * @type {Integer}
     */
    ullWEPUndecryptableCount {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * Contains the number of WEP protected packets the NIC failed to decrypt.
     * @type {Integer}
     */
    ullWEPICVErrorCount {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * Contains the number of encrypted packets that the NIC has successfully decrypted.
     * @type {Integer}
     */
    ullDecryptSuccessCount {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * Contains the number of encrypted packets that the NIC has failed to decrypt.
     * @type {Integer}
     */
    ullDecryptFailureCount {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }
}
