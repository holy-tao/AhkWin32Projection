#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\..\Guid.ahk" { Guid }

/**
 * The EVENT_TRACE_HEADER structure contains standard event tracing information common to all events written by TraceEvent.
 * @remarks
 * Be sure to initialize the memory for this structure to zero before setting any
 * members.
 * 
 * You can use the **KernelTime** and **UserTime** members to determine the CPU
 * cost in units for a set of instructions (the values indicate the CPU usage
 * charged to that thread at the time of logging). For example, if Event A and
 * Event B are consecutively logged by the same thread and they have CPU usage
 * numbers 150 and 175, then the activity that was performed by that thread between
 * events A and B cost 25 CPU time units (175 – 150).
 * 
 * The **TimerResolution** of the
 * [TRACE_LOGFILE_HEADER](/windows/win32/api/evntrace/ns-evntrace-trace_logfile_header) structure
 * contains the resolution of the CPU usage timer in 100-nanosecond units. You can
 * use the timer resolution with the kernel time and user time values to determine
 * the amount of CPU time that the set of instructions used. For example, if the
 * timer resolution is 156,250, then 25 CPU time units is 0.39 seconds (156,250 \*
 * 25 \* 100 / 1,000,000,000). This is the amount of CPU time (not elapsed wall
 * clock time) used by the set of instructions between events A and B.
 * 
 * Note, however, that the CPU usage timer resolution is typically very low (around
 * 10 or more milliseconds). Therefore, CPU usage numbers cannot be used to account
 * for CPU time usage among threads with high accuracy. Rather, they are suitable
 * for long term, statistical type of analysis.
 * @see https://learn.microsoft.com/windows/win32/api/evntrace/ns-evntrace-event_trace_header
 * @namespace Windows.Win32.System.Diagnostics.Etw
 */
export default struct EVENT_TRACE_HEADER {
    #StructPack 8


    struct _Class {
        Type : Int8

        Level : Int8

        Version : UInt16

    }

    /**
     * Total number of bytes of the event. **Size** includes the size of the header
     * structure, plus the size of any event-specific data appended to the header.
     * 
     * On input, the size must be less than the size of the event tracing session's
     * buffer minus 72 (0x48).
     * 
     * On output, do not use this number in calculations.
     */
    Size : UInt16

    FieldTypeFlags : UInt16

    Version : UInt32

    /**
     * On output, identifies the thread that generated the event.
     * 
     * Note that on Windows 2000, **ThreadId** was a **ULONGLONG** value.
     */
    ThreadId : UInt32

    /**
     * On output, identifies the process that generated the event.
     * 
     * **Windows 2000:** This member is not supported.
     */
    ProcessId : UInt32

    /**
     * On output, contains the time that the event occurred. The resolution is system
     * time unless the **ProcessTraceMode** member of
     * [EVENT_TRACE_LOGFILE](/windows/win32/api/evntrace/ns-evntrace-event_trace_logfilea)
     * contains the `PROCESS_TRACE_MODE_RAW_TIMESTAMP` flag, in which case the
     * resolution depends on the value of the **Wnode.ClientContext** member of
     * [EVENT_TRACE_PROPERTIES](/windows/win32/api/evntrace/ns-evntrace-event_trace_properties)
     * at the time the controller created the session.
     */
    TimeStamp : Int64

    Guid : Guid

    KernelTime : UInt32

    UserTime : UInt32

    static __New() {
        DefineProp(this.Prototype, 'HeaderType', { type: Int8, offset: 2 })
        DefineProp(this.Prototype, 'MarkerFlags', { type: Int8, offset: 3 })
        DefineProp(this.Prototype, 'Class', { type: EVENT_TRACE_HEADER._Class, offset: 4 })
        DefineProp(this.Prototype, 'GuidPtr', { type: Int64, offset: 24 })
        DefineProp(this.Prototype, 'ProcessorTime', { type: Int64, offset: 40 })
        DefineProp(this.Prototype, 'ClientContext', { type: UInt32, offset: 40 })
        DefineProp(this.Prototype, 'Flags', { type: UInt32, offset: 44 })
        this.DeleteProp("__New")
    }
}
