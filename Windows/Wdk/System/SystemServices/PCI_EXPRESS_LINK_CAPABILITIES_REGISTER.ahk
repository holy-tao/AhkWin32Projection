#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class PCI_EXPRESS_LINK_CAPABILITIES_REGISTER extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * This bitfield backs the following members:
     * - MaximumLinkSpeed
     * - MaximumLinkWidth
     * - ActiveStatePMSupport
     * - L0sExitLatency
     * - L1ExitLatency
     * - ClockPowerManagement
     * - SurpriseDownErrorReportingCapable
     * - DataLinkLayerActiveReportingCapable
     * - LinkBandwidthNotificationCapability
     * - AspmOptionalityCompliance
     * - Rsvd
     * - PortNumber
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    MaximumLinkSpeed {
        get => (this._bitfield >> 0) & 0xF
        set => this._bitfield := ((value & 0xF) << 0) | (this._bitfield & ~(0xF << 0))
    }

    /**
     * @type {Integer}
     */
    MaximumLinkWidth {
        get => (this._bitfield >> 4) & 0x3F
        set => this._bitfield := ((value & 0x3F) << 4) | (this._bitfield & ~(0x3F << 4))
    }

    /**
     * @type {Integer}
     */
    ActiveStatePMSupport {
        get => (this._bitfield >> 10) & 0x3
        set => this._bitfield := ((value & 0x3) << 10) | (this._bitfield & ~(0x3 << 10))
    }

    /**
     * @type {Integer}
     */
    L0sExitLatency {
        get => (this._bitfield >> 12) & 0x7
        set => this._bitfield := ((value & 0x7) << 12) | (this._bitfield & ~(0x7 << 12))
    }

    /**
     * @type {Integer}
     */
    L1ExitLatency {
        get => (this._bitfield >> 15) & 0x7
        set => this._bitfield := ((value & 0x7) << 15) | (this._bitfield & ~(0x7 << 15))
    }

    /**
     * @type {Integer}
     */
    ClockPowerManagement {
        get => (this._bitfield >> 18) & 0x1
        set => this._bitfield := ((value & 0x1) << 18) | (this._bitfield & ~(0x1 << 18))
    }

    /**
     * @type {Integer}
     */
    SurpriseDownErrorReportingCapable {
        get => (this._bitfield >> 19) & 0x1
        set => this._bitfield := ((value & 0x1) << 19) | (this._bitfield & ~(0x1 << 19))
    }

    /**
     * @type {Integer}
     */
    DataLinkLayerActiveReportingCapable {
        get => (this._bitfield >> 20) & 0x1
        set => this._bitfield := ((value & 0x1) << 20) | (this._bitfield & ~(0x1 << 20))
    }

    /**
     * @type {Integer}
     */
    LinkBandwidthNotificationCapability {
        get => (this._bitfield >> 21) & 0x1
        set => this._bitfield := ((value & 0x1) << 21) | (this._bitfield & ~(0x1 << 21))
    }

    /**
     * @type {Integer}
     */
    AspmOptionalityCompliance {
        get => (this._bitfield >> 22) & 0x1
        set => this._bitfield := ((value & 0x1) << 22) | (this._bitfield & ~(0x1 << 22))
    }

    /**
     * @type {Integer}
     */
    Rsvd {
        get => (this._bitfield >> 23) & 0x1
        set => this._bitfield := ((value & 0x1) << 23) | (this._bitfield & ~(0x1 << 23))
    }

    /**
     * @type {Integer}
     */
    PortNumber {
        get => (this._bitfield >> 24) & 0xFF
        set => this._bitfield := ((value & 0xFF) << 24) | (this._bitfield & ~(0xFF << 24))
    }

    /**
     * @type {Integer}
     */
    AsULONG {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
