#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\MIB_IPMCAST_OIF_STATS_LH.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class MIB_IPMCAST_MFE_STATS_EX_XP extends Win32Struct
{
    static sizeof => 96

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dwGroup {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    dwSource {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    dwSrcMask {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    dwUpStrmNgbr {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    dwInIfIndex {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    dwInIfProtocol {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    dwRouteProtocol {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    dwRouteNetwork {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * @type {Integer}
     */
    dwRouteMask {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    ulUpTime {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * @type {Integer}
     */
    ulExpiryTime {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    ulNumOutIf {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * @type {Integer}
     */
    ulInPkts {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    ulInOctets {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * @type {Integer}
     */
    ulPktsDifferentIf {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * @type {Integer}
     */
    ulQueueOverflow {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * @type {Integer}
     */
    ulUninitMfe {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * @type {Integer}
     */
    ulNegativeMfe {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * @type {Integer}
     */
    ulInDiscards {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * @type {Integer}
     */
    ulInHdrErrors {
        get => NumGet(this, 76, "uint")
        set => NumPut("uint", value, this, 76)
    }

    /**
     * @type {Integer}
     */
    ulTotalOutPackets {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * @type {Array<MIB_IPMCAST_OIF_STATS_LH>}
     */
    rgmiosOutStats{
        get {
            if(!this.HasProp("__rgmiosOutStatsProxyArray"))
                this.__rgmiosOutStatsProxyArray := Win32FixedArray(this.ptr + 88, 1, MIB_IPMCAST_OIF_STATS_LH, "")
            return this.__rgmiosOutStatsProxyArray
        }
    }
}
