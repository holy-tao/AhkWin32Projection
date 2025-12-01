#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about processor C-state policy settings.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-processor_power_policy_info
 * @namespace Windows.Win32.System.Power
 * @version v4.0.30319
 */
class PROCESSOR_POWER_POLICY_INFO extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    /**
     * The time that must expire before promotion or demotion is considered, in microseconds.
     * @type {Integer}
     */
    TimeCheck {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The minimum amount of time that must be spent in the idle loop to avoid demotion, in microseconds.
     * @type {Integer}
     */
    DemoteLimit {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The time that must be exceeded to cause promotion to a deeper idle state, in microseconds.
     * @type {Integer}
     */
    PromoteLimit {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The value that scales the threshold at which the power policy manager decreases the performance of the processor, expressed as a percentage.
     * @type {Integer}
     */
    DemotePercent {
        get => NumGet(this, 12, "char")
        set => NumPut("char", value, this, 12)
    }

    /**
     * The value that scales the threshold at which the power policy manager increases the performance of the processor, expressed as a percentage.
     * @type {Integer}
     */
    PromotePercent {
        get => NumGet(this, 13, "char")
        set => NumPut("char", value, this, 13)
    }

    /**
     * Reserved.
     * @type {Array<Byte>}
     */
    Spare{
        get {
            if(!this.HasProp("__SpareProxyArray"))
                this.__SpareProxyArray := Win32FixedArray(this.ptr + 14, 2, Primitive, "char")
            return this.__SpareProxyArray
        }
    }

    /**
     * This bitfield backs the following members:
     * - AllowDemotion
     * - AllowPromotion
     * - Reserved
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * When set, allows the kernel power policy manager to demote from the current state.
     * @type {Integer}
     */
    AllowDemotion {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * When set, allows the kernel power policy manager to promote from the current state.
     * @type {Integer}
     */
    AllowPromotion {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }
}
