#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\PROCESSOR_POWER_POLICY_INFO.ahk
#Include .\PROCESSOR_POWER_POLICY.ahk

/**
 * Contains processor power policy settings that apply while the system is running on AC power or battery power.
 * @see https://docs.microsoft.com/windows/win32/api//powrprof/ns-powrprof-machine_processor_power_policy
 * @namespace Windows.Win32.System.Power
 * @version v4.0.30319
 */
class MACHINE_PROCESSOR_POWER_POLICY extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * The current structure revision level. Set this value by calling <a href="https://docs.microsoft.com/windows/desktop/api/powrprof/nf-powrprof-readprocessorpwrscheme">ReadProcessorPwrScheme</a> before using a  <b>MACHINE_PROCESSOR_POWER_POLICY</b> structure to set power policy.
     * @type {Integer}
     */
    Revision {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-processor_power_policy">PROCESSOR_POWER_POLICY</a> structure that defines the processor power policy settings used while the computer is running on AC power.
     * @type {PROCESSOR_POWER_POLICY}
     */
    ProcessorPolicyAc{
        get {
            if(!this.HasProp("__ProcessorPolicyAc"))
                this.__ProcessorPolicyAc := PROCESSOR_POWER_POLICY(8, this)
            return this.__ProcessorPolicyAc
        }
    }

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-processor_power_policy">PROCESSOR_POWER_POLICY</a> structure that defines the processor power policy settings used while the computer is running on battery power.
     * @type {PROCESSOR_POWER_POLICY}
     */
    ProcessorPolicyDc{
        get {
            if(!this.HasProp("__ProcessorPolicyDc"))
                this.__ProcessorPolicyDc := PROCESSOR_POWER_POLICY(48, this)
            return this.__ProcessorPolicyDc
        }
    }
}
