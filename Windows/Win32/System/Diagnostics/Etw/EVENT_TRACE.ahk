#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\EVENT_TRACE_HEADER.ahk
#Include .\ETW_BUFFER_CONTEXT.ahk

/**
 * The EVENT_TRACE structure is used to deliver event information to an event trace consumer.
 * @remarks
 * [ProcessTrace](/windows/win32/api/evntrace/nf-evntrace-processtrace) passes this
  * structure to the consumer's
  * [EventCallback](/windows/win32/api/evntrace/nc-evntrace-pevent_callback)
  * callback function.
 * @see https://learn.microsoft.com/windows/win32/api/evntrace/ns-evntrace-event_trace
 * @namespace Windows.Win32.System.Diagnostics.Etw
 * @version v4.0.30319
 */
class EVENT_TRACE extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * An
     * [EVENT_TRACE_HEADER](/windows/win32/api/evntrace/ns-evntrace-event_trace_header)
     * structure that contains standard event tracing information.
     * @type {EVENT_TRACE_HEADER}
     */
    Header{
        get {
            if(!this.HasProp("__Header"))
                this.__Header := EVENT_TRACE_HEADER(this.ptr + 0)
            return this.__Header
        }
    }

    /**
     * Instance identifier. Contains valid data when the provider calls the
     * [TraceEventInstance](/windows/win32/api/evntrace/nf-evntrace-traceeventinstance)
     * function to generate the event. Otherwise, the value is zero.
     * @type {Integer}
     */
    InstanceId {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Instance identifier for a parent event. Contains valid data when the provider
     * calls the
     * [TraceEventInstance](/windows/win32/api/evntrace/nf-evntrace-traceeventinstance)
     * function to generate the event. Otherwise, the value is zero.
     * @type {Integer}
     */
    ParentInstanceId {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * Class GUID of the parent event. Contains valid data when the provider calls the
     * [TraceEventInstance](/windows/win32/api/evntrace/nf-evntrace-traceeventinstance)
     * function to generate the event. Otherwise, the value is zero.
     * @type {Pointer<Guid>}
     */
    ParentGuid {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Pointer to the beginning of the event-specific data for this event.
     * @type {Pointer<Void>}
     */
    MofData {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * Number of bytes to which **MofData** points.
     * @type {Integer}
     */
    MofLength {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * @type {Integer}
     */
    ClientContext {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * @type {ETW_BUFFER_CONTEXT}
     */
    BufferContext{
        get {
            if(!this.HasProp("__BufferContext"))
                this.__BufferContext := ETW_BUFFER_CONTEXT(this.ptr + 68)
            return this.__BufferContext
        }
    }
}
