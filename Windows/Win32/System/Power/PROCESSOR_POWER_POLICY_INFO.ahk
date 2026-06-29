#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains information about processor C-state policy settings.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-processor_power_policy_info
 * @namespace Windows.Win32.System.Power
 */
export default struct PROCESSOR_POWER_POLICY_INFO {
    #StructPack 4

    /**
     * The time that must expire before promotion or demotion is considered, in microseconds.
     */
    TimeCheck : UInt32

    /**
     * The minimum amount of time that must be spent in the idle loop to avoid demotion, in microseconds.
     */
    DemoteLimit : UInt32

    /**
     * The time that must be exceeded to cause promotion to a deeper idle state, in microseconds.
     */
    PromoteLimit : UInt32

    /**
     * The value that scales the threshold at which the power policy manager decreases the performance of the processor, expressed as a percentage.
     */
    DemotePercent : Int8

    /**
     * The value that scales the threshold at which the power policy manager increases the performance of the processor, expressed as a percentage.
     */
    PromotePercent : Int8

    /**
     * Reserved.
     */
    Spare : Int8[2]

    /**
     * This bitfield backs the following members:
     * - AllowDemotion
     * - AllowPromotion
     * - Reserved
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    AllowDemotion {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    AllowPromotion {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }
}
