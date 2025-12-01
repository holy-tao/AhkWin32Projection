#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains CPU rate control information for a job object. This structure is used by the SetInformationJobObject and QueryInformationJobObject functions with the JobObjectCpuRateControlInformation information class.
 * @remarks
 * You can set CPU rate control for multiple jobs in a  hierarchy of nested jobs. When you set CPU rate control for a job object, the settings apply to the job and its child jobs in the hierarchy. When you set CPU rate control for a job in a nested hierarchy, the system calculates the corresponding quotas with respect to the CPU rate control of the immediate parent job for the job. In other words, the rates set for the job represent its portion of the CPU rate that is allocated to its parent job.  If a job object does not have a parent with CPU rate control turned on in the chain of its parent jobs, the rate control for the job represents the portion of the CPU for the entire system.
 * 
 * CPU rate control cannot be used by job objects in applications running under <a href="https://docs.microsoft.com/windows/desktop/TermServ/terminal-services-portal">Remote Desktop Services</a> (formerly Terminal Services)  if Dynamic Fair Share Scheduling (DFSS) is in effect.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-jobobject_cpu_rate_control_information
 * @namespace Windows.Win32.System.JobObjects
 * @version v4.0.30319
 */
class JOBOBJECT_CPU_RATE_CONTROL_INFORMATION extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * 
     * @type {Integer}
     */
    ControlFlags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    CpuRate {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    Weight {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    MinRate {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    MaxRate {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }
}
