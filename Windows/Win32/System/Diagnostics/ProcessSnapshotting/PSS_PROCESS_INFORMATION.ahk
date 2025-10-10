#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\FILETIME.ahk

/**
 * Holds process information returned by PssQuerySnapshot.
 * @remarks
 * 
  * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/processsnapshot/nf-processsnapshot-pssquerysnapshot">PssQuerySnapshot</a> returns a <b>PSS_PROCESS_INFORMATION</b> structure when the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/processsnapshot/ne-processsnapshot-pss_query_information_class">PSS_QUERY_INFORMATION_CLASS</a> member that the caller provides it is  <b>PSS_QUERY_PROCESS_INFORMATION</b>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//processsnapshot/ns-processsnapshot-pss_process_information
 * @namespace Windows.Win32.System.Diagnostics.ProcessSnapshotting
 * @version v4.0.30319
 */
class PSS_PROCESS_INFORMATION extends Win32Struct
{
    static sizeof => 704

    static packingSize => 8

    /**
     * The exit code of the process. If the process has not exited, this is set to <b>STILL_ACTIVE</b> (259).
     * @type {Integer}
     */
    ExitStatus {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The address to the process environment block (PEB). Reserved for use by the operating system.
     * @type {Pointer<Void>}
     */
    PebBaseAddress {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The affinity mask of the process.
     * @type {Pointer}
     */
    AffinityMask {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * The base priority level of the process.
     * @type {Integer}
     */
    BasePriority {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * The process ID.
     * @type {Integer}
     */
    ProcessId {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * The parent process ID.
     * @type {Integer}
     */
    ParentProcessId {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Flags about the process. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/processsnapshot/ne-processsnapshot-pss_process_flags">PSS_PROCESS_FLAGS</a>.
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 36, "int")
        set => NumPut("int", value, this, 36)
    }

    /**
     * The time the process was created. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a>.
     * @type {FILETIME}
     */
    CreateTime{
        get {
            if(!this.HasProp("__CreateTime"))
                this.__CreateTime := FILETIME(this.ptr + 40)
            return this.__CreateTime
        }
    }

    /**
     * If the process exited, the time of the exit. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a>.
     * @type {FILETIME}
     */
    ExitTime{
        get {
            if(!this.HasProp("__ExitTime"))
                this.__ExitTime := FILETIME(this.ptr + 48)
            return this.__ExitTime
        }
    }

    /**
     * The amount of time the process spent executing in kernel-mode. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a>.
     * @type {FILETIME}
     */
    KernelTime{
        get {
            if(!this.HasProp("__KernelTime"))
                this.__KernelTime := FILETIME(this.ptr + 56)
            return this.__KernelTime
        }
    }

    /**
     * The amount of time the process spent executing in user-mode. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a>.
     * @type {FILETIME}
     */
    UserTime{
        get {
            if(!this.HasProp("__UserTime"))
                this.__UserTime := FILETIME(this.ptr + 64)
            return this.__UserTime
        }
    }

    /**
     * The priority class.
     * @type {Integer}
     */
    PriorityClass {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * A memory usage counter. See the <a href="https://docs.microsoft.com/windows/desktop/api/psapi/nf-psapi-getprocessmemoryinfo">GetProcessMemoryInfo</a> function for more information.
     * @type {Pointer}
     */
    PeakVirtualSize {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * A memory usage counter. See the <a href="https://docs.microsoft.com/windows/desktop/api/psapi/nf-psapi-getprocessmemoryinfo">GetProcessMemoryInfo</a> function for more information.
     * @type {Pointer}
     */
    VirtualSize {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * A memory usage counter. See the <a href="https://docs.microsoft.com/windows/desktop/api/psapi/nf-psapi-getprocessmemoryinfo">GetProcessMemoryInfo</a> function for more information.
     * @type {Integer}
     */
    PageFaultCount {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * A memory usage counter. See the <a href="https://docs.microsoft.com/windows/desktop/api/psapi/nf-psapi-getprocessmemoryinfo">GetProcessMemoryInfo</a> function for more information.
     * @type {Pointer}
     */
    PeakWorkingSetSize {
        get => NumGet(this, 104, "ptr")
        set => NumPut("ptr", value, this, 104)
    }

    /**
     * A memory usage counter. See the <a href="https://docs.microsoft.com/windows/desktop/api/psapi/nf-psapi-getprocessmemoryinfo">GetProcessMemoryInfo</a> function for more information.
     * @type {Pointer}
     */
    WorkingSetSize {
        get => NumGet(this, 112, "ptr")
        set => NumPut("ptr", value, this, 112)
    }

    /**
     * A memory usage counter. See the <a href="https://docs.microsoft.com/windows/desktop/api/psapi/nf-psapi-getprocessmemoryinfo">GetProcessMemoryInfo</a> function for more information.
     * @type {Pointer}
     */
    QuotaPeakPagedPoolUsage {
        get => NumGet(this, 120, "ptr")
        set => NumPut("ptr", value, this, 120)
    }

    /**
     * A memory usage counter. See the <a href="https://docs.microsoft.com/windows/desktop/api/psapi/nf-psapi-getprocessmemoryinfo">GetProcessMemoryInfo</a> function for more information.
     * @type {Pointer}
     */
    QuotaPagedPoolUsage {
        get => NumGet(this, 128, "ptr")
        set => NumPut("ptr", value, this, 128)
    }

    /**
     * A memory usage counter. See the <a href="https://docs.microsoft.com/windows/desktop/api/psapi/nf-psapi-getprocessmemoryinfo">GetProcessMemoryInfo</a> function for more information.
     * @type {Pointer}
     */
    QuotaPeakNonPagedPoolUsage {
        get => NumGet(this, 136, "ptr")
        set => NumPut("ptr", value, this, 136)
    }

    /**
     * A memory usage counter. See the <a href="https://docs.microsoft.com/windows/desktop/api/psapi/nf-psapi-getprocessmemoryinfo">GetProcessMemoryInfo</a> function for more information.
     * @type {Pointer}
     */
    QuotaNonPagedPoolUsage {
        get => NumGet(this, 144, "ptr")
        set => NumPut("ptr", value, this, 144)
    }

    /**
     * A memory usage counter. See the <a href="https://docs.microsoft.com/windows/desktop/api/psapi/nf-psapi-getprocessmemoryinfo">GetProcessMemoryInfo</a> function for more information.
     * @type {Pointer}
     */
    PagefileUsage {
        get => NumGet(this, 152, "ptr")
        set => NumPut("ptr", value, this, 152)
    }

    /**
     * A memory usage counter. See the <a href="https://docs.microsoft.com/windows/desktop/api/psapi/nf-psapi-getprocessmemoryinfo">GetProcessMemoryInfo</a> function for more information.
     * @type {Pointer}
     */
    PeakPagefileUsage {
        get => NumGet(this, 160, "ptr")
        set => NumPut("ptr", value, this, 160)
    }

    /**
     * A memory usage counter. See the <a href="https://docs.microsoft.com/windows/desktop/api/psapi/nf-psapi-getprocessmemoryinfo">GetProcessMemoryInfo</a> function for more information.
     * @type {Pointer}
     */
    PrivateUsage {
        get => NumGet(this, 168, "ptr")
        set => NumPut("ptr", value, this, 168)
    }

    /**
     * Reserved for use by the operating system.
     * @type {Integer}
     */
    ExecuteFlags {
        get => NumGet(this, 176, "uint")
        set => NumPut("uint", value, this, 176)
    }

    /**
     * The full path to the process executable. If the path exceeds the allocated buffer size, it is truncated.
     * @type {String}
     */
    ImageFileName {
        get => StrGet(this.ptr + 180, 259, "UTF-16")
        set => StrPut(value, this.ptr + 180, 259, "UTF-16")
    }
}
