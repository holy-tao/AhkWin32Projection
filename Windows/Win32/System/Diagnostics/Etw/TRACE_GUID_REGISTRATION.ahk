#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Used with RegisterTraceGuids to register event trace classes.
 * @remarks
 * Be sure to initialize the memory for this structure to zero before setting any
  * members.
 * @see https://learn.microsoft.com/windows/win32/api/evntrace/ns-evntrace-trace_guid_registration
 * @namespace Windows.Win32.System.Diagnostics.Etw
 * @version v4.0.30319
 */
class TRACE_GUID_REGISTRATION extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Class GUID of an event trace class that you are registering.
     * @type {Pointer<Guid>}
     */
    Guid {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Handle to the registered event trace class. The
     * [RegisterTraceGuids](/windows/win32/api/evntrace/nf-evntrace-registertraceguidsa)
     * function generates this value.
     * 
     * Use this handle when you call the
     * [CreateTraceInstanceId](/windows/win32/api/evntrace/nf-evntrace-createtraceinstanceid)
     * function and to set the **RegHandle** member of
     * [EVENT_INSTANCE_HEADER](/windows/win32/api/evntrace/ns-evntrace-event_instance_header)
     * when calling the
     * [TraceEventInstance](/windows/win32/api/evntrace/nf-evntrace-traceeventinstance)
     * function.
     * @type {Pointer<Void>}
     */
    RegHandle {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
