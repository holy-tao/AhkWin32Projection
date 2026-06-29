#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\JOB_OBJECT_CPU_RATE_CONTROL.ahk" { JOB_OBJECT_CPU_RATE_CONTROL }

/**
 * Contains CPU rate control information for a job object. This structure is used by the SetInformationJobObject and QueryInformationJobObject functions with the JobObjectCpuRateControlInformation information class.
 * @remarks
 * You can set CPU rate control for multiple jobs in a  hierarchy of nested jobs. When you set CPU rate control for a job object, the settings apply to the job and its child jobs in the hierarchy. When you set CPU rate control for a job in a nested hierarchy, the system calculates the corresponding quotas with respect to the CPU rate control of the immediate parent job for the job. In other words, the rates set for the job represent its portion of the CPU rate that is allocated to its parent job.  If a job object does not have a parent with CPU rate control turned on in the chain of its parent jobs, the rate control for the job represents the portion of the CPU for the entire system.
 * 
 * CPU rate control cannot be used by job objects in applications running under <a href="https://docs.microsoft.com/windows/desktop/TermServ/terminal-services-portal">Remote Desktop Services</a> (formerly Terminal Services)  if Dynamic Fair Share Scheduling (DFSS) is in effect.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-jobobject_cpu_rate_control_information
 * @namespace Windows.Win32.System.JobObjects
 */
export default struct JOBOBJECT_CPU_RATE_CONTROL_INFORMATION {
    #StructPack 4

    ControlFlags : JOB_OBJECT_CPU_RATE_CONTROL

    CpuRate : UInt32

    static __New() {
        DefineProp(this.Prototype, 'Weight', { type: UInt32, offset: 4 })
        DefineProp(this.Prototype, 'MinRate', { type: UInt16, offset: 4 })
        DefineProp(this.Prototype, 'MaxRate', { type: UInt16, offset: 6 })
        this.DeleteProp("__New")
    }
}
