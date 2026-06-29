#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PROCESSOR_POWER_POLICY.ahk" { PROCESSOR_POWER_POLICY }
#Import ".\PROCESSOR_POWER_POLICY_INFO.ahk" { PROCESSOR_POWER_POLICY_INFO }

/**
 * Contains processor power policy settings that apply while the system is running on AC power or battery power.
 * @see https://learn.microsoft.com/windows/win32/api/powrprof/ns-powrprof-machine_processor_power_policy
 * @namespace Windows.Win32.System.Power
 */
export default struct MACHINE_PROCESSOR_POWER_POLICY {
    #StructPack 4

    /**
     * The current structure revision level. Set this value by calling <a href="https://docs.microsoft.com/windows/desktop/api/powrprof/nf-powrprof-readprocessorpwrscheme">ReadProcessorPwrScheme</a> before using a  <b>MACHINE_PROCESSOR_POWER_POLICY</b> structure to set power policy.
     */
    Revision : UInt32

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-processor_power_policy">PROCESSOR_POWER_POLICY</a> structure that defines the processor power policy settings used while the computer is running on AC power.
     */
    ProcessorPolicyAc : PROCESSOR_POWER_POLICY

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-processor_power_policy">PROCESSOR_POWER_POLICY</a> structure that defines the processor power policy settings used while the computer is running on battery power.
     */
    ProcessorPolicyDc : PROCESSOR_POWER_POLICY

}
