#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\MINIDUMP_LOCATION_DESCRIPTOR.ahk
#Include .\MINIDUMP_MEMORY_DESCRIPTOR.ahk

/**
 * Contains information for a specific thread.
 * @see https://docs.microsoft.com/windows/win32/api//minidumpapiset/ns-minidumpapiset-minidump_thread
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class MINIDUMP_THREAD extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * The identifier of the thread.
     * @type {Integer}
     */
    ThreadId {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The suspend count for the thread. If the suspend count is greater than zero, the thread is suspended; otherwise, the thread is not suspended. The maximum value is MAXIMUM_SUSPEND_COUNT.
     * @type {Integer}
     */
    SuspendCount {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The priority class of the thread. See 
     * <a href="https://docs.microsoft.com/windows/desktop/ProcThread/scheduling-priorities">Scheduling Priorities</a>.
     * @type {Integer}
     */
    PriorityClass {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The priority level of the thread.
     * @type {Integer}
     */
    Priority {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * The thread environment block.
     * @type {Integer}
     */
    Teb {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_memory_descriptor">MINIDUMP_MEMORY_DESCRIPTOR</a> structure.
     * @type {MINIDUMP_MEMORY_DESCRIPTOR}
     */
    Stack{
        get {
            if(!this.HasProp("__Stack"))
                this.__Stack := MINIDUMP_MEMORY_DESCRIPTOR(this.ptr + 24)
            return this.__Stack
        }
    }

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_location_descriptor">MINIDUMP_LOCATION_DESCRIPTOR</a> structure.
     * @type {MINIDUMP_LOCATION_DESCRIPTOR}
     */
    ThreadContext{
        get {
            if(!this.HasProp("__ThreadContext"))
                this.__ThreadContext := MINIDUMP_LOCATION_DESCRIPTOR(this.ptr + 40)
            return this.__ThreadContext
        }
    }
}
