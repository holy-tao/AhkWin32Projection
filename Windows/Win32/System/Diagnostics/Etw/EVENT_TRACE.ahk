#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ETW_BUFFER_CONTEXT.ahk" { ETW_BUFFER_CONTEXT }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\EVENT_TRACE_HEADER.ahk" { EVENT_TRACE_HEADER }

/**
 * The EVENT_TRACE structure is used to deliver event information to an event trace consumer.
 * @remarks
 * [ProcessTrace](/windows/win32/api/evntrace/nf-evntrace-processtrace) passes this
 * structure to the consumer's
 * [EventCallback](/windows/win32/api/evntrace/nc-evntrace-pevent_callback)
 * callback function.
 * @see https://learn.microsoft.com/windows/win32/api/evntrace/ns-evntrace-event_trace
 * @namespace Windows.Win32.System.Diagnostics.Etw
 */
export default struct EVENT_TRACE {
    #StructPack 8

    /**
     * An
     * [EVENT_TRACE_HEADER](/windows/win32/api/evntrace/ns-evntrace-event_trace_header)
     * structure that contains standard event tracing information.
     */
    Header : EVENT_TRACE_HEADER

    /**
     * Instance identifier. Contains valid data when the provider calls the
     * [TraceEventInstance](/windows/win32/api/evntrace/nf-evntrace-traceeventinstance)
     * function to generate the event. Otherwise, the value is zero.
     */
    InstanceId : UInt32

    /**
     * Instance identifier for a parent event. Contains valid data when the provider
     * calls the
     * [TraceEventInstance](/windows/win32/api/evntrace/nf-evntrace-traceeventinstance)
     * function to generate the event. Otherwise, the value is zero.
     */
    ParentInstanceId : UInt32

    /**
     * Class GUID of the parent event. Contains valid data when the provider calls the
     * [TraceEventInstance](/windows/win32/api/evntrace/nf-evntrace-traceeventinstance)
     * function to generate the event. Otherwise, the value is zero.
     */
    ParentGuid : Guid

    /**
     * Pointer to the beginning of the event-specific data for this event.
     */
    MofData : IntPtr

    /**
     * Number of bytes to which **MofData** points.
     */
    MofLength : UInt32

    ClientContext : UInt32

    static __New() {
        DefineProp(this.Prototype, 'BufferContext', { type: ETW_BUFFER_CONTEXT, offset: 84 })
        this.DeleteProp("__New")
    }
}
