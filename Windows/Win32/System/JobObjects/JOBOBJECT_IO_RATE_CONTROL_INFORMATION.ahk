#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information used to control the I/O rate for a job. This structure is used by the SetIoRateControlInformationJobObject and QueryIoRateControlInformationJobObject functions.
 * @remarks
 * 
 * <div class="alert"><b>Important</b>  Starting with Windows 10, version 1607, this structure is no longer supported.</div>
 * <div> </div>
 * You can only set one I/O rate control for a job in a hierarchy of nested jobs. The settings that you specify apply to that job and the child jobs in the hierarchy for that job.  The settings do not apply to the chain of jobs from the parent job up to the top of the hierarchy. You still can change the settings for the original job in the hierarchy on which you set I/O rate control. However, attempts to set values for the control of the I/O rate for any other jobs in the hierarchy, including the parent jobs, fail.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//jobapi2/ns-jobapi2-jobobject_io_rate_control_information
 * @namespace Windows.Win32.System.JobObjects
 * @version v4.0.30319
 */
class JOBOBJECT_IO_RATE_CONTROL_INFORMATION extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * The maximum limit for the I/O rate in I/O operations per second (IOPS). Set to 0 if to specify no limit.
     * 
     * When you set both <b>MaxIops</b> and <b>MaxBandwith</b>, the operating system enforces the first limit that the I/O rate reaches.
     * @type {Integer}
     */
    MaxIops {
        get => NumGet(this, 0, "int64")
        set => NumPut("int64", value, this, 0)
    }

    /**
     * The maximum limit for the I/O rate in bytes per second. Set to 0 to specify no limit.
     * 
     * When you set both <b>MaxBandwith</b> and <b>MaxIops</b>, the operating system enforces the first limit that the I/O rate reaches.
     * @type {Integer}
     */
    MaxBandwidth {
        get => NumGet(this, 8, "int64")
        set => NumPut("int64", value, this, 8)
    }

    /**
     * Sets a minimum I/O rate which the operating system reserves for the job. To make no reservation for the job, set this value to 0.
     * 
     * The operating system allows the job to perform I/O operations at this rate, if possible. If the sum of the minimum rates for all jobs exceeds the capacity of the operating system, the rate at which the operating system allows each job to perform I/O operations is proportional to the reservation for the job.
     * @type {Integer}
     */
    ReservationIops {
        get => NumGet(this, 16, "int64")
        set => NumPut("int64", value, this, 16)
    }

    /**
     * The NT device name for the volume to which you want to apply the policy for the I/O rate. For information about NT device names, see <a href="https://docs.microsoft.com/windows-hardware/drivers/kernel/nt-device-names">NT Device Names</a>.
     * 
     * If this member is <b>NULL</b>, the policy for the I/O rate applies to all of the volumes for the operating system. For example, if this member is <b>NULL</b> and the <b>MaxIops</b> member is 100, the maximum limit for the I/O rate for each volume is set to 100 IOPS, instead of setting an aggregate limit for the I/O rate across all volumes of 100 IOPS.
     * @type {PWSTR}
     */
    VolumeName {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * The base size of the normalized I/O unit, in bytes.  For example, if the <b>BaseIoSize</b> member is 8,000, every 8,000 bytes counts as one I/O unit. 4,000 bytes is also one I/O unit in this example, while 8,001 bytes is two I/O units.
     * 
     * You  can set the value of this base I/O size by using the <b>StorageBaseIOSize</b> value of the <b>HKEY_LOCAL_MACHINE</b>&#92;<b>SYSTEM</b>&#92;<b>CurrentControlSet</b>&#92;<b>Control</b>&#92;<b>QoS</b></p> registry key.
     * 
     * The value of the <b>BaseIoSize</b> member is subject to the following constraints:
     * 
     * <ul>
     * <li>The <a href="https://docs.microsoft.com/windows/desktop/api/jobapi2/nf-jobapi2-setioratecontrolinformationjobobject">SetIoRateControlInformationJobObject</a> function requires that the <b>BaseIoSize</b> member of the <b>JOBOBJECT_IO_RATE_CONTROL_INFORMATION</b> structure that you pass to the function is  0.</li>
     * <li>The <a href="https://docs.microsoft.com/windows/desktop/api/jobapi2/nf-jobapi2-queryioratecontrolinformationjobobject">QueryIoRateControlInformationJobObject</a> method sets the <b>BaseIoSize</b> member of this structure to 0 if the volume that the <b>VolumeName</b> member specifies does not support the control of the I/O rate.</li>
     * <li>The <a href="https://docs.microsoft.com/windows/desktop/api/jobapi2/nf-jobapi2-queryioratecontrolinformationjobobject">QueryIoRateControlInformationJobObject</a> method sets the <b>BaseIoSize</b> member of this structure to the base size of the normalized I/O unit   if the volume that the <b>VolumeName</b> member specifies does support the control of the I/O rate.</li>
     * </ul>
     * To query for the base size of the normalized I/O unit without creating a job, call <a href="https://docs.microsoft.com/windows/desktop/api/jobapi2/nf-jobapi2-queryioratecontrolinformationjobobject">QueryIoRateControlInformationJobObject</a> with the <i>hJob</i> parameter set to <b>NULL</b> from a process that is not associated with a job.
     * @type {Integer}
     */
    BaseIoSize {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * 
     * @type {Integer}
     */
    ControlFlags {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }
}
