#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\..\..\..\Guid.ahk" { Guid }

/**
 * Used with RegisterTraceGuids to register event trace classes.
 * @remarks
 * Be sure to initialize the memory for this structure to zero before setting any
 * members.
 * @see https://learn.microsoft.com/windows/win32/api/evntrace/ns-evntrace-trace_guid_registration
 * @namespace Windows.Win32.System.Diagnostics.Etw
 */
export default struct TRACE_GUID_REGISTRATION {
    #StructPack 8

    /**
     * Class GUID of an event trace class that you are registering.
     */
    Guid : Guid.Ptr

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
     */
    RegHandle : HANDLE

}
