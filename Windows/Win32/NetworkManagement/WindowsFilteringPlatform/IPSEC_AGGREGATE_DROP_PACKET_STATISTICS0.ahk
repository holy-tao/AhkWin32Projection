#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Stores aggregate IPsec kernel packet drop statistics.Note  IPSEC_AGGREGATE_DROP_PACKET_STATISTICS0 is the specific implementation of IPSEC_AGGREGATE_DROP_PACKET_STATISTICS used in Windows Vista.
 * @see https://docs.microsoft.com/windows/win32/api//ipsectypes/ns-ipsectypes-ipsec_aggregate_drop_packet_statistics0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class IPSEC_AGGREGATE_DROP_PACKET_STATISTICS0 extends Win32Struct
{
    static sizeof => 36

    static packingSize => 4

    /**
     * Number of invalid SPIs on inbound.
     * @type {Integer}
     */
    invalidSpisOnInbound {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Number of decryption failures on inbound.
     * @type {Integer}
     */
    decryptionFailuresOnInbound {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Number of authentication failures on inbound.
     * @type {Integer}
     */
    authenticationFailuresOnInbound {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Number of UDP ESP validation failures on inbound.
     * @type {Integer}
     */
    udpEspValidationFailuresOnInbound {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Number of replay check failures on inbound.
     * @type {Integer}
     */
    replayCheckFailuresOnInbound {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Number of invalid clear text instances on inbound.
     * @type {Integer}
     */
    invalidClearTextInbound {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Number of inbound drops for packets received on SAs that were not fully initialized.
     * @type {Integer}
     */
    saNotInitializedOnInbound {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Number of inbound drops for packets received on SAs whose characteristics did not match the packet.
     * @type {Integer}
     */
    receiveOverIncorrectSaInbound {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Number of inbound IPsec secured packets that did not match any inbound IPsec transport layer filter.
     * @type {Integer}
     */
    secureReceivesNotMatchingFilters {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }
}
