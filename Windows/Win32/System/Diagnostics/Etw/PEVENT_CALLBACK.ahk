#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * ETW event consumers implement this callback to receive events from a trace processing session. The EventRecordCallback callback supersedes this callback.
 * @remarks
 * > [!Note]
 * > This callback is obsolete because it receives incomplete information
 * > about the event and is not compatible with event decoding helper APIs such as
 * > [TdhGetEventInformation](/windows/win32/api/tdh/nf-tdh-tdhgeteventinformation).
 * > Instead of implementing **EventCallback**, implement
 * > [EventRecordCallback](/windows/win32/api/evntrace/nc-evntrace-pevent_record_callback).
 * 
 * To specify the function that ETW calls to deliver the events, set the
 * **EventCallback** member of the
 * [EVENT_TRACE_LOGFILE](/windows/win32/api/evntrace/ns-evntrace-event_trace_logfilea)
 * structure that you pass to the
 * [OpenTrace](/windows/win32/api/evntrace/nf-evntrace-opentracea) function.
 * 
 * > [!Note]
 * > If your **EventCallback** function is receiving garbled data from
 * > **ProcessTrace**, double-check the flags specified in the `ProcessTraceMode`
 * > field of the `EVENT_TRACE_LOGFILE` structure that was provided to
 * > **OpenTrace**. `EVENT_TRACE_LOGFILE`'s **EventCallback** and
 * > **EventRecordCallback** fields are overlapping members of a union. If the
 * > `ProcessTraceMode` field includes the `PROCESS_TRACE_MODE_EVENT_RECORD` flag,
 * > **ProcessTrace** will invoke your callback using the **EventRecordCallback**
 * > function signature. Otherwise, **ProcessTrace** will invoke your callback
 * > using the **EventCallback** function signature.
 * 
 * After using [OpenTrace](/windows/win32/api/evntrace/nf-evntrace-opentracea) to
 * create the trace processing session, call the
 * [ProcessTrace](/windows/win32/api/evntrace/nf-evntrace-processtrace) function to
 * begin receiving the events.
 * 
 * When **ProcessTrace** begins processing events from a trace, it may invoke your
 * callback with one or more synthetic events that contain data about the trace
 * (metadata) rather than data from logged events. These synthetic events have
 * **Header.Guid** set to `EventTraceGuid` and **Header.Class.Type** set based on
 * the content of the synthetic event. For example, the first event from each trace
 * file will be a synthetic event with type 0 containing
 * [TRACE_LOGFILE_HEADER](/windows/win32/api/evntrace/ns-evntrace-trace_logfile_header)
 * information.
 * 
 * All the other events you receive contain provider-specific event data. You use
 * the **Header.Guid** and **Header.Class.Type** members of
 * [EVENT_TRACE](/windows/win32/api/evntrace/ns-evntrace-event_trace) to determine
 * the type of event you received. It is possible to hard-code decoding logic for
 * well-known event types, but most events will be decoded using MOF schema
 * information registered on the system in the `\\root\wmi` namespace. For
 * information on using an event's MOF schema to interpret the event, see
 * [Consuming Events](/windows/win32/etw/consuming-events).
 * @see https://learn.microsoft.com/windows/win32/api//content/evntrace/nc-evntrace-pevent_callback
 * @namespace Windows.Win32.System.Diagnostics.Etw
 * @version v4.0.30319
 */
class PEVENT_CALLBACK extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {Pointer<EVENT_TRACE>} pEvent 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(pEvent) {
        ComCall(3, this, "ptr", pEvent)
    }
}
