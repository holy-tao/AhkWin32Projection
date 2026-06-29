#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PROCESSOR_POWER_POLICY_INFO.ahk" { PROCESSOR_POWER_POLICY_INFO }

/**
 * Contains information about processor performance control and C-states.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-processor_power_policy
 * @namespace Windows.Win32.System.Power
 */
export default struct PROCESSOR_POWER_POLICY {
    #StructPack 4

    /**
     * The current structure revision level.  Set this value by calling <a href="https://docs.microsoft.com/windows/desktop/api/powrprof/nf-powrprof-readprocessorpwrscheme">ReadProcessorPwrScheme</a> before using a  <b>PROCESSOR_POWER_POLICY</b> structure to set power policy.
     */
    Revision : UInt32

    /**
     * The current processor performance state policy. This member must be one of the values described in 
     * <a href="https://docs.microsoft.com/windows/desktop/Power/processor-performance-control-policy-constants">Processor Performance Control Policy Constants</a>.
     */
    DynamicThrottle : Int8

    /**
     * Reserved; set to zero.
     */
    Spare : Int8[3]

    /**
     * This bitfield backs the following members:
     * - DisableCStates
     * - Reserved
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    DisableCStates {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }
    /**
     * The number of elements in the <b>Policy</b> array.
     */
    PolicyCount : UInt32

    /**
     * An array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-processor_power_policy_info">PROCESSOR_POWER_POLICY_INFO</a> structures that defines values used to apply processor C-state policy settings. Policy[0] corresponds to ACPI C-state C1, Policy[1] corresponds to C2, and Policy[2] corresponds to C3. The <b>AllowPromotion</b> member determines whether the processor can be promoted to the state. For example, if Policy[0].AllowPromotion is 0, the computer cannot transition from C0 to C1.
     */
    Policy : PROCESSOR_POWER_POLICY_INFO[3]

}
