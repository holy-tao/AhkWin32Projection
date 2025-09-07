#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Stores IPsec traffic statistics. (IPSEC_TRAFFIC_STATISTICS1)
 * @see https://learn.microsoft.com/windows/win32/api/ipsectypes/ns-ipsectypes-ipsec_traffic_statistics1
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class IPSEC_TRAFFIC_STATISTICS1 extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * Specifies encrypted byte count.
     * @type {Integer}
     */
    encryptedByteCount {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies authenticated AH byte count.
     * @type {Integer}
     */
    authenticatedAHByteCount {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Specifies authenticated ESP byte count.
     * @type {Integer}
     */
    authenticatedESPByteCount {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Specifies transport byte count.
     * @type {Integer}
     */
    transportByteCount {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Specifies tunnel byte count.
     * @type {Integer}
     */
    tunnelByteCount {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Specifies offload byte count.
     * @type {Integer}
     */
    offloadByteCount {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * The total number of packets that were successfully transmitted.
     * @type {Integer}
     */
    totalSuccessfulPackets {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }
}
