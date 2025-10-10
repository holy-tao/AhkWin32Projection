#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * The EVENT_TRACE_HEADER structure contains standard event tracing information common to all events.
 * @remarks
 * 
  * Be sure to initialize the memory for this structure to zero before setting any members.
  * 
  * You can use the <b>KernelTime</b> and <b>UserTime</b> members to determine the CPU cost in units for a set of instructions (the values indicate the CPU usage charged to that thread at the time of logging). For example, if Event A and Event B are consecutively logged by the same thread and they have CPU usage numbers 150 and 175, then the activity that was performed by that thread between events A and B cost 25 CPU time units (175 – 150).
  * 
  * The <b>TimerResolution</b> of the <a href="https://docs.microsoft.com/windows/desktop/ETW/trace-logfile-header">TRACE_LOGFILE_HEADER</a> structure contains the resolution of the CPU usage timer in 100-nanosecond units. You can use the timer resolution with the kernel time and user time values to determine the amount of CPU time that the set of instructions used. For example, if the timer resolution is 156,250, then 25 CPU time units is 0.39 seconds (156,250 * 25 * 100 / 1,000,000,000). This is the amount of CPU time (not elapsed wall clock time) used by the set of instructions between events A and B. 
  * 
  * Note, however, that the CPU usage timer resolution is typically very low (around 10 or more milliseconds). Therefore, CPU usage numbers cannot be used to account for CPU time usage among threads with high accuracy. Rather, they are suitable for long term, statistical type of analysis.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//evntrace/ns-evntrace-event_trace_header
 * @namespace Windows.Win32.System.Diagnostics.Etw
 * @version v4.0.30319
 */
class EVENT_TRACE_HEADER extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Total number of bytes of the event. <b>Size</b> includes the size of the 
     * header structure, plus the size of any event-specific data appended to the header. 
     * 
     * On input, the size must be less than the size of the event tracing session's buffer minus 72 (0x48).
     * 
     * On output, do not use this number in calculations.
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    FieldTypeFlags {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * @type {Integer}
     */
    HeaderType {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    /**
     * @type {Integer}
     */
    MarkerFlags {
        get => NumGet(this, 3, "char")
        set => NumPut("char", value, this, 3)
    }

    class _Class extends Win32Struct {
        static sizeof => 4
        static packingSize => 4

        /**
         * @type {Integer}
         */
        Type {
            get => NumGet(this, 0, "char")
            set => NumPut("char", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        Level {
            get => NumGet(this, 1, "char")
            set => NumPut("char", value, this, 1)
        }
    
        /**
         * @type {Integer}
         */
        Version {
            get => NumGet(this, 2, "ushort")
            set => NumPut("ushort", value, this, 2)
        }
    
    }

    /**
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {_Class}
     */
    Class{
        get {
            if(!this.HasProp("__Class"))
                this.__Class := %this.__Class%._Class(this.ptr + 4)
            return this.__Class
        }
    }

    /**
     * On output, identifies the thread that generated the event. 
     * 
     * 
     * 
     * 
     * Note that on Windows 2000, <b>ThreadId</b> was a <b>ULONGLONG</b> value.
     * @type {Integer}
     */
    ThreadId {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * On output, identifies  the process that generated the event.
     * 
     * <b>Windows 2000:  </b>This member is not supported.
     * @type {Integer}
     */
    ProcessId {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * On output, contains the time that the event occurred. The resolution is system time unless the <b>ProcessTraceMode</b> member of <a href="https://docs.microsoft.com/windows/desktop/ETW/event-trace-logfile">EVENT_TRACE_LOGFILE</a> contains the PROCESS_TRACE_MODE_RAW_TIMESTAMP flag, in which case the resolution depends on the value of the <b>Wnode.ClientContext</b> member of <a href="https://docs.microsoft.com/windows/desktop/ETW/event-trace-properties">EVENT_TRACE_PROPERTIES</a> at the time the controller created the session.
     * @type {Integer}
     */
    TimeStamp {
        get => NumGet(this, 16, "int64")
        set => NumPut("int64", value, this, 16)
    }

    /**
     * @type {Pointer<Guid>}
     */
    Guid {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    GuidPtr {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    KernelTime {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    UserTime {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * @type {Integer}
     */
    ProcessorTime {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    ClientContext {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }
}
