#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\FILETIME.ahk

/**
 * Holds thread information returned by PssWalkSnapshotPssWalkSnapshot.
 * @remarks
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/processsnapshot/nf-processsnapshot-psswalksnapshot">PssWalkSnapshot</a> returns a <b>PSS_THREAD_ENTRY</b> structure when the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/processsnapshot/ne-processsnapshot-pss_walk_information_class">PSS_WALK_INFORMATION_CLASS</a> member that the caller provides it is <b>PSS_WALK_THREADS</b>.
 * @see https://learn.microsoft.com/windows/win32/api/processsnapshot/ns-processsnapshot-pss_thread_entry
 * @namespace Windows.Win32.System.Diagnostics.ProcessSnapshotting
 * @version v4.0.30319
 */
class PSS_THREAD_ENTRY extends Win32Struct
{
    static sizeof => 120

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
     * The address of the thread environment block (TEB). Reserved for use by the operating system.
     * @type {Pointer<Void>}
     */
    TebBaseAddress {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The process ID.
     * @type {Integer}
     */
    ProcessId {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The thread ID.
     * @type {Integer}
     */
    ThreadId {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * The affinity mask of the process.
     * @type {Pointer}
     */
    AffinityMask {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * The thread’s dynamic priority level.
     * @type {Integer}
     */
    Priority {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * The base priority level of the process.
     * @type {Integer}
     */
    BasePriority {
        get => NumGet(this, 36, "int")
        set => NumPut("int", value, this, 36)
    }

    /**
     * Reserved for use by the operating system.
     * @type {Pointer<Void>}
     */
    LastSyscallFirstArgument {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Reserved for use by the operating system.
     * @type {Integer}
     */
    LastSyscallNumber {
        get => NumGet(this, 48, "ushort")
        set => NumPut("ushort", value, this, 48)
    }

    /**
     * The time the thread was created. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a>.
     * @type {FILETIME}
     */
    CreateTime{
        get {
            if(!this.HasProp("__CreateTime"))
                this.__CreateTime := FILETIME(52, this)
            return this.__CreateTime
        }
    }

    /**
     * If the thread exited, the time of the exit. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a>.
     * @type {FILETIME}
     */
    ExitTime{
        get {
            if(!this.HasProp("__ExitTime"))
                this.__ExitTime := FILETIME(60, this)
            return this.__ExitTime
        }
    }

    /**
     * The amount of time the thread spent executing in kernel mode. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a>.
     * @type {FILETIME}
     */
    KernelTime{
        get {
            if(!this.HasProp("__KernelTime"))
                this.__KernelTime := FILETIME(68, this)
            return this.__KernelTime
        }
    }

    /**
     * The amount of time the thread spent executing in user mode. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a>.
     * @type {FILETIME}
     */
    UserTime{
        get {
            if(!this.HasProp("__UserTime"))
                this.__UserTime := FILETIME(76, this)
            return this.__UserTime
        }
    }

    /**
     * A pointer to the thread procedure for thread.
     * @type {Pointer<Void>}
     */
    Win32StartAddress {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * The capture time of this thread. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a>.
     * @type {FILETIME}
     */
    CaptureTime{
        get {
            if(!this.HasProp("__CaptureTime"))
                this.__CaptureTime := FILETIME(96, this)
            return this.__CaptureTime
        }
    }

    /**
     * Flags about the thread. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/processsnapshot/ne-processsnapshot-pss_thread_flags">PSS_THREAD_FLAGS</a>.
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 104, "int")
        set => NumPut("int", value, this, 104)
    }

    /**
     * The    count of times the thread suspended.
     * @type {Integer}
     */
    SuspendCount {
        get => NumGet(this, 108, "ushort")
        set => NumPut("ushort", value, this, 108)
    }

    /**
     * The size of <i>ContextRecord</i>, in bytes.
     * @type {Integer}
     */
    SizeOfContextRecord {
        get => NumGet(this, 110, "ushort")
        set => NumPut("ushort", value, this, 110)
    }

    /**
     * A pointer to the context record if thread context information was captured. The pointer is valid for the lifetime of the walk marker passed to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/processsnapshot/nf-processsnapshot-psswalksnapshot">PssWalkSnapshot</a>.
     * @type {Pointer<CONTEXT>}
     */
    ContextRecord {
        get => NumGet(this, 112, "ptr")
        set => NumPut("ptr", value, this, 112)
    }
}
