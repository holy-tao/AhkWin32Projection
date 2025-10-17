#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\PROCESSOR_POWER_POLICY_INFO.ahk

/**
 * Contains information about processor performance control and C-states.
 * @see https://docs.microsoft.com/windows/win32/api//winnt/ns-winnt-processor_power_policy
 * @namespace Windows.Win32.System.Power
 * @version v4.0.30319
 */
class PROCESSOR_POWER_POLICY extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * The current structure revision level.  Set this value by calling <a href="https://docs.microsoft.com/windows/desktop/api/powrprof/nf-powrprof-readprocessorpwrscheme">ReadProcessorPwrScheme</a> before using a  <b>PROCESSOR_POWER_POLICY</b> structure to set power policy.
     * @type {Integer}
     */
    Revision {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The current processor performance state policy. This member must be one of the values described in 
     * <a href="https://docs.microsoft.com/windows/desktop/Power/processor-performance-control-policy-constants">Processor Performance Control Policy Constants</a>.
     * @type {Integer}
     */
    DynamicThrottle {
        get => NumGet(this, 4, "char")
        set => NumPut("char", value, this, 4)
    }

    /**
     * Reserved; set to zero.
     * @type {Array<Byte>}
     */
    Spare{
        get {
            if(!this.HasProp("__SpareProxyArray"))
                this.__SpareProxyArray := Win32FixedArray(this.ptr + 5, 3, Primitive, "char")
            return this.__SpareProxyArray
        }
    }

    /**
     * This bitfield backs the following members:
     * - DisableCStates
     * - Reserved
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Reserved; set to zero.
     * @type {Integer}
     */
    DisableCStates {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * The number of elements in the <b>Policy</b> array.
     * @type {Integer}
     */
    PolicyCount {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * An array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-processor_power_policy_info">PROCESSOR_POWER_POLICY_INFO</a> structures that defines values used to apply processor C-state policy settings. Policy[0] corresponds to ACPI C-state C1, Policy[1] corresponds to C2, and Policy[2] corresponds to C3. The <b>AllowPromotion</b> member determines whether the processor can be promoted to the state. For example, if Policy[0].AllowPromotion is 0, the computer cannot transition from C0 to C1.
     * @type {Array<PROCESSOR_POWER_POLICY_INFO>}
     */
    Policy{
        get {
            if(!this.HasProp("__PolicyProxyArray"))
                this.__PolicyProxyArray := Win32FixedArray(this.ptr + 16, 3, PROCESSOR_POWER_POLICY_INFO, "")
            return this.__PolicyProxyArray
        }
    }
}
