#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_cdw11_feature_async_event_config
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_CDW11_FEATURE_ASYNC_EVENT_CONFIG extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * This bitfield backs the following members:
     * - CriticalWarnings
     * - NsAttributeNotices
     * - FwActivationNotices
     * - TelemetryLogNotices
     * - ANAChangeNotices
     * - PredictableLogChangeNotices
     * - LBAStatusNotices
     * - EnduranceEventNotices
     * - NormalNVMSubsystemShutdown
     * - Reserved0
     * - ZoneDescriptorNotices
     * - Reserved1
     * - DiscoveryLogPageChange
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    CriticalWarnings {
        get => (this._bitfield >> 0) & 0xFF
        set => this._bitfield := ((value & 0xFF) << 0) | (this._bitfield & ~(0xFF << 0))
    }

    /**
     * @type {Integer}
     */
    NsAttributeNotices {
        get => (this._bitfield >> 8) & 0x1
        set => this._bitfield := ((value & 0x1) << 8) | (this._bitfield & ~(0x1 << 8))
    }

    /**
     * @type {Integer}
     */
    FwActivationNotices {
        get => (this._bitfield >> 9) & 0x1
        set => this._bitfield := ((value & 0x1) << 9) | (this._bitfield & ~(0x1 << 9))
    }

    /**
     * @type {Integer}
     */
    TelemetryLogNotices {
        get => (this._bitfield >> 10) & 0x1
        set => this._bitfield := ((value & 0x1) << 10) | (this._bitfield & ~(0x1 << 10))
    }

    /**
     * @type {Integer}
     */
    ANAChangeNotices {
        get => (this._bitfield >> 11) & 0x1
        set => this._bitfield := ((value & 0x1) << 11) | (this._bitfield & ~(0x1 << 11))
    }

    /**
     * @type {Integer}
     */
    PredictableLogChangeNotices {
        get => (this._bitfield >> 12) & 0x1
        set => this._bitfield := ((value & 0x1) << 12) | (this._bitfield & ~(0x1 << 12))
    }

    /**
     * @type {Integer}
     */
    LBAStatusNotices {
        get => (this._bitfield >> 13) & 0x1
        set => this._bitfield := ((value & 0x1) << 13) | (this._bitfield & ~(0x1 << 13))
    }

    /**
     * @type {Integer}
     */
    EnduranceEventNotices {
        get => (this._bitfield >> 14) & 0x1
        set => this._bitfield := ((value & 0x1) << 14) | (this._bitfield & ~(0x1 << 14))
    }

    /**
     * @type {Integer}
     */
    NormalNVMSubsystemShutdown {
        get => (this._bitfield >> 15) & 0x1
        set => this._bitfield := ((value & 0x1) << 15) | (this._bitfield & ~(0x1 << 15))
    }

    /**
     * @type {Integer}
     */
    Reserved0 {
        get => (this._bitfield >> 16) & 0x7FF
        set => this._bitfield := ((value & 0x7FF) << 16) | (this._bitfield & ~(0x7FF << 16))
    }

    /**
     * @type {Integer}
     */
    ZoneDescriptorNotices {
        get => (this._bitfield >> 27) & 0x1
        set => this._bitfield := ((value & 0x1) << 27) | (this._bitfield & ~(0x1 << 27))
    }

    /**
     * @type {Integer}
     */
    Reserved1 {
        get => (this._bitfield >> 28) & 0x7
        set => this._bitfield := ((value & 0x7) << 28) | (this._bitfield & ~(0x7 << 28))
    }

    /**
     * @type {Integer}
     */
    DiscoveryLogPageChange {
        get => (this._bitfield >> 31) & 0x1
        set => this._bitfield := ((value & 0x1) << 31) | (this._bitfield & ~(0x1 << 31))
    }

    /**
     * @type {Integer}
     */
    AsUlong {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
