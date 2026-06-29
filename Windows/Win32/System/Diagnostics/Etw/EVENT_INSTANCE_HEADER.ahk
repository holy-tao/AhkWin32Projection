#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The EVENT_INSTANCE_HEADER structure contains standard event tracing information common to all events written by TraceEventInstance.
 * @remarks
 * Be sure to initialize the memory for this structure to zero before setting any
 * members.
 * @see https://learn.microsoft.com/windows/win32/api/evntrace/ns-evntrace-event_instance_header
 * @namespace Windows.Win32.System.Diagnostics.Etw
 */
export default struct EVENT_INSTANCE_HEADER {
    #StructPack 8


    struct _Class {
        Type : Int8

        Level : Int8

        Version : UInt16

    }

    /**
     * Total number of bytes of the event. **Size** must include the size of the
     * **EVENT_INSTANCE_HEADER** structure, plus the size of any event-specific data
     * appended to this structure. The size must be less than the size of the event
     * tracing session's buffer minus 72 (0x48).
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
     * On output, contains the time the event occurred, in 100-nanosecond intervals
     * since midnight, January 1, 1601.
     */
    TimeStamp : Int64

    /**
     * Handle to a registered event trace class. Set this property before calling the
     * [TraceEventInstance](/windows/win32/api/evntrace/nf-evntrace-traceeventinstance)
     * function.
     * 
     * The
     * [RegisterTraceGuids](/windows/win32/api/evntrace/nf-evntrace-registertraceguidsa)
     * function creates this handle (see the _TraceGuidReg_ parameter).
     */
    RegHandle : Int64

    /**
     * On output, contains the event trace instance identifier associated with
     * **RegHandle**.
     */
    InstanceId : UInt32

    /**
     * On output, contains the event trace instance identifier associated with
     * **ParentRegHandle**.
     */
    ParentInstanceId : UInt32

    KernelTime : UInt32

    UserTime : UInt32

    /**
     * Handle to a registered event trace class of a parent event. Set this property
     * before calling the
     * [TraceEventInstance](/windows/win32/api/evntrace/nf-evntrace-traceeventinstance)
     * function if you want to trace a hierarchical relationship (parent element/child
     * element) between related events.
     * 
     * The
     * [RegisterTraceGuids](/windows/win32/api/evntrace/nf-evntrace-registertraceguidsa)
     * function creates this handle (see the _TraceGuidReg_ parameter).
     */
    ParentRegHandle : Int64

    static __New() {
        DefineProp(this.Prototype, 'HeaderType', { type: Int8, offset: 2 })
        DefineProp(this.Prototype, 'MarkerFlags', { type: Int8, offset: 3 })
        DefineProp(this.Prototype, 'Class', { type: EVENT_INSTANCE_HEADER._Class, offset: 4 })
        DefineProp(this.Prototype, 'ProcessorTime', { type: Int64, offset: 40 })
        DefineProp(this.Prototype, 'EventId', { type: UInt32, offset: 40 })
        DefineProp(this.Prototype, 'Flags', { type: UInt32, offset: 44 })
        this.DeleteProp("__New")
    }
}
