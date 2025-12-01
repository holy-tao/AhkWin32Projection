#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Represents information in the miscellaneous information stream.
 * @see https://learn.microsoft.com/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_misc_info_2
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class MINIDUMP_MISC_INFO_2 extends Win32Struct
{
    static sizeof => 44

    static packingSize => 4

    /**
     * The size of the structure, in bytes.
     * @type {Integer}
     */
    SizeOfInfo {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The flags that indicate the valid members of this structure. This member can be one or more of the 
     *       following values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MINIDUMP_MISC1_PROCESS_ID"></a><a id="minidump_misc1_process_id"></a><dl>
     * <dt><b>MINIDUMP_MISC1_PROCESS_ID</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>ProcessId</b> is used.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MINIDUMP_MISC1_PROCESS_TIMES"></a><a id="minidump_misc1_process_times"></a><dl>
     * <dt><b>MINIDUMP_MISC1_PROCESS_TIMES</b></dt>
     * <dt>0x00000002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>ProcessCreateTime</b>, <b>ProcessKernelTime</b>, and 
     *         <b>ProcessUserTime</b> are used.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MINIDUMP_MISC1_PROCESSOR_POWER_INFO"></a><a id="minidump_misc1_processor_power_info"></a><dl>
     * <dt><b>MINIDUMP_MISC1_PROCESSOR_POWER_INFO</b></dt>
     * <dt>0x00000004</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>ProcessorMaxMhz</b>, <b>ProcessorCurrentMhz</b>, 
     *         <b>ProcessorMhzLimit</b>, <b>ProcessorMaxIdleState</b>, and 
     *         <b>ProcessorCurrentIdleState</b> are used.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    Flags1 {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The identifier of the process. If <b>Flags1</b> does not specify 
     *       <b>MINIDUMP_MISC1_PROCESS_ID</b>, this member is unused.
     * @type {Integer}
     */
    ProcessId {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The creation time of the process, in <b>time_t</b> format. If 
     *       <b>Flags1</b> does not specify <b>MINIDUMP_MISC1_PROCESS_TIMES</b>, this 
     *       member is unused.
     * @type {Integer}
     */
    ProcessCreateTime {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * The time the process has executed in user mode, in seconds. The time that each of the threads of the 
     *       process has executed in user mode is determined, then all these times are summed to obtain this value. If 
     *       <b>Flags1</b> does not specify <b>MINIDUMP_MISC1_PROCESS_TIMES</b>, this 
     *       member is unused.
     * @type {Integer}
     */
    ProcessUserTime {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The time the process has executed in kernel mode, in seconds. The time that each of the threads of the 
     *       process has executed in kernel mode is determined, then all these times are summed to obtain this value. If 
     *       <b>Flags1</b> does not specify <b>MINIDUMP_MISC1_PROCESS_TIMES</b>, this 
     *       member is unused.
     * @type {Integer}
     */
    ProcessKernelTime {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * The maximum specified clock frequency of the system processor, in MHz. If <b>Flags1</b> 
     *       does not specify <b>MINIDUMP_MISC1_PROCESSOR_POWER_INFO</b>, this member is unused.
     * @type {Integer}
     */
    ProcessorMaxMhz {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * The processor clock frequency, in MHz. This number is the maximum specified processor clock frequency 
     *       multiplied by the current processor throttle. If <b>Flags1</b> does not specify 
     *       <b>MINIDUMP_MISC1_PROCESSOR_POWER_INFO</b>, this member is unused.
     * @type {Integer}
     */
    ProcessorCurrentMhz {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * The limit on the processor clock frequency, in MHz. This number is the maximum specified processor clock 
     *       frequency multiplied by the current processor thermal throttle limit. If <b>Flags1</b> does 
     *       not specify <b>MINIDUMP_MISC1_PROCESSOR_POWER_INFO</b>, this member is unused.
     * @type {Integer}
     */
    ProcessorMhzLimit {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * The maximum idle state of the processor. If <b>Flags1</b> does not specify 
     *       <b>MINIDUMP_MISC1_PROCESSOR_POWER_INFO</b>, this member is unused.
     * @type {Integer}
     */
    ProcessorMaxIdleState {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * The current idle state of the processor. If <b>Flags1</b> does not specify 
     *       <b>MINIDUMP_MISC1_PROCESSOR_POWER_INFO</b>, this member is unused.
     * @type {Integer}
     */
    ProcessorCurrentIdleState {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }
}
